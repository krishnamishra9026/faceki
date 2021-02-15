<?php
/* TRX Updater support functions
------------------------------------------------------------------------------- */


// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_trx_updater_theme_setup9')) {
    add_action( 'after_setup_theme', 'drone_media_trx_updater_theme_setup9', 9 );
    function drone_media_trx_updater_theme_setup9() {
        if (is_admin()) {
            add_filter( 'drone_media_filter_tgmpa_required_plugins',		'drone_media_trx_updater_tgmpa_required_plugins' );
        }
    }
}

// Check if plugin installed and activated
if ( !function_exists( 'drone_media_exists_trx_updater' ) ) {
    function drone_media_exists_trx_updater() {
        return function_exists( 'trx_updater_load_plugin_textdomain' );
    }
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_trx_updater_tgmpa_required_plugins' ) ) {
    function drone_media_trx_updater_tgmpa_required_plugins($list=array()) {
            if (drone_media_storage_isset('required_plugins', 'trx_updater')) {
            $path = drone_media_get_file_dir('plugins/trx_updater/trx_updater.zip');
            $list[] = array(
                'name' 		=> drone_media_storage_get_array('required_plugins', 'trx_updater'),
                'slug' 		=> 'trx_updater',
                'source'	=> !empty($path) ? $path : 'upload://trx_updater.zip',
                'required' 	=> false,
                'version'	=> '1.4.1',
            );
        }
        return $list;
    }
}


?>