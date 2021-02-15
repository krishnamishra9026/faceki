<?php
/**
 * The template to display the logo or the site name and the slogan in the Header
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_args = get_query_var('drone_media_logo_args');

// Site logo
$drone_media_logo_type   = isset($drone_media_args['type']) ? $drone_media_args['type'] : '';
$drone_media_logo_image  = drone_media_get_logo_image($drone_media_logo_type);
$drone_media_logo_text   = drone_media_is_on(drone_media_get_theme_option('logo_text')) ? get_bloginfo( 'name' ) : '';
$drone_media_logo_slogan = get_bloginfo( 'description', 'display' );
if (!empty($drone_media_logo_image) || !empty($drone_media_logo_text)) {
	?><a class="sc_layouts_logo" href="<?php if (is_front_page()) { echo '#'; } else { echo esc_url(home_url('/')); }  ?>"><?php
		if (!empty($drone_media_logo_image)) {
			if (empty($drone_media_logo_type) && function_exists('the_custom_logo') && (int) $drone_media_logo_image > 0) {
				the_custom_logo();
			} else {
				$drone_media_attr = drone_media_getimagesize($drone_media_logo_image);
                $alt = basename($drone_media_logo_image);
                $alt = substr($alt,0,strlen($alt) - 4);
				echo '<img src="'.esc_url($drone_media_logo_image).'" alt="'. esc_attr($alt).'"'.(!empty($drone_media_attr[3]) ? ' '.wp_kses_data($drone_media_attr[3]) : '').'>';
			}
		} else {
			drone_media_show_layout(drone_media_prepare_macros($drone_media_logo_text), '<span class="logo_text">', '</span>');
			drone_media_show_layout(drone_media_prepare_macros($drone_media_logo_slogan), '<span class="logo_slogan">', '</span>');
		}
	?></a><?php
}
?>