<?php
/**
 * The template to display posts in widgets and/or in the search results
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_post_id    = get_the_ID();
$drone_media_post_date  = drone_media_get_date();
$drone_media_post_title = get_the_title();
$drone_media_post_link  = get_permalink();
$drone_media_post_author_id   = get_the_author_meta('ID');
$drone_media_post_author_name = get_the_author_meta('display_name');
$drone_media_post_author_url  = get_author_posts_url($drone_media_post_author_id, '');

$drone_media_args = get_query_var('drone_media_args_widgets_posts');
$drone_media_show_date = isset($drone_media_args['show_date']) ? (int) $drone_media_args['show_date'] : 1;
$drone_media_show_image = isset($drone_media_args['show_image']) ? (int) $drone_media_args['show_image'] : 1;
$drone_media_show_author = isset($drone_media_args['show_author']) ? (int) $drone_media_args['show_author'] : 1;
$drone_media_show_counters = isset($drone_media_args['show_counters']) ? (int) $drone_media_args['show_counters'] : 1;
$drone_media_show_categories = isset($drone_media_args['show_categories']) ? (int) $drone_media_args['show_categories'] : 1;

$drone_media_output = drone_media_storage_get('drone_media_output_widgets_posts');

$drone_media_post_counters_output = '';
if ( $drone_media_show_counters ) {
	$drone_media_post_counters_output = '<span class="post_info_item post_info_counters">'
								. drone_media_get_post_counters('comments')
							. '</span>';
}


$drone_media_output .= '<article class="post_item with_thumb">';

if ($drone_media_show_image) {
	$drone_media_post_thumb = get_the_post_thumbnail($drone_media_post_id, drone_media_get_thumb_size('tiny'), array(
		'alt' => get_the_title()
	));
	if ($drone_media_post_thumb) $drone_media_output .= '<div class="post_thumb">' . ($drone_media_post_link ? '<a href="' . esc_url($drone_media_post_link) . '">' : '') . ($drone_media_post_thumb) . ($drone_media_post_link ? '</a>' : '') . '</div>';
}

$drone_media_output .= '<div class="post_content">'
			. ($drone_media_show_categories 
					? '<div class="post_categories">'
						. drone_media_get_post_categories()
						. $drone_media_post_counters_output
						. '</div>' 
					: '')
			. '<h6 class="post_title">' . ($drone_media_post_link ? '<a href="' . esc_url($drone_media_post_link) . '">' : '') . ($drone_media_post_title) . ($drone_media_post_link ? '</a>' : '') . '</h6>'
			. apply_filters('drone_media_filter_get_post_info', 
								'<div class="post_info">'
									. ($drone_media_show_date 
										? '<span class="post_info_item post_info_posted">'
											. ($drone_media_post_link ? '<a href="' . esc_url($drone_media_post_link) . '" class="post_info_date">' : '') 
											. esc_html($drone_media_post_date) 
											. ($drone_media_post_link ? '</a>' : '')
											. '</span>'
										: '')
									. ($drone_media_show_author 
										? '<span class="post_info_item post_info_posted_by">' 
											. esc_html__('by', 'drone-media') . ' ' 
											. ($drone_media_post_link ? '<a href="' . esc_url($drone_media_post_author_url) . '" class="post_info_author">' : '') 
											. esc_html($drone_media_post_author_name) 
											. ($drone_media_post_link ? '</a>' : '') 
											. '</span>'
										: '')
									. (!$drone_media_show_categories && $drone_media_post_counters_output
										? $drone_media_post_counters_output
										: '')
								. '</div>')
		. '</div>'
	. '</article>';
drone_media_storage_set('drone_media_output_widgets_posts', $drone_media_output);
?>