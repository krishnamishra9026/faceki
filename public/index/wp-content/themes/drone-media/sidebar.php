<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

if (drone_media_sidebar_present()) {
	ob_start();
	$drone_media_sidebar_name = drone_media_get_theme_option('sidebar_widgets');
	drone_media_storage_set('current_sidebar', 'sidebar');
	if ( is_active_sidebar($drone_media_sidebar_name) ) {
		dynamic_sidebar($drone_media_sidebar_name);
	}
	$drone_media_out = trim(ob_get_contents());
	ob_end_clean();
	if (!empty($drone_media_out)) {
		$drone_media_sidebar_position = drone_media_get_theme_option('sidebar_position');
		?>
		<div class="sidebar <?php echo esc_attr($drone_media_sidebar_position); ?> widget_area<?php if (!drone_media_is_inherit(drone_media_get_theme_option('sidebar_scheme'))) echo ' scheme_'.esc_attr(drone_media_get_theme_option('sidebar_scheme')); ?>" role="complementary">
			<div class="sidebar_inner">
				<?php
				do_action( 'drone_media_action_before_sidebar' );
				drone_media_show_layout(preg_replace("/<\/aside>[\r\n\s]*<aside/", "</aside><aside", $drone_media_out));
				do_action( 'drone_media_action_after_sidebar' );
				?>
			</div><!-- /.sidebar_inner -->
		</div><!-- /.sidebar -->
		<?php
	}
}
?>