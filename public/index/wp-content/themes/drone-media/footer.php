<?php
/**
 * The Footer: widgets area, logo, footer menu and socials
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

						// Widgets area inside page content
						drone_media_create_widgets_area('widgets_below_content');
						?>				
					</div><!-- </.content> -->

					<?php
					// Show main sidebar
					get_sidebar();

					// Widgets area below page content
					drone_media_create_widgets_area('widgets_below_page');

					$drone_media_body_style = drone_media_get_theme_option('body_style');
					if ($drone_media_body_style != 'fullscreen') {
						?></div><!-- </.content_wrap> --><?php
					}
					?>
			</div><!-- </.page_content_wrap> -->

			<?php
			// Footer
			$drone_media_footer_type = drone_media_get_theme_option("footer_type");
			if ($drone_media_footer_type == 'custom' && !drone_media_is_layouts_available())
				$drone_media_footer_type = 'default';
			get_template_part( "templates/footer-{$drone_media_footer_type}");
			?>

		</div><!-- /.page_wrap -->

	</div><!-- /.body_wrap -->

	<?php if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('images/makeup.jpg')!='') { ?>
		<img src="<?php echo esc_url(drone_media_get_file_url('images/makeup.jpg')); ?>" id="makeup">
	<?php } ?>

	<?php wp_footer(); ?>

</body>
</html>