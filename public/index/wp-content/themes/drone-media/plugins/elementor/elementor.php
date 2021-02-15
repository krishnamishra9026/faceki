<?php
/* Elementor Builder support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if ( ! function_exists( 'drone_media_elm_theme_setup9' ) ) {
	add_action( 'after_setup_theme', 'drone_media_elm_theme_setup9', 9 );
	function drone_media_elm_theme_setup9() {
		
	if ( drone_media_exists_elementor() ) {
		add_action( 'wp_enqueue_scripts', 'drone_media_elm_frontend_scripts', 1100 );
		add_action( 'wp_enqueue_scripts', 'drone_media_elm_responsive_styles', 2000 );

		add_action( 'init', 'drone_media_elm_init_once', 3 );

		add_action( 'elementor/editor/before_enqueue_scripts', 'drone_media_elm_editor_scripts' );
		add_action( 'elementor/element/before_section_end', 'drone_media_elm_add_color_scheme_control', 10, 3 );

		add_filter( 'drone_media_filter_merge_styles', 'drone_media_elm_merge_styles' );
		add_filter( 'drone_media_filter_merge_styles_responsive', 'drone_media_elm_merge_styles_responsive' );
	}
		if ( is_admin() ) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins', 'drone_media_elm_tgmpa_required_plugins' );
		
		}
	}
}

// Filter to add in the required plugins list
if ( ! function_exists( 'drone_media_elm_tgmpa_required_plugins' ) ) {
	function drone_media_elm_tgmpa_required_plugins( $list = array() ) {
		if ( drone_media_storage_isset( 'required_plugins', 'elementor' ) && drone_media_storage_get_array( 'required_plugins', 'elementor', 'install' ) !== false ) {
			$list[] = array(
				'name'     => drone_media_storage_get_array( 'required_plugins', 'elementor' ),
				'slug'     => 'elementor',
				'required' => false,
			);
		}
		return $list;
	}
}

// Check if Elementor is installed and activated
if ( ! function_exists( 'drone_media_exists_elementor' ) ) {
	function drone_media_exists_elementor() {
		return class_exists( 'Elementor\Plugin' );
	}
}

// Merge styles
if ( ! function_exists( 'drone_media_elm_merge_styles' ) ) {
    function drone_media_elm_merge_styles( $list ) {
		$list[] = 'plugins/elementor/elementor.css';	
		return $list;
    }
}

// Merge responsive styles
if ( ! function_exists( 'drone_media_elm_merge_styles_responsive' ) ) {
	function drone_media_elm_merge_styles_responsive( $list ) {
		$list[] = 'plugins/elementor/elementor-responsive.css';	
		return $list;
	}
}

// Enqueue styles for frontend
if ( ! function_exists( 'drone_media_elm_frontend_scripts' ) ) {
	function drone_media_elm_frontend_scripts() {
		$drone_media_url = drone_media_get_file_url( 'plugins/elementor/elementor.css' );
		if ( '' != $drone_media_url ) {
			wp_enqueue_style( 'drone-media-elementor', $drone_media_url, array(), null );
		}
	}
}


// Enqueue responsive styles for frontend
if ( ! function_exists( 'drone_media_elm_responsive_styles' ) ) {
	function drone_media_elm_responsive_styles() {
		$drone_media_url = drone_media_get_file_url( 'plugins/elementor/elementor-responsive.css' );
		if ( '' != $drone_media_url ) {
			wp_enqueue_style( 'drone-media-elementor-responsive', $drone_media_url, array(), null );
		}
	}
}

// Load required styles and scripts for Elementor Editor mode
if ( ! function_exists( 'drone_media_elm_editor_scripts' ) ) {
	function drone_media_elm_editor_scripts() {
		wp_enqueue_style( 'drone-media-icons', drone_media_get_file_url( 'css/font-icons/css/fontello.css' ), array(), null );
	}
}


// Add theme-specific controls to sections and columns
if ( ! function_exists( 'drone_media_elm_add_color_scheme_control' ) ) {
	function drone_media_elm_add_color_scheme_control( $element, $section_id, $args ) {
		if ( is_object( $element ) ) {
			$el_name = $element->get_name();
			// Add color scheme selector
			if ( apply_filters(
				'drone_media_filter_add_scheme_in_elements',
				( in_array( $el_name, array( 'section', 'column' ) ) && 'section_advanced' === $section_id )
							|| ( 'common' === $el_name && '_section_style' === $section_id ),
				$element, $section_id, $args
			) ) {
				$element->add_control(
					'scheme', array(
						'type'         => \Elementor\Controls_Manager::SELECT,
						'label'        => esc_html__( 'Color scheme', 'drone-media' ),
						'label_block'  => true,
						'options'      => drone_media_array_merge( array( '' => esc_html__( 'Inherit', 'drone-media' ) ), drone_media_get_list_schemes() ),
						'default'      => '',
						'prefix_class' => 'scheme_',
					)
				);
			}
		}
	}
}

// Set Elementor's options at once
if ( ! function_exists( 'drone_media_elm_init_once' ) ) {
	function drone_media_elm_init_once() {
		if ( drone_media_exists_elementor() && ! get_option( 'drone_media_setup_elementor_options', false ) ) {
			// Set theme-specific values to the Elementor's options
			// Disable DOM optimization for Elementor 3.0+
			update_option( 'elementor_optimized_dom_output', 'disabled' );
			update_option( 'elementor_disable_color_schemes', 'yes' );
			update_option( 'elementor_disable_typography_schemes', 'yes' );
			update_option( 'elementor_space_between_widgets', 0 );
			update_option( 'elementor_stretched_section_container', '.page_wrap' );
			update_option( 'elementor_page_title_selector', '.sc_layouts_title_caption' );
			// Set flag to prevent change Elementor's options again
			update_option( 'drone_media_setup_elementor_options', 1 );
		}
	}
}


?>