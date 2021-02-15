<?php
/**
 * The template to display custom header from the ThemeREX Addons Layouts
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.06
 */

$drone_media_header_css = $drone_media_header_image = '';
$drone_media_header_video = drone_media_get_header_video();
if (true || empty($drone_media_header_video)) {
	$drone_media_header_image = get_header_image();
	if (drone_media_trx_addons_featured_image_override(has_post_thumbnail() && is_singular())) $drone_media_header_image = drone_media_get_current_mode_image($drone_media_header_image);
}

$drone_media_header_id = str_replace('header-custom-', '', drone_media_get_theme_option("header_style"));
if ((int) $drone_media_header_id == 0) {
	$drone_media_header_id = drone_media_get_post_id(array(
												'name' => $drone_media_header_id,
												'post_type' => defined('TRX_ADDONS_CPT_LAYOUTS_PT') ? TRX_ADDONS_CPT_LAYOUTS_PT : 'cpt_layouts'
												)
											);
} else {
	$drone_media_header_id = apply_filters('drone_media_filter_get_translated_layout', $drone_media_header_id);
}
$drone_media_header_meta = get_post_meta($drone_media_header_id, 'trx_addons_options', true);

?><header class="top_panel top_panel_custom top_panel_custom_<?php echo esc_attr($drone_media_header_id);
				?> top_panel_custom_<?php echo esc_attr(sanitize_title(get_the_title($drone_media_header_id)));
				echo !empty($drone_media_header_image) || !empty($drone_media_header_video) 
					? ' with_bg_image' 
					: ' without_bg_image';
				if ($drone_media_header_video!='') 
					echo ' with_bg_video';
				if ($drone_media_header_image!='') 
					echo ' '.esc_attr(drone_media_add_inline_css_class('background-image: url('.esc_url($drone_media_header_image).');'));
				if (!empty($drone_media_header_meta['margin']) != '') 
					echo ' '.esc_attr(drone_media_add_inline_css_class('margin-bottom: '.esc_attr(drone_media_prepare_css_value($drone_media_header_meta['margin'])).';'));
				if (is_single() && has_post_thumbnail()) 
					echo ' with_featured_image';
				if (drone_media_is_on(drone_media_get_theme_option('header_fullheight'))) 
					echo ' header_fullheight drone_media-full-height';
				?> scheme_<?php echo esc_attr(drone_media_is_inherit(drone_media_get_theme_option('header_scheme')) 
												? drone_media_get_theme_option('color_scheme') 
												: drone_media_get_theme_option('header_scheme'));
				?>"><?php

	// Background video
	if (!empty($drone_media_header_video)) {
		get_template_part( 'templates/header-video' );
	}
		
	// Custom header's layout
	do_action('drone_media_action_show_layout', $drone_media_header_id);

	// Header widgets area
	get_template_part( 'templates/header-widgets' );
		
?></header>