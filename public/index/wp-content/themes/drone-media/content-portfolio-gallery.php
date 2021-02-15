<?php
/**
 * The Gallery template to display posts
 *
 * Used for index/archive/search.
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_blog_style = explode('_', drone_media_get_theme_option('blog_style'));
$drone_media_columns = empty($drone_media_blog_style[1]) ? 2 : max(2, $drone_media_blog_style[1]);
$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
$drone_media_animation = drone_media_get_theme_option('blog_animation');
$drone_media_image = wp_get_attachment_image_src( get_post_thumbnail_id(get_the_ID()), 'full' );

?><article id="post-<?php the_ID(); ?>" 
	<?php post_class( 'post_item post_layout_portfolio post_layout_gallery post_layout_gallery_'.esc_attr($drone_media_columns).' post_format_'.esc_attr($drone_media_post_format) ); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>
	data-size="<?php if (!empty($drone_media_image[1]) && !empty($drone_media_image[2])) echo intval($drone_media_image[1]) .'x' . intval($drone_media_image[2]); ?>"
	data-src="<?php if (!empty($drone_media_image[0])) echo esc_url($drone_media_image[0]); ?>"
	>

	<?php

	// Sticky label
	if ( is_sticky() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}

	// Featured image
	$drone_media_image_hover = 'icon';
	if (in_array($drone_media_image_hover, array('icons', 'zoom'))) $drone_media_image_hover = 'dots';
	$drone_media_components = drone_media_is_inherit(drone_media_get_theme_option_from_meta('meta_parts')) 
								? 'categories,date,counters,share'
								: drone_media_array_get_keys_by_value(drone_media_get_theme_option('meta_parts'));
	$drone_media_counters = drone_media_is_inherit(drone_media_get_theme_option_from_meta('counters')) 
								? 'comments'
								: drone_media_array_get_keys_by_value(drone_media_get_theme_option('counters'));
	drone_media_show_post_featured(array(
		'hover' => $drone_media_image_hover,
		'thumb_size' => drone_media_get_thumb_size( strpos(drone_media_get_theme_option('body_style'), 'full')!==false || $drone_media_columns < 3 ? 'masonry-big' : 'masonry' ),
		'thumb_only' => true,
		'show_no_image' => true,
		'post_info' => '<div class="post_details">'
							. '<h2 class="post_title"><a href="'.esc_url(get_permalink()).'">'. esc_html(get_the_title()) . '</a></h2>'
							. '<div class="post_description">'
								. (!empty($drone_media_components)
										? drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
											'components' => $drone_media_components,
											'counters' => $drone_media_counters,
											'seo' => false,
											'echo' => false
											), $drone_media_blog_style[0], $drone_media_columns))
										: '')
								. '<div class="post_description_content">'
									. apply_filters('the_excerpt', get_the_excerpt())
								. '</div>'
								. '<a href="'.esc_url(get_permalink()).'" class="theme_button post_readmore"><span class="post_readmore_label">' . esc_html__('Learn more', 'drone-media') . '</span></a>'
							. '</div>'
						. '</div>'
	));
	?>
</article>