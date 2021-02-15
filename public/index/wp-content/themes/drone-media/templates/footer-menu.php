<?php
/**
 * The template to display menu in the footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */

// Footer menu
$drone_media_menu_footer = drone_media_get_nav_menu(array(
											'location' => 'menu_footer',
											'class' => 'sc_layouts_menu sc_layouts_menu_default'
											));
if (!empty($drone_media_menu_footer)) {
	?>
	<div class="footer_menu_wrap">
		<div class="footer_menu_inner">
			<?php drone_media_show_layout($drone_media_menu_footer); ?>
		</div>
	</div>
	<?php
}
?>