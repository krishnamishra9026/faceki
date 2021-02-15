<?php
/* Elegro Crypto Payment support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if ( ! function_exists( 'drone_media_elegro_payment_theme_setup9' ) ) {
	add_action( 'after_setup_theme', 'drone_media_elegro_payment_theme_setup9', 9 );
	function drone_media_elegro_payment_theme_setup9() {
		if ( is_admin() ) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins', 'drone_media_elegro_payment_tgmpa_required_plugins' );
		}
	}
}


// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_elegro_payment_tgmpa_required_plugins' ) ) {
    function drone_media_elegro_payment_tgmpa_required_plugins($list=array()) {
        if (drone_media_storage_isset('required_plugins', 'elegro-payment')) {
            $list[] = array(
                'name' 		=> drone_media_storage_get_array('required_plugins', 'elegro-payment'),
                'slug' 		=> 'elegro-payment',
                'required' 	=> false
            );
        }
        return $list;
    }
}



// Check if this plugin installed and activated
if ( ! function_exists( 'drone_media_exists_elegro_payment' ) ) {
	function drone_media_exists_elegro_payment() {
		return class_exists( 'WC_Elegro_Payment' );
	}
}


