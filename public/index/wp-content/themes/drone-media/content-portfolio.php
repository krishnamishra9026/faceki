<?php
/**
 * The Portfolio template to display the content
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

?><article id="post-<?php the_ID(); ?>" 
	<?php post_class( 'post_item post_layout_portfolio post_layout_portfolio_'.esc_attr($drone_media_columns).' post_format_'.esc_attr($drone_media_post_format).(is_sticky() && !is_paged() ? ' sticky' : '') ); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>>
	<?php

	// Sticky label
	if ( is_sticky() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}

	$drone_media_image_hover = drone_media_get_theme_option('image_hover');
	// Featured image
	drone_media_show_post_featured(array(
		'thumb_size' => drone_media_get_thumb_size(strpos(drone_media_get_theme_option('body_style'), 'full')!==false || $drone_media_columns < 3 
								? 'masonry-big' 
								: 'masonry'),
		'show_no_image' => true,
		'class' => $drone_media_image_hover == 'dots' ? 'hover_with_info' : '',
		'post_info' => $drone_media_image_hover == 'dots' ? '<div class="post_info">'.esc_html(get_the_title()).'</div>' : ''
	));
	?>
</article>