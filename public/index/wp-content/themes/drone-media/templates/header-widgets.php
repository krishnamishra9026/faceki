<?php
/**
 * The template to display the widgets area in the header
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

// Header sidebar
$drone_media_header_name = drone_media_get_theme_option('header_widgets');
$drone_media_header_present = !drone_media_is_off($drone_media_header_name) && is_active_sidebar($drone_media_header_name);
if ($drone_media_header_present) { 
	drone_media_storage_set('current_sidebar', 'header');
	$drone_media_header_wide = drone_media_get_theme_option('header_wide');
	ob_start();
	if ( is_active_sidebar($drone_media_header_name) ) {
		dynamic_sidebar($drone_media_header_name);
	}
	$drone_media_widgets_output = ob_get_contents();
	ob_end_clean();
	if (!empty($drone_media_widgets_output)) {
		$drone_media_widgets_output = preg_replace("/<\/aside>[\r\n\s]*<aside/", "</aside><aside", $drone_media_widgets_output);
		$drone_media_need_columns = strpos($drone_media_widgets_output, 'columns_wrap')===false;
		if ($drone_media_need_columns) {
			$drone_media_columns = max(0, (int) drone_media_get_theme_option('header_columns'));
			if ($drone_media_columns == 0) $drone_media_columns = min(6, max(1, substr_count($drone_media_widgets_output, '<aside ')));
			if ($drone_media_columns > 1)
				$drone_media_widgets_output = preg_replace("/<aside([^>]*)class=\"widget/", "<aside$1class=\"column-1_".esc_attr($drone_media_columns).' widget', $drone_media_widgets_output);
			else
				$drone_media_need_columns = false;
		}
		?>
		<div class="header_widgets_wrap widget_area<?php echo !empty($drone_media_header_wide) ? ' header_fullwidth' : ' header_boxed'; ?>">
			<div class="header_widgets_inner widget_area_inner">
				<?php 
				if (!$drone_media_header_wide) { 
					?><div class="content_wrap"><?php
				}
				if ($drone_media_need_columns) {
					?><div class="columns_wrap"><?php
				}
				do_action( 'drone_media_action_before_sidebar' );
				drone_media_show_layout($drone_media_widgets_output);
				do_action( 'drone_media_action_after_sidebar' );
				if ($drone_media_need_columns) {
					?></div>	<!-- /.columns_wrap --><?php
				}
				if (!$drone_media_header_wide) {
					?></div>	<!-- /.content_wrap --><?php
				}
				?>
			</div>	<!-- /.header_widgets_inner -->
		</div>	<!-- /.header_widgets_wrap -->
		<?php
	}
}
?>