<?php
/* Mail Chimp support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_mailchimp_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_mailchimp_theme_setup9', 9 );
	function drone_media_mailchimp_theme_setup9() {
		if (drone_media_exists_mailchimp()) {
			add_action( 'wp_enqueue_scripts',							'drone_media_mailchimp_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',					'drone_media_mailchimp_merge_styles');
		}
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins',		'drone_media_mailchimp_tgmpa_required_plugins' );
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_mailchimp_tgmpa_required_plugins' ) ) {
	function drone_media_mailchimp_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'mailchimp-for-wp')) {
			$list[] = array(
				'name' 		=> drone_media_storage_get_array('required_plugins', 'mailchimp-for-wp'),
				'slug' 		=> 'mailchimp-for-wp',
				'required' 	=> false
			);
		}
		return $list;
	}
}

// Check if plugin installed and activated
if ( !function_exists( 'drone_media_exists_mailchimp' ) ) {
	function drone_media_exists_mailchimp() {
		return function_exists('__mc4wp_load_plugin') || defined('MC4WP_VERSION');
	}
}



// Custom styles and scripts
//------------------------------------------------------------------------

// Enqueue custom styles
if ( !function_exists( 'drone_media_mailchimp_frontend_scripts' ) ) {
	function drone_media_mailchimp_frontend_scripts() {
		if (drone_media_exists_mailchimp()) {
			if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/mailchimp-for-wp/mailchimp-for-wp.css')!='')
				wp_enqueue_style( 'drone-media-mailchimp-for-wp',  drone_media_get_file_url('plugins/mailchimp-for-wp/mailchimp-for-wp.css'), array(), null );
		}
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_mailchimp_merge_styles' ) ) {
	function drone_media_mailchimp_merge_styles($list) {
		$list[] = 'plugins/mailchimp-for-wp/mailchimp-for-wp.css';
		return $list;
	}
}


// Add plugin-specific colors and fonts to the custom CSS
if (drone_media_exists_mailchimp()) { require_once DRONE_MEDIA_THEME_DIR . 'plugins/mailchimp-for-wp/mailchimp-for-wp.styles.php'; }
?>