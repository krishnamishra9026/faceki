<?php
/**
 * The Sticky template to display the sticky posts
 *
 * Used for index/archive
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_columns = max(1, min(3, count(get_option( 'sticky_posts' ))));
$drone_media_post_format = get_post_format();
$drone_media_post_format = empty($drone_media_post_format) ? 'standard' : str_replace('post-format-', '', $drone_media_post_format);
$drone_media_animation = drone_media_get_theme_option('blog_animation');

?><div class="column-1_<?php echo esc_attr($drone_media_columns); ?>"><article id="post-<?php the_ID(); ?>" 
	<?php post_class( 'post_item post_layout_sticky post_format_'.esc_attr($drone_media_post_format) ); ?>
	<?php echo (!drone_media_is_off($drone_media_animation) ? ' data-animation="'.esc_attr(drone_media_get_animation_classes($drone_media_animation)).'"' : ''); ?>
	>

	<?php
	if ( is_sticky() && is_home() && !is_paged() ) {
		?><span class="post_label label_sticky"></span><?php
	}

	// Featured image
	drone_media_show_post_featured(array(
		'thumb_size' => drone_media_get_thumb_size($drone_media_columns==1 ? 'big' : ($drone_media_columns==2 ? 'med' : 'avatar'))
	));

	if ( !in_array($drone_media_post_format, array('link', 'aside', 'status', 'quote')) ) {
		?>
		<div class="post_header entry-header">
			<?php
			// Post title
			the_title( sprintf( '<h6 class="post_title entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h6>' );
			// Post meta
			drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(), 'sticky', $drone_media_columns));
			?>
		</div><!-- .entry-header -->
		<?php
	}
	?>
</article></div>