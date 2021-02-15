<?php
/* Essential Grid support functions
------------------------------------------------------------------------------- */


// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_essential_grid_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_essential_grid_theme_setup9', 9 );
	function drone_media_essential_grid_theme_setup9() {
		if (drone_media_exists_essential_grid()) {
			add_action( 'wp_enqueue_scripts', 							'drone_media_essential_grid_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',					'drone_media_essential_grid_merge_styles' );
		}
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins',		'drone_media_essential_grid_tgmpa_required_plugins' );
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_essential_grid_tgmpa_required_plugins' ) ) {
	function drone_media_essential_grid_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'essential-grid')) {
			$path = drone_media_get_file_dir('plugins/essential-grid/essential-grid.zip');
			if (!empty($path) || drone_media_get_theme_setting('tgmpa_upload')) {
				$list[] = array(
						'name' 		=> drone_media_storage_get_array('required_plugins', 'essential-grid'),
						'slug' 		=> 'essential-grid',
						'version'   => '3.0.7',
						'source'	=> !empty($path) ? $path : 'upload://essential-grid.zip',
						'required' 	=> false
				);
			}
		}
		return $list;
	}
}

// Check if plugin installed and activated
if ( !function_exists( 'drone_media_exists_essential_grid' ) ) {
	function drone_media_exists_essential_grid() {
		return defined('EG_PLUGIN_PATH');
	}
}
	
// Enqueue plugin's custom styles
if ( !function_exists( 'drone_media_essential_grid_frontend_scripts' ) ) {
	function drone_media_essential_grid_frontend_scripts() {
		if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/essential-grid/essential-grid.css')!='')
			wp_enqueue_style( 'drone-media-essential-grid',  drone_media_get_file_url('plugins/essential-grid/essential-grid.css'), array(), null );
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_essential_grid_merge_styles' ) ) {
	function drone_media_essential_grid_merge_styles($list) {
		$list[] = 'plugins/essential-grid/essential-grid.css';
		return $list;
	}
}
?>