<?php
/**
 * The template to display the Author bio
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */
?>

<div class="author_info scheme_default author vcard" itemprop="author" itemscope itemtype="//schema.org/Person">

	<div class="author_avatar" itemprop="image">
		<?php 
		$drone_media_mult = drone_media_get_retina_multiplier();
		echo get_avatar( get_the_author_meta( 'user_email' ), 120*$drone_media_mult ); 
		?>
	</div><!-- .author_avatar -->

	<div class="author_description">
		<h5 class="author_title" itemprop="name"><?php
			// Translators: Add the author's name in the <span> 
			echo wp_kses_data(sprintf(__('%s', 'drone-media'), '<span class="fn">'.get_the_author().'</span>'));
		?></h5>

		<div class="author_bio" itemprop="description">
			<?php echo wp_kses_post(wpautop(get_the_author_meta( 'description' ))); ?>
		</div><!-- .author_bio -->

	</div><!-- .author_description -->

</div><!-- .author_info -->
