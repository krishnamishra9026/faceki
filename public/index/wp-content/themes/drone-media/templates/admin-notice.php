<?php
/**
 * The template to display Admin notices
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.1
 */
 
$drone_media_theme_obj = wp_get_theme();
?>
<div class="update-nag" id="drone_media_admin_notice">
	<h3 class="drone_media_notice_title"><?php
		// Translators: Add theme name and version to the 'Welcome' message
		echo esc_html(sprintf(__('Welcome to %1$s v.%2$s', 'drone-media'),
				$drone_media_theme_obj->name . (DRONE_MEDIA_THEME_FREE ? ' ' . esc_html__('Free', 'drone-media') : ''),
				$drone_media_theme_obj->version
				));
	?></h3>
	<?php
	if (!drone_media_exists_trx_addons()) {
		?><p><?php echo wp_kses_data(__('<b>Attention!</b> Plugin "ThemeREX Addons is required! Please, install and activate it!', 'drone-media')); ?></p><?php
	}
	?><p>
		<a href="<?php echo esc_url(admin_url().'themes.php?page=drone_media_about'); ?>" class="button button-primary"><i class="dashicons dashicons-nametag"></i> <?php
			// Translators: Add theme name
			echo esc_html(sprintf(__('About %s', 'drone-media'), $drone_media_theme_obj->name));
		?></a>
		<?php
		if (drone_media_get_value_gp('page')!='tgmpa-install-plugins') {
			?>
			<a href="<?php echo esc_url(admin_url().'themes.php?page=tgmpa-install-plugins'); ?>" class="button button-primary"><i class="dashicons dashicons-admin-plugins"></i> <?php esc_html_e('Install plugins', 'drone-media'); ?></a>
			<?php
		}
		if (function_exists('drone_media_exists_trx_addons') && drone_media_exists_trx_addons() && class_exists('trx_addons_demo_data_importer')) {
			?>
			<a href="<?php echo esc_url(admin_url().'themes.php?page=trx_importer'); ?>" class="button button-primary"><i class="dashicons dashicons-download"></i> <?php esc_html_e('One Click Demo Data', 'drone-media'); ?></a>
			<?php
		}
		?>
        <a href="<?php echo esc_url(admin_url().'customize.php'); ?>" class="button button-primary"><i class="dashicons dashicons-admin-appearance"></i> <?php esc_html_e('Theme Customizer', 'drone-media'); ?></a>
		<span> <?php esc_html_e('or', 'drone-media'); ?> </span>
        <a href="<?php echo esc_url(admin_url().'themes.php?page=theme_options'); ?>" class="button button-primary"><i class="dashicons dashicons-admin-appearance"></i> <?php esc_html_e('Theme Options', 'drone-media'); ?></a>
        <a href="#" class="button drone_media_hide_notice"><i class="dashicons dashicons-dismiss"></i> <?php esc_html_e('Hide Notice', 'drone-media'); ?></a>
	</p>
</div>