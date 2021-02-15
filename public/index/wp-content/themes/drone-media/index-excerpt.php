<?php
/**
 * The template for homepage posts with "Excerpt" style
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

drone_media_storage_set('blog_archive', true);

get_header(); 

if (have_posts()) {

	drone_media_show_layout(get_query_var('blog_archive_start'));

	?><div class="posts_container"><?php
	
	$drone_media_stickies = is_home() ? get_option( 'sticky_posts' ) : false;
	$drone_media_sticky_out = drone_media_get_theme_option('sticky_style')=='columns' 
							&& is_array($drone_media_stickies) && count($drone_media_stickies) > 0 && get_query_var( 'paged' ) < 1;
	if ($drone_media_sticky_out) {
		?><div class="sticky_wrap columns_wrap"><?php	
	}
	while ( have_posts() ) { the_post(); 
		if ($drone_media_sticky_out && !is_sticky()) {
			$drone_media_sticky_out = false;
			?></div><?php
		}
		get_template_part( 'content', $drone_media_sticky_out && is_sticky() ? 'sticky' : 'excerpt' );
	}
	if ($drone_media_sticky_out) {
		$drone_media_sticky_out = false;
		?></div><?php
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