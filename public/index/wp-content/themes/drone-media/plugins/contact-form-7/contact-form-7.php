<?php
/* Contact Form 7 support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_cf7_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_cf7_theme_setup9', 9 );
	function drone_media_cf7_theme_setup9() {
		
		if (drone_media_exists_cf7()) {
			add_action( 'wp_enqueue_scripts', 								'drone_media_cf7_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',						'drone_media_cf7_merge_styles' );
		}
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins',			'drone_media_cf7_tgmpa_required_plugins' );
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_cf7_tgmpa_required_plugins' ) ) {
	function drone_media_cf7_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'contact-form-7')) {
			// CF7 plugin
			$list[] = array(
					'name' 		=> drone_media_storage_get_array('required_plugins', 'contact-form-7'),
					'slug' 		=> 'contact-form-7',
					'required' 	=> false
			);
		}
		return $list;
	}
}



// Check if cf7 installed and activated
if ( !function_exists( 'drone_media_exists_cf7' ) ) {
	function drone_media_exists_cf7() {
		return class_exists('WPCF7');
	}
}
	
// Enqueue custom styles
if ( !function_exists( 'drone_media_cf7_frontend_scripts' ) ) {
	function drone_media_cf7_frontend_scripts() {
		if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/contact-form-7/contact-form-7.css')!='')
			wp_enqueue_style( 'drone-media-contact-form-7',  drone_media_get_file_url('plugins/contact-form-7/contact-form-7.css'), array(), null );
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_cf7_merge_styles' ) ) {
	function drone_media_cf7_merge_styles($list) {
		$list[] = 'plugins/contact-form-7/contact-form-7.css';
		return $list;
	}
}
?>