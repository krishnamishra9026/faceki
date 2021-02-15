<?php
/**
 * The template to display blog archive
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

/*
Template Name: Blog archive
*/

/**
 * Make page with this template and put it into menu
 * to display posts as blog archive
 * You can setup output parameters (blog style, posts per page, parent category, etc.)
 * in the Theme Options section (under the page content)
 * You can build this page in the WordPress editor or any Page Builder to make custom page layout:
 * just insert %%CONTENT%% in the desired place of content
 */

// Get template page's content
$drone_media_content = '';
$drone_media_blog_archive_mask = '%%CONTENT%%';
$drone_media_blog_archive_subst = sprintf('<div class="blog_archive">%s</div>', $drone_media_blog_archive_mask);
if ( have_posts() ) {
	the_post();
	if (($drone_media_content = apply_filters('the_content', get_the_content())) != '') {
		if (($drone_media_pos = strpos($drone_media_content, $drone_media_blog_archive_mask)) !== false) {
			$drone_media_content = preg_replace('/(\<p\>\s*)?'.$drone_media_blog_archive_mask.'(\s*\<\/p\>)/i', $drone_media_blog_archive_subst, $drone_media_content);
		} else
			$drone_media_content .= $drone_media_blog_archive_subst;
		$drone_media_content = explode($drone_media_blog_archive_mask, $drone_media_content);
		// Add VC custom styles to the inline CSS
		$vc_custom_css = get_post_meta( get_the_ID(), '_wpb_shortcodes_custom_css', true );
		if ( !empty( $vc_custom_css ) ) drone_media_add_inline_css(strip_tags($vc_custom_css));
	}
}

// Prepare args for a new query
$drone_media_args = array(
	'post_status' => current_user_can('read_private_pages') && current_user_can('read_private_posts') ? array('publish', 'private') : 'publish'
);
$drone_media_args = drone_media_query_add_posts_and_cats($drone_media_args, '', drone_media_get_theme_option('post_type'), drone_media_get_theme_option('parent_cat'));
$drone_media_page_number = get_query_var('paged') ? get_query_var('paged') : (get_query_var('page') ? get_query_var('page') : 1);
if ($drone_media_page_number > 1) {
	$drone_media_args['paged'] = $drone_media_page_number;
	$drone_media_args['ignore_sticky_posts'] = true;
}
$drone_media_ppp = drone_media_get_theme_option('posts_per_page');
if ((int) $drone_media_ppp != 0)
	$drone_media_args['posts_per_page'] = (int) $drone_media_ppp;
// Make a new main query
$GLOBALS['wp_the_query']->query($drone_media_args);


// Add internal query vars in the new query!
if (is_array($drone_media_content) && count($drone_media_content) == 2) {
	set_query_var('blog_archive_start', $drone_media_content[0]);
	set_query_var('blog_archive_end', $drone_media_content[1]);
}

get_template_part('index');
?>