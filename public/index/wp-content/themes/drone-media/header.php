<?php
/**
 * The Header: Logo and main menu
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js scheme_<?php
										 // Class scheme_xxx need in the <html> as context for the <body>!
										 echo esc_attr(drone_media_get_theme_option('color_scheme'));
										 ?>">
<head>
	<?php wp_head(); ?>
</head>

<body <?php	body_class(); ?>>
<?php wp_body_open(); ?>

	<?php do_action( 'drone_media_action_before_body' ); ?>

	<div class="body_wrap">

		<div class="page_wrap"><?php
			
			// Desktop header
			$drone_media_header_type = drone_media_get_theme_option("header_type");
			if ($drone_media_header_type == 'custom' && !drone_media_is_layouts_available())
				$drone_media_header_type = 'default';
			get_template_part( "templates/header-{$drone_media_header_type}");

			// Side menu
			if (in_array(drone_media_get_theme_option('menu_style'), array('left', 'right'))) {
				get_template_part( 'templates/header-navi-side' );
			}

			// Mobile header
			get_template_part( 'templates/header-mobile');
			?>

			<div class="page_content_wrap">

				<?php if (drone_media_get_theme_option('body_style') != 'fullscreen') { ?>
				<div class="content_wrap">
				<?php } ?>

					<?php
					// Widgets area above page content
					drone_media_create_widgets_area('widgets_above_page');
					?>				

					<div class="content">
						<?php
						// Widgets area inside page content
						drone_media_create_widgets_area('widgets_above_content');
						?>				
