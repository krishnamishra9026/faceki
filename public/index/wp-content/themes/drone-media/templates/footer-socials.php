<?php
/**
 * The template to display the socials in the footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */


// Socials
if ( drone_media_is_on(drone_media_get_theme_option('socials_in_footer')) && ($drone_media_output = drone_media_get_socials_links()) != '') {
	?>
	<div class="footer_socials_wrap socials_wrap">
		<div class="footer_socials_inner">
			<?php drone_media_show_layout($drone_media_output); ?>
		</div>
	</div>
	<?php
}
?>