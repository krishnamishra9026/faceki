<?php
/**
 * The template to display default site header
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */


$drone_media_header_css = $drone_media_header_image = '';
$drone_media_header_video = drone_media_get_header_video();
if (true || empty($drone_media_header_video)) {
	$drone_media_header_image = get_header_image();
	if (drone_media_trx_addons_featured_image_override()) $drone_media_header_image = drone_media_get_current_mode_image($drone_media_header_image);
}

?><header class="top_panel top_panel_default<?php
					echo !empty($drone_media_header_image) || !empty($drone_media_header_video) ? ' with_bg_image' : ' without_bg_image';
					if ($drone_media_header_video!='') echo ' with_bg_video';
					if ($drone_media_header_image!='') echo ' '.esc_attr(drone_media_add_inline_css_class('background-image: url('.esc_url($drone_media_header_image).');'));
					if (is_single() && has_post_thumbnail()) echo ' with_featured_image';
					if (drone_media_is_on(drone_media_get_theme_option('header_fullheight'))) echo ' header_fullheight drone_media-full-height';
					?> scheme_<?php echo esc_attr(drone_media_is_inherit(drone_media_get_theme_option('header_scheme')) 
													? drone_media_get_theme_option('color_scheme') 
													: drone_media_get_theme_option('header_scheme'));
					?>"><?php

	// Background video
	if (!empty($drone_media_header_video)) {
		get_template_part( 'templates/header-video' );
	}
	
	// Main menu
	if (drone_media_get_theme_option("menu_style") == 'top') {
		get_template_part( 'templates/header-navi' );
	}

	// Page title and breadcrumbs area
	get_template_part( 'templates/header-title');

	// Header widgets area
	get_template_part( 'templates/header-widgets' );

	// Header for single posts
	get_template_part( 'templates/header-single' );

?></header>