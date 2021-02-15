<?php
/**
 * The template to display the copyright info in the footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */

// Copyright area
$drone_media_footer_scheme =  drone_media_is_inherit(drone_media_get_theme_option('footer_scheme')) ? drone_media_get_theme_option('color_scheme') : drone_media_get_theme_option('footer_scheme');
$drone_media_copyright_scheme = drone_media_is_inherit(drone_media_get_theme_option('copyright_scheme')) ? $drone_media_footer_scheme : drone_media_get_theme_option('copyright_scheme');
?> 
<div class="footer_copyright_wrap scheme_<?php echo esc_attr($drone_media_copyright_scheme); ?>">
	<div class="footer_copyright_inner">
		<div class="content_wrap">
			<div class="copyright_text">
			<?php
				// Replace {{...}} and ((...)) on the <i>...</i> and <b>...</b>
				$drone_media_copyright = (drone_media_get_theme_option('copyright'));
				if (!empty($drone_media_copyright)) {
					// Replace {{Y}} or {Y} with the current year
				$drone_media_copyright = str_replace( array( '{{Y}}', '{Y}' ), date( 'Y' ), $drone_media_copyright );
				// Replace {{...}} and ((...)) on the <i>...</i> and <b>...</b>
				$drone_media_copyright = drone_media_prepare_macros( $drone_media_copyright );
				// Display copyright
				echo wp_kses_post( nl2br( $drone_media_copyright ) );
				}
			?></div>
		</div>
	</div>
</div>
