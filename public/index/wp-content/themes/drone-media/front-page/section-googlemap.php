<div class="front_page_section front_page_section_googlemap<?php
			$drone_media_scheme = drone_media_get_theme_option('front_page_googlemap_scheme');
			if (!drone_media_is_inherit($drone_media_scheme)) echo ' scheme_'.esc_attr($drone_media_scheme);
			echo ' front_page_section_paddings_'.esc_attr(drone_media_get_theme_option('front_page_googlemap_paddings'));
		?>"<?php
		$drone_media_css = '';
		$drone_media_bg_image = drone_media_get_theme_option('front_page_googlemap_bg_image');
		if (!empty($drone_media_bg_image)) 
			$drone_media_css .= 'background-image: url('.esc_url(drone_media_get_attachment_url($drone_media_bg_image)).');';
		if (!empty($drone_media_css))
			echo ' style="' . esc_attr($drone_media_css) . '"';
?>><?php
	// Add anchor
	$drone_media_anchor_icon = drone_media_get_theme_option('front_page_googlemap_anchor_icon');	
	$drone_media_anchor_text = drone_media_get_theme_option('front_page_googlemap_anchor_text');	
	if ((!empty($drone_media_anchor_icon) || !empty($drone_media_anchor_text)) && shortcode_exists('trx_sc_anchor')) {
		echo do_shortcode('[trx_sc_anchor id="front_page_section_googlemap"'
										. (!empty($drone_media_anchor_icon) ? ' icon="'.esc_attr($drone_media_anchor_icon).'"' : '')
										. (!empty($drone_media_anchor_text) ? ' title="'.esc_attr($drone_media_anchor_text).'"' : '')
										. ']');
	}
	?>
	<div class="front_page_section_inner front_page_section_googlemap_inner<?php
			if (drone_media_get_theme_option('front_page_googlemap_fullheight'))
				echo ' drone_media-full-height sc_layouts_flex sc_layouts_columns_middle';
			?>"<?php
			$drone_media_css = '';
			$drone_media_bg_mask = drone_media_get_theme_option('front_page_googlemap_bg_mask');
			$drone_media_bg_color = drone_media_get_theme_option('front_page_googlemap_bg_color');
			if (!empty($drone_media_bg_color) && $drone_media_bg_mask > 0)
				$drone_media_css .= 'background-color: '.esc_attr($drone_media_bg_mask==1
																	? $drone_media_bg_color
																	: drone_media_hex2rgba($drone_media_bg_color, $drone_media_bg_mask)
																).';';
			if (!empty($drone_media_css))
				echo ' style="' . esc_attr($drone_media_css) . '"';
	?>>
		<div class="front_page_section_content_wrap front_page_section_googlemap_content_wrap<?php
			$drone_media_layout = drone_media_get_theme_option('front_page_googlemap_layout');
			if ($drone_media_layout != 'fullwidth')
				echo ' content_wrap';
		?>">
			<?php
			// Content wrap with title and description
			$drone_media_caption = drone_media_get_theme_option('front_page_googlemap_caption');
			$drone_media_description = drone_media_get_theme_option('front_page_googlemap_description');
			if (!empty($drone_media_caption) || !empty($drone_media_description) || (current_user_can('edit_theme_options') && is_customize_preview())) {
				if ($drone_media_layout == 'fullwidth') {
					?><div class="content_wrap"><?php
				}
					// Caption
					if (!empty($drone_media_caption) || (current_user_can('edit_theme_options') && is_customize_preview())) {
						?><h2 class="front_page_section_caption front_page_section_googlemap_caption front_page_block_<?php echo !empty($drone_media_caption) ? 'filled' : 'empty'; ?>"><?php
							echo wp_kses_post($drone_media_caption);
						?></h2><?php
					}
				
					// Description (text)
					if (!empty($drone_media_description) || (current_user_can('edit_theme_options') && is_customize_preview())) {
						?><div class="front_page_section_description front_page_section_googlemap_description front_page_block_<?php echo !empty($drone_media_description) ? 'filled' : 'empty'; ?>"><?php
							echo wp_kses_post(wpautop($drone_media_description));
						?></div><?php
					}
				if ($drone_media_layout == 'fullwidth') {
					?></div><?php
				}
			}

			// Content (text)
			$drone_media_content = drone_media_get_theme_option('front_page_googlemap_content');
			if (!empty($drone_media_content) || (current_user_can('edit_theme_options') && is_customize_preview())) {
				if ($drone_media_layout == 'columns') {
					?><div class="front_page_section_columns front_page_section_googlemap_columns columns_wrap">
						<div class="column-1_3">
					<?php
				} else if ($drone_media_layout == 'fullwidth') {
					?><div class="content_wrap"><?php
				}
	
				?><div class="front_page_section_content front_page_section_googlemap_content front_page_block_<?php echo !empty($drone_media_content) ? 'filled' : 'empty'; ?>"><?php
					echo wp_kses_post($drone_media_content);
				?></div><?php
	
				if ($drone_media_layout == 'columns') {
					?></div><div class="column-2_3"><?php
				} else if ($drone_media_layout == 'fullwidth') {
					?></div><?php
				}
			}
			
			// Widgets output
			?><div class="front_page_section_output front_page_section_googlemap_output"><?php 
				if (is_active_sidebar('front_page_googlemap_widgets')) {
					dynamic_sidebar( 'front_page_googlemap_widgets' );
				} else if (current_user_can( 'edit_theme_options' )) {
					if (!drone_media_exists_trx_addons())
						drone_media_customizer_need_trx_addons_message();
					else
						drone_media_customizer_need_widgets_message('front_page_googlemap_caption', 'ThemeREX Addons - Google map');
				}
			?></div><?php

			if ($drone_media_layout == 'columns' && (!empty($drone_media_content) || (current_user_can('edit_theme_options') && is_customize_preview()))) {
				?></div></div><?php
			}
			?>			
		</div>
	</div>
</div>