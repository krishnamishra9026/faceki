<?php
/**
 * The template to display default site footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */

$drone_media_footer_scheme =  drone_media_is_inherit(drone_media_get_theme_option('footer_scheme')) ? drone_media_get_theme_option('color_scheme') : drone_media_get_theme_option('footer_scheme');
$drone_media_footer_id = str_replace('footer-custom-', '', drone_media_get_theme_option("footer_style"));
if ((int) $drone_media_footer_id == 0) {
	$drone_media_footer_id = drone_media_get_post_id(array(
												'name' => $drone_media_footer_id,
												'post_type' => defined('TRX_ADDONS_CPT_LAYOUTS_PT') ? TRX_ADDONS_CPT_LAYOUTS_PT : 'cpt_layouts'
												)
											);
} else {
	$drone_media_footer_id = apply_filters('drone_media_filter_get_translated_layout', $drone_media_footer_id);
}
$drone_media_footer_meta = get_post_meta($drone_media_footer_id, 'trx_addons_options', true);
?>
<footer class="footer_wrap footer_custom footer_custom_<?php echo esc_attr($drone_media_footer_id); 
						?> footer_custom_<?php echo esc_attr(sanitize_title(get_the_title($drone_media_footer_id))); 
						if (!empty($drone_media_footer_meta['margin']) != '') 
							echo ' '.esc_attr(drone_media_add_inline_css_class('margin-top: '.drone_media_prepare_css_value($drone_media_footer_meta['margin']).';'));
						?> scheme_<?php echo esc_attr($drone_media_footer_scheme); 
						?>">
	<?php
    // Custom footer's layout
    do_action('drone_media_action_show_layout', $drone_media_footer_id);
	?>
</footer><!-- /.footer_wrap -->
