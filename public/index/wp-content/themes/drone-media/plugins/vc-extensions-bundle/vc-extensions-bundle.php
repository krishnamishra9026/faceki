<?php
/* WPBakery PageBuilder Extensions Bundle support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_vc_extensions_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_vc_extensions_theme_setup9', 9 );
	function drone_media_vc_extensions_theme_setup9() {
		if (drone_media_exists_visual_composer()) {
			add_action( 'wp_enqueue_scripts', 								'drone_media_vc_extensions_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',						'drone_media_vc_extensions_merge_styles' );
		}
	
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins',		'drone_media_vc_extensions_tgmpa_required_plugins' );
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_vc_extensions_tgmpa_required_plugins' ) ) {
	function drone_media_vc_extensions_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'vc-extensions-bundle')) {
			$path = drone_media_get_file_dir('plugins/vc-extensions-bundle/vc-extensions-bundle.zip');
			if (!empty($path) || drone_media_get_theme_setting('tgmpa_upload')) {
				$list[] = array(
					'name' 		=> drone_media_storage_get_array('required_plugins', 'vc-extensions-bundle'),
					'slug' 		=> 'vc-extensions-bundle',
                    'version'   => '3.6.0',
					'source'	=> !empty($path) ? $path : 'upload://vc-extensions-bundle.zip',
					'required' 	=> false
				);
			}
		}
		return $list;
	}
}

// Check if VC Extensions installed and activated
if ( !function_exists( 'drone_media_exists_vc_extensions' ) ) {
	function drone_media_exists_vc_extensions() {
		return class_exists('Vc_Manager') && class_exists('VC_Extensions_CQBundle');
	}
}
	
// Enqueue VC custom styles
if ( !function_exists( 'drone_media_vc_extensions_frontend_scripts' ) ) {
	function drone_media_vc_extensions_frontend_scripts() {
		if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/vc-extensions-bundle/vc-extensions-bundle.css')!='')
			wp_enqueue_style( 'drone-media-vc-extensions-bundle',  drone_media_get_file_url('plugins/vc-extensions-bundle/vc-extensions-bundle.css'), array(), null );
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_vc_extensions_merge_styles' ) ) {
	function drone_media_vc_extensions_merge_styles($list) {
		$list[] = 'plugins/vc-extensions-bundle/vc-extensions-bundle.css';
		return $list;
	}
}
?>