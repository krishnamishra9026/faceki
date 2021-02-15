<?php
/**
 * The template 'Style 1' to displaying related posts
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_link = get_permalink();
$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
?><div id="post-<?php the_ID(); ?>" 
	<?php post_class( 'related_item related_item_style_1 post_format_'.esc_attr($drone_media_post_format) ); ?>><?php
	drone_media_show_post_featured(array(
		'thumb_size' => drone_media_get_thumb_size( (int) drone_media_get_theme_option('related_posts') == 1 ? 'huge' : 'big' ),
		'show_no_image' => false,
		'singular' => false,
		'post_info' => '<div class="post_header entry-header">'
							. '<div class="post_categories">'.wp_kses_post(drone_media_get_post_categories('')).'</div>'
							. '<h6 class="post_title entry-title"><a href="'.esc_url($drone_media_link).'">'.esc_html(get_the_title()).'</a></h6>'
							. (in_array(get_post_type(), array('post', 'attachment'))
									? '<span class="post_date"><a href="'.esc_url($drone_media_link).'">'.wp_kses_data(drone_media_get_date()).'</a></span>'
									: '')
						. '</div>'
		)
	);
?></div>