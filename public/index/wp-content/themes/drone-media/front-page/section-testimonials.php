<div class="front_page_section front_page_section_testimonials<?php
			$drone_media_scheme = drone_media_get_theme_option('front_page_testimonials_scheme');
			if (!drone_media_is_inherit($drone_media_scheme)) echo ' scheme_'.esc_attr($drone_media_scheme);
			echo ' front_page_section_paddings_'.esc_attr(drone_media_get_theme_option('front_page_testimonials_paddings'));
		?>"<?php
		$drone_media_css = '';
		$drone_media_bg_image = drone_media_get_theme_option('front_page_testimonials_bg_image');
		if (!empty($drone_media_bg_image)) 
			$drone_media_css .= 'background-image: url('.esc_url(drone_media_get_attachment_url($drone_media_bg_image)).');';
		if (!empty($drone_media_css))
			echo ' style="' . esc_attr($drone_media_css) . '"';
?>><?php
	// Add anchor
	$drone_media_anchor_icon = drone_media_get_theme_option('front_page_testimonials_anchor_icon');	
	$drone_media_anchor_text = drone_media_get_theme_option('front_page_testimonials_anchor_text');	
	if ((!empty($drone_media_anchor_icon) || !empty($drone_media_anchor_text)) && shortcode_exists('trx_sc_anchor')) {
		echo do_shortcode('[trx_sc_anchor id="front_page_section_testimonials"'
										. (!empty($drone_media_anchor_icon) ? ' icon="'.esc_attr($drone_media_anchor_icon).'"' : '')
										. (!empty($drone_media_anchor_text) ? ' title="'.esc_attr($drone_media_anchor_text).'"' : '')
										. ']');
	}
	?>
	<div class="front_page_section_inner front_page_section_testimonials_inner<?php
			if (drone_media_get_theme_option('front_page_testimonials_fullheight'))
				echo ' drone_media-full-height sc_layouts_flex sc_layouts_columns_middle';
			?>"<?php
			$drone_media_css = '';
			$drone_media_bg_mask = drone_media_get_theme_option('front_page_testimonials_bg_mask');
			$drone_media_bg_color = drone_media_get_theme_option('front_page_testimonials_bg_color');
			if (!empty($drone_media_bg_color) && $drone_media_bg_mask > 0)
				$drone_media_css .= 'background-color: '.esc_attr($drone_media_bg_mask==1
																	? $drone_media_bg_color
																	: drone_media_hex2rgba($drone_media_bg_color, $drone_media_bg_mask)
																).';';
			if (!empty($drone_media_css))
				echo ' style="' . esc_attr($drone_media_css) . '"';
	?>>
		<div class="front_page_section_content_wrap front_page_section_testimonials_content_wrap content_wrap">
			<?php
			// Caption
			$drone_media_caption = drone_media_get_theme_option('front_page_testimonials_caption');
			if (!empty($drone_media_caption) || (current_user_can('edit_theme_options') && is_customize_preview())) {
				?><h2 class="front_page_section_caption front_page_section_testimonials_caption front_page_block_<?php echo !empty($drone_media_caption) ? 'filled' : 'empty'; ?>"><?php echo wp_kses_post($drone_media_caption); ?></h2><?php
			}
		
			// Description (text)
			$drone_media_description = drone_media_get_theme_option('front_page_testimonials_description');
			if (!empty($drone_media_description) || (current_user_can('edit_theme_options') && is_customize_preview())) {
				?><div class="front_page_section_description front_page_section_testimonials_description front_page_block_<?php echo !empty($drone_media_description) ? 'filled' : 'empty'; ?>"><?php echo wp_kses_post(wpautop($drone_media_description)); ?></div><?php
			}
		
			// Content (widgets)
			?><div class="front_page_section_output front_page_section_testimonials_output"><?php 
				if (is_active_sidebar('front_page_testimonials_widgets')) {
					dynamic_sidebar( 'front_page_testimonials_widgets' );
				} else if (current_user_can( 'edit_theme_options' )) {
					if (!drone_media_exists_trx_addons())
						drone_media_customizer_need_trx_addons_message();
					else
						drone_media_customizer_need_widgets_message('front_page_testimonials_caption', 'ThemeREX Addons - Testimonials');
				}
			?></div>
		</div>
	</div>
</div>