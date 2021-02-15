<?php
/**
 * The template for homepage posts with "Classic" style
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

drone_media_storage_set('blog_archive', true);

get_header(); 

if (have_posts()) {

	drone_media_show_layout(get_query_var('blog_archive_start'));

	$drone_media_classes = 'posts_container '
						. (substr(drone_media_get_theme_option('blog_style'), 0, 7) == 'classic' ? 'columns_wrap columns_padding_bottom' : 'masonry_wrap');
	$drone_media_stickies = is_home() ? get_option( 'sticky_posts' ) : false;
	$drone_media_sticky_out = drone_media_get_theme_option('sticky_style')=='columns' 
							&& is_array($drone_media_stickies) && count($drone_media_stickies) > 0 && get_query_var( 'paged' ) < 1;
	if ($drone_media_sticky_out) {
		?><div class="sticky_wrap columns_wrap"><?php	
	}
	if (!$drone_media_sticky_out) {
		if (drone_media_get_theme_option('first_post_large') && !is_paged() && !in_array(drone_media_get_theme_option('body_style'), array('fullwide', 'fullscreen'))) {
			the_post();
			get_template_part( 'content', 'excerpt' );
		}
		
		?><div class="<?php echo esc_attr($drone_media_classes); ?>"><?php
	}
	while ( have_posts() ) { the_post(); 
		if ($drone_media_sticky_out && !is_sticky()) {
			$drone_media_sticky_out = false;
			?></div><div class="<?php echo esc_attr($drone_media_classes); ?>"><?php
		}
		get_template_part( 'content', $drone_media_sticky_out && is_sticky() ? 'sticky' : 'classic' );
	}
	
	?></div><?php

	drone_media_show_pagination();

	drone_media_show_layout(get_query_var('blog_archive_end'));

} else {

	if ( is_search() )
		get_template_part( 'content', 'none-search' );
	else
		get_template_part( 'content', 'none-archive' );

}

get_footer();
?>