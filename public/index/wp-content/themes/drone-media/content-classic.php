<?php
/**
 * The Classic template to display the content
 *
 * Used for index/archive/search.
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_blog_style = explode('_', drone_media_get_theme_option('blog_style'));
$drone_media_columns = empty($drone_media_blog_style[1]) ? 2 : max(2, $drone_media_blog_style[1]);
$drone_media_expanded = !drone_media_sidebar_present() && drone_media_is_on(drone_media_get_theme_option('expand_content'));
$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
$drone_media_animation = drone_media_get_theme_option('blog_animation');
$drone_media_components = drone_media_is_inherit(drone_media_get_theme_option_from_meta('meta_parts')) 
							? 'categories,date'
							: drone_media_array_get_keys_by_value(drone_media_get_theme_option('meta_parts'));
$drone_media_counters = drone_media_is_inherit(drone_media_get_theme_option_from_meta('counters')) 
							? 'comments'
							: drone_media_array_get_keys_by_value(drone_media_get_theme_option('counters'));

?><div class="<?php echo esc_html($drone_media_blog_style[0] == 'classic' ? 'column' : 'masonry_item masonry_item'); ?>-1_<?php echo esc_attr($drone_media_columns); ?>"><article id="post-<?php the_ID(); ?>"
	<?php post_class( 'post_item post_format_'.esc_attr($drone_media_post_format)
					. ' post_layout_classic post_layout_classic_'.esc_attr($drone_media_columns)
					. ' post_layout_'.esc_attr($drone_media_blog_style[0]) 
					. ' post_layout_'.esc_attr($drone_media_blog_style[0]).'_'.esc_attr($drone_media_columns)
					); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>>
	<?php

	// Sticky label
	if ( is_sticky() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}

	// Featured image
	drone_media_show_post_featured( array( 'thumb_size' => drone_media_get_thumb_size($drone_media_blog_style[0] == 'classic'
													? (strpos(drone_media_get_theme_option('body_style'), 'full')!==false 
															? ( $drone_media_columns > 2 ? 'big' : 'huge' )
															: (	$drone_media_columns > 2
																? ($drone_media_expanded ? 'med' : 'small')
																: ($drone_media_expanded ? 'big' : 'med')
																)
														)
													: (strpos(drone_media_get_theme_option('body_style'), 'full')!==false 
															? ( $drone_media_columns > 2 ? 'masonry-big' : 'full' )
															: (	$drone_media_columns <= 2 && $drone_media_expanded ? 'masonry-big' : 'masonry')
														)
								) ) );

	if ( !in_array($drone_media_post_format, array('aside', 'status', 'quote')) ) {
		?>
		<div class="post_header entry-header">
			<?php 
			do_action('drone_media_action_before_post_title'); 

			// Post title
			the_title( sprintf( '<h4 class="post_title entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h4>' );

			do_action('drone_media_action_before_post_meta'); 

			// Post meta
			if (!empty($drone_media_components))
				drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
					'components' => $drone_media_components,
					'counters' => $drone_media_counters,
					'seo' => false
					), $drone_media_blog_style[0], $drone_media_columns)
				);

			do_action('drone_media_action_after_post_meta'); 
			?>
		</div><!-- .entry-header -->
		<?php
	}		
	?>

	<div class="post_content entry-content">
		<div class="post_content_inner">
			<?php
			$drone_media_show_learn_more = false;
			if (has_excerpt()) {
				the_excerpt();
			} else if (strpos(get_the_content('!--more'), '!--more')!==false) {
				the_content( '' );
			} else if (in_array($drone_media_post_format, array('aside', 'status'))) {
				the_content();
			} else if ($drone_media_post_format == 'quote') {
				if (($quote = drone_media_get_tag(get_the_content(), '<blockquote>', '</blockquote>'))!='')
					drone_media_show_layout(wpautop($quote));
				else
					the_excerpt();
			} else if (substr(get_the_content(), 0, 1)!='[') {
				the_excerpt();
			}
			?>
		</div>
		<?php
		// Post meta
		if (in_array($drone_media_post_format, array('aside', 'status', 'quote'))) {
			if (!empty($drone_media_components))
				drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
					'components' => $drone_media_components,
					'counters' => $drone_media_counters
					), $drone_media_blog_style[0], $drone_media_columns)
				);
		}
		// More button
		if ( $drone_media_show_learn_more ) {
			?><p><a class="more-link" href="<?php echo esc_url(get_permalink()); ?>"><?php esc_html_e('Read more', 'drone-media'); ?></a></p><?php
		}
		?>
	</div><!-- .entry-content -->

</article></div>