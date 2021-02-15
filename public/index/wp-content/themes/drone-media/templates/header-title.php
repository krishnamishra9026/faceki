<?php
/**
 * The template to display the page title and breadcrumbs
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

// Page (category, tag, archive, author) title

if ( drone_media_need_page_title() && !is_home()) {
	drone_media_sc_layouts_showed('title', true);
	drone_media_sc_layouts_showed('postmeta', true);
	?>
	<div class="top_panel_title sc_layouts_row scheme_dark sc_layouts_row_type_normal">
		<div class="content_wrap">
			<div class="sc_layouts_column sc_layouts_column_align_center">
				<div class="sc_layouts_item">
                    <?php if(!empty(drone_media_get_blog_title())) { ?>
					<div class="sc_layouts_title sc_align_center">
						<?php
						// Blog/Post title
						?><div class="sc_layouts_title_title"><?php
							$drone_media_blog_title = drone_media_get_blog_title();
							$drone_media_blog_title_text = $drone_media_blog_title_class = $drone_media_blog_title_link = $drone_media_blog_title_link_text = '';
							if (is_array($drone_media_blog_title)) {
								$drone_media_blog_title_text = $drone_media_blog_title['text'];
								$drone_media_blog_title_class = !empty($drone_media_blog_title['class']) ? ' '.$drone_media_blog_title['class'] : '';
								$drone_media_blog_title_link = !empty($drone_media_blog_title['link']) ? $drone_media_blog_title['link'] : '';
								$drone_media_blog_title_link_text = !empty($drone_media_blog_title['link_text']) ? $drone_media_blog_title['link_text'] : '';
							} else
								$drone_media_blog_title_text = $drone_media_blog_title;
							?>
							<h1 itemprop="headline" class="sc_layouts_title_caption<?php echo esc_attr($drone_media_blog_title_class); ?>"><?php
								$drone_media_top_icon = drone_media_get_category_icon();
								if (!empty($drone_media_top_icon)) {
									$drone_media_attr = drone_media_getimagesize($drone_media_top_icon);
                                    $alt = basename($drone_media_top_icon);
                                    $alt = substr($alt,0,strlen($alt) - 4);
									?><img src="<?php echo esc_url($drone_media_top_icon); ?>" alt="<?php echo esc_attr($alt); ?>" <?php if (!empty($drone_media_attr[3])) drone_media_show_layout($drone_media_attr[3]);?>><?php
								}
								echo wp_kses_post($drone_media_blog_title_text);
							?></h1>
							<?php
							if (!empty($drone_media_blog_title_link) && !empty($drone_media_blog_title_link_text)) {
								?><a href="<?php echo esc_url($drone_media_blog_title_link); ?>" class="theme_button theme_button_small sc_layouts_title_link"><?php echo esc_html($drone_media_blog_title_link_text); ?></a><?php
							}
							
							// Category/Tag description
							if ( is_category() || is_tag() || is_tax() ) 
								the_archive_description( '<div class="sc_layouts_title_description">', '</div>' );
		
						?></div><?php
	
						// Breadcrumbs
						?><div class="sc_layouts_title_breadcrumbs"><?php
							do_action( 'drone_media_action_breadcrumbs');
						?></div>
					</div>
        <?php } ?>
				</div>
			</div>
		</div>
	</div>
	<?php
}
?>