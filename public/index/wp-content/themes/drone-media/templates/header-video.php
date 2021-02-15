<?php
/**
 * The template to display the background video in the header
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.14
 */
$drone_media_header_video = drone_media_get_header_video();
$drone_media_embed_video = '';
if (!empty($drone_media_header_video) && !drone_media_is_from_uploads($drone_media_header_video)) {
	if (drone_media_is_youtube_url($drone_media_header_video) && preg_match('/[=\/]([^=\/]*)$/', $drone_media_header_video, $matches) && !empty($matches[1])) {
		?><div id="background_video" data-youtube-code="<?php echo esc_attr($matches[1]); ?>"></div><?php
	} else {
		global $wp_embed;
		if (false && is_object($wp_embed)) {
			$drone_media_embed_video = do_shortcode($wp_embed->run_shortcode( '[embed]' . trim($drone_media_header_video) . '[/embed]' ));
			$drone_media_embed_video = drone_media_make_video_autoplay($drone_media_embed_video);
		} else {
			$drone_media_header_video = str_replace('/watch?v=', '/embed/', $drone_media_header_video);
			$drone_media_header_video = drone_media_add_to_url($drone_media_header_video, array(
				'feature' => 'oembed',
				'controls' => 0,
				'autoplay' => 1,
				'showinfo' => 0,
				'modestbranding' => 1,
				'wmode' => 'transparent',
				'enablejsapi' => 1,
				'origin' => home_url(),
				'widgetid' => 1
			));
			$drone_media_embed_video = '<iframe src="' . esc_url($drone_media_header_video) . '" width="1170" height="658" allowfullscreen="0" frameborder="0"></iframe>';
		}
		?><div id="background_video"><?php drone_media_show_layout($drone_media_embed_video); ?></div><?php
	}
}
?>