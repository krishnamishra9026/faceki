<?php
/**
 * Plugin support: Gutenberg
 *
 * @package WordPress
 * @subpackage ThemeREX Addons
 * @since v1.0.49
 */

// Don't load directly
if ( ! defined( 'TRX_ADDONS_VERSION' ) ) {
	die( '-1' );
}
	
// Merge specific styles into single stylesheet
if ( !function_exists( 'trx_addons_gutenberg_merge_styles' ) ) {
	add_filter("trx_addons_filter_merge_styles", 'trx_addons_gutenberg_merge_styles');
	function trx_addons_gutenberg_merge_styles($list) {
		if (trx_addons_exists_gutenberg()) {
			$list[] = TRX_ADDONS_PLUGIN_API . 'gutenberg/gutenberg.css';
		}
		return $list;
	}
}

// Load required styles and scripts for Gutenberg Editor mode
if ( !function_exists( 'trx_addons_gutenberg_editor_load_scripts' ) ) {
	add_action("enqueue_block_editor_assets", 'trx_addons_gutenberg_editor_load_scripts');
	function trx_addons_gutenberg_editor_load_scripts() {
		trx_addons_load_scripts_admin();
		trx_addons_localize_scripts_admin();

		if ( trx_addons_get_setting( 'gutenberg_add_context' ) ) {
			wp_enqueue_style( 'trx_addons', trx_addons_get_file_url(TRX_ADDONS_PLUGIN_API . 'gutenberg/gutenberg-preview.css'), array(), null );
		}

		do_action('trx_addons_action_pagebuilder_admin_scripts');
	}
}

// Load required scripts for gutenberg Preview mode
if ( !function_exists( 'trx_addons_gutenberg_preview_load_scripts' ) ) {
	add_action("enqueue_block_assets", 'trx_addons_gutenberg_preview_load_scripts');
	function trx_addons_gutenberg_preview_load_scripts() {
		if (trx_addons_is_on(trx_addons_get_option('debug_mode'))) {
//			wp_enqueue_script( 'trx_addons-gutenberg-preview', trx_addons_get_file_url(TRX_ADDONS_PLUGIN_API . 'gutenberg/gutenberg.js'), array('jquery'), null, true );
		}
		do_action('trx_addons_action_pagebuilder_preview_scripts');
	}
}

// Add shortcode's specific vars to the JS storage
if ( !function_exists( 'trx_addons_gutenberg_localize_script' ) ) {
	add_filter("trx_addons_filter_localize_script", 'trx_addons_gutenberg_localize_script');
	function trx_addons_gutenberg_localize_script($vars) {
		return $vars;
	}
}

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if ( ! function_exists( 'trx_addons_gutenberg_theme_setup9' ) ) {
	add_action( 'after_setup_theme', 'trx_addons_gutenberg_theme_setup9', 8 );
	function trx_addons_gutenberg_theme_setup9() {

		if (trx_addons_exists_gutenberg()) {
			if ( ! trx_addons_get_setting( 'gutenberg_add_context' ) ) {
				$styles = array(
					trx_addons_get_file_url(TRX_ADDONS_PLUGIN_API . 'gutenberg/gutenberg-preview.css'),
					trx_addons_get_file_url(TRX_ADDONS_PLUGIN_EDITOR . 'css/trx_addons.editor.css')
				);

				add_editor_style( apply_filters( 'trx_addons_filter_add_editor_style', $styles ) );
			}
		} else {
			add_editor_style( trx_addons_get_file_url(TRX_ADDONS_PLUGIN_EDITOR . 'css/trx_addons.editor.css') );

		}

	}
}

// Save CSS with custom colors and fonts to the gutenberg-editor-style.css
if ( ! function_exists( 'trx_addons_gutenberg_save_css' ) ) {
	add_action( 'trx_addons_action_save_options', 'trx_addons_gutenberg_save_css', 20 );
	function trx_addons_gutenberg_save_css() {
		$msg = '/* ' . esc_html__( "ATTENTION! This file was generated automatically! Don't change it!!!", 'trx_addons' )
			. "\n----------------------------------------------------------------------- */\n";

		// Get main styles
		$css = trx_addons_fgc( trx_addons_get_file_dir( 'css/trx_addons.css' ) );


		// Add context class to each selector
		if ( trx_addons_get_setting( 'gutenberg_add_context' ) && function_exists( 'trx_addons_css_add_context' ) ) {
			$css = trx_addons_css_add_context(
				$css,
				array(
					'context' => '.edit-post-visual-editor ',
					'context_self' => array( 'html', 'body', '.edit-post-visual-editor' )
				)
			);
		} else {
			$css = apply_filters( 'trx_addons_filter_prepare_css', $css );
		}

		// Save styles to the file
		trx_addons_fpc( trx_addons_get_file_dir( 'components/api/gutenberg/gutenberg-preview.css' ), $msg . $css );
	}
}


//------------------------------------------------------------
//-- Compatibility Gutenberg and other PageBuilders
//-------------------------------------------------------------

// Prevent simultaneous editing of posts for Gutenberg and other PageBuilders (VC, Elementor)
if ( ! function_exists( 'trx_addons_gutenberg_disable_cpt' ) ) {
	add_action( 'current_screen', 'trx_addons_gutenberg_disable_cpt' );
	function trx_addons_gutenberg_disable_cpt() {
		$safe_pb = trx_addons_get_setting( 'gutenberg_safe_mode' );
		if ( !empty($safe_pb) && trx_addons_exists_gutenberg() ) {
			$current_post_type = get_current_screen()->post_type;
			$disable = false;
			if ( !$disable && in_array('vc', $safe_pb) && trx_addons_exists_visual_composer() ) {
				$post_types = function_exists('vc_editor_post_types') ? vc_editor_post_types() : array();
				$disable = is_array($post_types) && in_array($current_post_type, $post_types);
			}
			if ( $disable ) {
				remove_filter( 'replace_editor', 'gutenberg_init' );
				remove_action( 'load-post.php', 'gutenberg_intercept_edit_post' );
				remove_action( 'load-post-new.php', 'gutenberg_intercept_post_new' );
				remove_action( 'admin_init', 'gutenberg_add_edit_link_filters' );
				remove_filter( 'admin_url', 'gutenberg_modify_add_new_button_url' );
				remove_action( 'admin_print_scripts-edit.php', 'gutenberg_replace_default_add_new_button' );
				remove_action( 'admin_enqueue_scripts', 'gutenberg_editor_scripts_and_styles' );
				remove_filter( 'screen_options_show_screen', '__return_false' );
			}
		}
	}
}
