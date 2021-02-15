<?php
/**
 * The default template to display the content
 *
 * Used for index/archive/search.
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
$drone_media_animation = drone_media_get_theme_option('blog_animation');
// Post meta
$drone_media_components = drone_media_is_inherit(drone_media_get_theme_option_from_meta('meta_parts'))
    ? 'date'
    : drone_media_array_get_keys_by_value(drone_media_get_theme_option('meta_parts'));
$drone_media_counters = drone_media_is_inherit(drone_media_get_theme_option_from_meta('counters'))
    ? 'views,comments'
    : drone_media_array_get_keys_by_value(drone_media_get_theme_option('counters'));

?><article id="post-<?php the_ID(); ?>" 
	<?php post_class( 'post_item post_layout_excerpt post_format_'.esc_attr($drone_media_post_format) ); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>
	><?php

	// Sticky label
	if ( is_sticky() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}
    ?><div class="ex-top"><?php

	// Featured image
	drone_media_show_post_featured(array( 'thumb_size' => drone_media_get_thumb_size( strpos(drone_media_get_theme_option('body_style'), 'full')!==false ? 'full' : 'big' ) ));

        drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
                'components' => 'categories',
                'counters' => '',
                'seo' => false
            ), 'excerpt', 1)
        );
    ?></div><?php
	// Title and post meta
	if (get_the_title() != '') {
		?>
		<div class="post_header entry-header">
			<?php
			do_action('drone_media_action_before_post_title'); 

			// Post title
			the_title( sprintf( '<h4 class="post_title entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h4>' );

			do_action('drone_media_action_before_post_meta'); 


			if (!empty($drone_media_components))
				drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
					'components' => $drone_media_components,
					'counters' => '',
					'seo' => false
					), 'excerpt', 1)
				);
			?>
		</div><!-- .post_header --><?php
	}
	
	// Post content
	?><div class="post_content entry-content"><?php
		if (drone_media_get_theme_option('blog_content') == 'fullpost') {
			// Post content area
			?><div class="post_content_inner"><?php
				the_content( '' );
			?></div><?php
			// Inner pages
			wp_link_pages( array(
				'before'      => '<div class="page_links"><span class="page_links_title">' . esc_html__( 'Pages:', 'drone-media' ) . '</span>',
				'after'       => '</div>',
				'link_before' => '<span>',
				'link_after'  => '</span>',
				'pagelink'    => '<span class="screen-reader-text">' . esc_html__( 'Page', 'drone-media' ) . ' </span>%',
				'separator'   => '<span class="screen-reader-text">, </span>',
			) );

		} else {

			$drone_media_show_learn_more = true;

			// Post content area
			?><div class="post_content_inner"><?php
				if (has_excerpt()) {
					the_excerpt();
				} else if (strpos(get_the_content('!--more'), '!--more')!==false) {
					the_content( '' );
				} else if (in_array($drone_media_post_format, array('link', 'aside', 'status'))) {
					the_content();
				} else if ($drone_media_post_format == 'quote') {
					if (($quote = drone_media_get_tag(get_the_content(), '<blockquote>', '</blockquote>'))!='')
						drone_media_show_layout(wpautop($quote));
					else
						the_excerpt();
				} else if (substr(get_the_content(), 0, 1)!='[') {
					the_excerpt();
				}
			?></div><div class="ex-bot"><?php

			// More button
			if ( $drone_media_show_learn_more ) {
				?><a class="sc_button sc_button_simple" href="<?php echo esc_url(get_permalink()); ?>"><?php esc_html_e('Read more', 'drone-media'); ?></a><?php
			}
            if (!empty($drone_media_components))
                drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
                        'components' => 'counters',
                        'counters' => $drone_media_counters,
                        'seo' => false
                    ), 'excerpt', 1)
                );
            ?></div><?php
		}
	?></div><!-- .entry-content -->
</article>