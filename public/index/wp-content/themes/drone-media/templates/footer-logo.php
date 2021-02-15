<?php
/**
 * The template to display the site logo in the footer
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.10
 */

// Logo
if (drone_media_is_on(drone_media_get_theme_option('logo_in_footer'))) {
	$drone_media_logo_image = '';
	if (drone_media_is_on(drone_media_get_theme_option('logo_retina_enabled')) && drone_media_get_retina_multiplier(2) > 1)
		$drone_media_logo_image = drone_media_get_theme_option( 'logo_footer_retina' );
	if (empty($drone_media_logo_image)) 
		$drone_media_logo_image = drone_media_get_theme_option( 'logo_footer' );
	$drone_media_logo_text   = get_bloginfo( 'name' );
	if (!empty($drone_media_logo_image) || !empty($drone_media_logo_text)) {
		?>
		<div class="footer_logo_wrap">
			<div class="footer_logo_inner">
				<?php
				if (!empty($drone_media_logo_image)) {
					$drone_media_attr = drone_media_getimagesize($drone_media_logo_image);
                    $alt = basename($drone_media_logo_image);
                    $alt = substr($alt,0,strlen($alt) - 4);
					echo '<a href="'.esc_url(home_url('/')).'"><img src="'.esc_url($drone_media_logo_image).'" class="logo_footer_image" alt="'. esc_attr($alt).'"'.(!empty($drone_media_attr[3]) ? ' ' . wp_kses_data($drone_media_attr[3]) : '').'></a>' ;
				} else if (!empty($drone_media_logo_text)) {
					echo '<h1 class="logo_footer_text"><a href="'.esc_url(home_url('/')).'">' . esc_html($drone_media_logo_text) . '</a></h1>';
				}
				?>
			</div>
		</div>
		<?php
	}
}
?>