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
$drone_media_columns = empty($drone_media_blog_style[1]) ? 1 : max(1, $drone_media_blog_style[1]);
$drone_media_expanded = !drone_media_sidebar_present() && drone_media_is_on(drone_media_get_theme_option('expand_content'));
$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
$drone_media_animation = drone_media_get_theme_option('blog_animation');

?><article id="post-<?php the_ID(); ?>" 
	<?php post_class( 'post_item post_layout_chess post_layout_chess_'.esc_attr($drone_media_columns).' post_format_'.esc_attr($drone_media_post_format) ); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>>

	<?php
	// Add anchor
	if ($drone_media_columns == 1 && shortcode_exists('trx_sc_anchor')) {
		echo do_shortcode('[trx_sc_anchor id="post_'.esc_attr(get_the_ID()).'" title="'.esc_attr(get_the_title()).'"]');
	}

	// Sticky label
	if ( is_sticky() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}

	// Featured image
	drone_media_show_post_featured( array(
											'class' => $drone_media_columns == 1 ? 'drone_media-full-height' : '',
											'show_no_image' => true,
											'thumb_bg' => true,
											'thumb_size' => drone_media_get_thumb_size(
																	strpos(drone_media_get_theme_option('body_style'), 'full')!==false
																		? ( $drone_media_columns > 1 ? 'huge' : 'original' )
																		: (	$drone_media_columns > 2 ? 'big' : 'huge')
																	)
											) 
										);

	?><div class="post_inner"><div class="post_inner_content"><?php 

		?><div class="post_header entry-header"><?php 
			do_action('drone_media_action_before_post_title'); 

			// Post title
			the_title( sprintf( '<h3 class="post_title entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h3>' );
			
			do_action('drone_media_action_before_post_meta'); 

			// Post meta
			$drone_media_components = drone_media_is_inherit(drone_media_get_theme_option_from_meta('meta_parts')) 
										? ($drone_media_columns < 2 ? 'categories,' : '').'date'
										: drone_media_array_get_keys_by_value(drone_media_get_theme_option('meta_parts'));
			$drone_media_counters = drone_media_is_inherit(drone_media_get_theme_option_from_meta('counters')) 
										? 'comments'
										: drone_media_array_get_keys_by_value(drone_media_get_theme_option('counters'));
			$drone_media_post_meta = empty($drone_media_components) 
										? '' 
										: drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
												'components' => $drone_media_components,
												'counters' => $drone_media_counters,
												'seo' => false,
												'echo' => false
												), $drone_media_blog_style[0], $drone_media_columns)
											);
			drone_media_show_layout($drone_media_post_meta);
		?></div><!-- .entry-header -->
	
		<div class="post_content entry-content">
			<div class="post_content_inner">
				<?php
				$drone_media_show_learn_more = !in_array($drone_media_post_format, array('aside', 'status', 'quote'));
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
				drone_media_show_layout($drone_media_post_meta);
			}
			// More button
			if ( $drone_media_show_learn_more ) {
				?><p><a class="more-link" href="<?php echo esc_url(get_permalink()); ?>"><?php esc_html_e('Read more', 'drone-media'); ?></a></p><?php
			}
			?>
		</div><!-- .entry-content -->

	</div></div><!-- .post_inner -->

</article>