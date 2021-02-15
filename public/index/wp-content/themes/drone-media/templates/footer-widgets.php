<?php
/**
 * The template to display the widgets area in the footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */

// Footer sidebar
$drone_media_footer_name = drone_media_get_theme_option('footer_widgets');
$drone_media_footer_present = !drone_media_is_off($drone_media_footer_name) && is_active_sidebar($drone_media_footer_name);
if ($drone_media_footer_present) { 
	drone_media_storage_set('current_sidebar', 'footer');
	$drone_media_footer_wide = drone_media_get_theme_option('footer_wide');
	ob_start();
	if ( is_active_sidebar($drone_media_footer_name) ) {
		dynamic_sidebar($drone_media_footer_name);
	}
	$drone_media_out = trim(ob_get_contents());
	ob_end_clean();
	if (!empty($drone_media_out)) {
		$drone_media_out = preg_replace("/<\\/aside>[\r\n\s]*<aside/", "</aside><aside", $drone_media_out);
		$drone_media_need_columns = true;
		if ($drone_media_need_columns) {
			$drone_media_columns = max(0, (int) drone_media_get_theme_option('footer_columns'));
			if ($drone_media_columns == 0) $drone_media_columns = min(4, max(1, substr_count($drone_media_out, '<aside ')));
			if ($drone_media_columns > 1)
				$drone_media_out = preg_replace("/<aside([^>]*)class=\"widget/", "<aside$1class=\"column-1_".esc_attr($drone_media_columns).' widget', $drone_media_out);
			else
				$drone_media_need_columns = false;
		}
		?>
		<div class="footer_widgets_wrap widget_area<?php echo !empty($drone_media_footer_wide) ? ' footer_fullwidth' : ''; ?> sc_layouts_row  sc_layouts_row_type_normal">
			<div class="footer_widgets_inner widget_area_inner">
				<?php 
				if (!$drone_media_footer_wide) { 
					?><div class="content_wrap"><?php
				}
				if ($drone_media_need_columns) {
					?><div class="columns_wrap"><?php
				}
				do_action( 'drone_media_action_before_sidebar' );
				drone_media_show_layout($drone_media_out);
				do_action( 'drone_media_action_after_sidebar' );
				if ($drone_media_need_columns) {
					?></div><!-- /.columns_wrap --><?php
				}
				if (!$drone_media_footer_wide) {
					?></div><!-- /.content_wrap --><?php
				}
				?>
			</div><!-- /.footer_widgets_inner -->
		</div><!-- /.footer_widgets_wrap -->
		<?php
	}
}
?>