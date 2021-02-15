<?php
/* Revolution Slider support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_revslider_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_revslider_theme_setup9', 9 );
	function drone_media_revslider_theme_setup9() {
		if (drone_media_exists_revslider()) {
			add_action( 'wp_enqueue_scripts', 					'drone_media_revslider_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',			'drone_media_revslider_merge_styles' );
		}
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins','drone_media_revslider_tgmpa_required_plugins' );
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_revslider_tgmpa_required_plugins' ) ) {
	function drone_media_revslider_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'revslider')) {
			$path = drone_media_get_file_dir('plugins/revslider/revslider.zip');
			if (!empty($path) || drone_media_get_theme_setting('tgmpa_upload')) {
				$list[] = array(
					'name' 		=> drone_media_storage_get_array('required_plugins', 'revslider'),
					'slug' 		=> 'revslider',
                    'version'   => '6.2.23',
					'source'	=> !empty($path) ? $path : 'upload://revslider.zip',
					'required' 	=> false
				);
			}
		}
		return $list;
	}
}

// Check if RevSlider installed and activated
if ( !function_exists( 'drone_media_exists_revslider' ) ) {
	function drone_media_exists_revslider() {
		return function_exists('rev_slider_shortcode');
	}
}
	
// Enqueue custom styles
if ( !function_exists( 'drone_media_revslider_frontend_scripts' ) ) {
	function drone_media_revslider_frontend_scripts() {
		if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/revslider/revslider.css')!='')
			wp_enqueue_style( 'drone-media-revslider',  drone_media_get_file_url('plugins/revslider/revslider.css'), array(), null );
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_revslider_merge_styles' ) ) {
	function drone_media_revslider_merge_styles($list) {
		$list[] = 'plugins/revslider/revslider.css';
		return $list;
	}
}
?>