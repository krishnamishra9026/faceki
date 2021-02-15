<?php
/**
 * The template for homepage posts with "Portfolio" style
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

drone_media_storage_set('blog_archive', true);

get_header(); 

if (have_posts()) {

	drone_media_show_layout(get_query_var('blog_archive_start'));

	$drone_media_stickies = is_home() ? get_option( 'sticky_posts' ) : false;
	$drone_media_sticky_out = drone_media_get_theme_option('sticky_style')=='columns' 
							&& is_array($drone_media_stickies) && count($drone_media_stickies) > 0 && get_query_var( 'paged' ) < 1;
	
	// Show filters
	$drone_media_cat = drone_media_get_theme_option('parent_cat');
	$drone_media_post_type = drone_media_get_theme_option('post_type');
	$drone_media_taxonomy = drone_media_get_post_type_taxonomy($drone_media_post_type);
	$drone_media_show_filters = drone_media_get_theme_option('show_filters');
	$drone_media_tabs = array();
	if (!drone_media_is_off($drone_media_show_filters)) {
		$drone_media_args = array(
			'type'			=> $drone_media_post_type,
			'child_of'		=> $drone_media_cat,
			'orderby'		=> 'name',
			'order'			=> 'ASC',
			'hide_empty'	=> 1,
			'hierarchical'	=> 0,
			'exclude'		=> '',
			'include'		=> '',
			'number'		=> '',
			'taxonomy'		=> $drone_media_taxonomy,
			'pad_counts'	=> false
		);
		$drone_media_portfolio_list = get_terms($drone_media_args);
		if (is_array($drone_media_portfolio_list) && count($drone_media_portfolio_list) > 0) {
			$drone_media_tabs[$drone_media_cat] = esc_html__('All', 'drone-media');
			foreach ($drone_media_portfolio_list as $drone_media_term) {
				if (isset($drone_media_term->term_id)) $drone_media_tabs[$drone_media_term->term_id] = $drone_media_term->name;
			}
		}
	}
	if (count($drone_media_tabs) > 0) {
		$drone_media_portfolio_filters_ajax = true;
		$drone_media_portfolio_filters_active = $drone_media_cat;
		$drone_media_portfolio_filters_id = 'portfolio_filters';
		?>
		<div class="portfolio_filters drone_media_tabs drone_media_tabs_ajax">
			<ul class="portfolio_titles drone_media_tabs_titles">
				<?php
				foreach ($drone_media_tabs as $drone_media_id=>$drone_media_title) {
					?><li><a href="<?php echo esc_url(drone_media_get_hash_link(sprintf('#%s_%s_content', $drone_media_portfolio_filters_id, $drone_media_id))); ?>" data-tab="<?php echo esc_attr($drone_media_id); ?>"><?php echo esc_html($drone_media_title); ?></a></li><?php
				}
				?>
			</ul>
			<?php
			$drone_media_ppp = drone_media_get_theme_option('posts_per_page');
			if (drone_media_is_inherit($drone_media_ppp)) $drone_media_ppp = '';
			foreach ($drone_media_tabs as $drone_media_id=>$drone_media_title) {
				$drone_media_portfolio_need_content = $drone_media_id==$drone_media_portfolio_filters_active || !$drone_media_portfolio_filters_ajax;
				?>
				<div id="<?php echo esc_attr(sprintf('%s_%s_content', $drone_media_portfolio_filters_id, $drone_media_id)); ?>"
					class="portfolio_content drone_media_tabs_content"
					data-blog-template="<?php echo esc_attr(drone_media_storage_get('blog_template')); ?>"
					data-blog-style="<?php echo esc_attr(drone_media_get_theme_option('blog_style')); ?>"
					data-posts-per-page="<?php echo esc_attr($drone_media_ppp); ?>"
					data-post-type="<?php echo esc_attr($drone_media_post_type); ?>"
					data-taxonomy="<?php echo esc_attr($drone_media_taxonomy); ?>"
					data-cat="<?php echo esc_attr($drone_media_id); ?>"
					data-parent-cat="<?php echo esc_attr($drone_media_cat); ?>"
					data-need-content="<?php echo (false===$drone_media_portfolio_need_content ? 'true' : 'false'); ?>"
				>
					<?php
					if ($drone_media_portfolio_need_content) 
						drone_media_show_portfolio_posts(array(
							'cat' => $drone_media_id,
							'parent_cat' => $drone_media_cat,
							'taxonomy' => $drone_media_taxonomy,
							'post_type' => $drone_media_post_type,
							'page' => 1,
							'sticky' => $drone_media_sticky_out
							)
						);
					?>
				</div>
				<?php
			}
			?>
		</div>
		<?php
	} else {
		drone_media_show_portfolio_posts(array(
			'cat' => $drone_media_cat,
			'parent_cat' => $drone_media_cat,
			'taxonomy' => $drone_media_taxonomy,
			'post_type' => $drone_media_post_type,
			'page' => 1,
			'sticky' => $drone_media_sticky_out
			)
		);
	}

	drone_media_show_layout(get_query_var('blog_archive_end'));

} else {

	if ( is_search() )
		get_template_part( 'content', 'none-search' );
	else
		get_template_part( 'content', 'none-archive' );

}

get_footer();
?>