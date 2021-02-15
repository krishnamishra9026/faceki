<div class="front_page_section front_page_section_woocommerce<?php
			$drone_media_scheme = drone_media_get_theme_option('front_page_woocommerce_scheme');
			if (!drone_media_is_inherit($drone_media_scheme)) echo ' scheme_'.esc_attr($drone_media_scheme);
			echo ' front_page_section_paddings_'.esc_attr(drone_media_get_theme_option('front_page_woocommerce_paddings'));
		?>"<?php
		$drone_media_css = '';
		$drone_media_bg_image = drone_media_get_theme_option('front_page_woocommerce_bg_image');
		if (!empty($drone_media_bg_image)) 
			$drone_media_css .= 'background-image: url('.esc_url(drone_media_get_attachment_url($drone_media_bg_image)).');';
		if (!empty($drone_media_css))
			echo ' style="' . esc_attr($drone_media_css) . '"';
?>><?php
	// Add anchor
	$drone_media_anchor_icon = drone_media_get_theme_option('front_page_woocommerce_anchor_icon');	
	$drone_media_anchor_text = drone_media_get_theme_option('front_page_woocommerce_anchor_text');	
	if ((!empty($drone_media_anchor_icon) || !empty($drone_media_anchor_text)) && shortcode_exists('trx_sc_anchor')) {
		echo do_shortcode('[trx_sc_anchor id="front_page_section_woocommerce"'
										. (!empty($drone_media_anchor_icon) ? ' icon="'.esc_attr($drone_media_anchor_icon).'"' : '')
										. (!empty($drone_media_anchor_text) ? ' title="'.esc_attr($drone_media_anchor_text).'"' : '')
										. ']');
	}
	?>
	<div class="front_page_section_inner front_page_section_woocommerce_inner<?php
			if (drone_media_get_theme_option('front_page_woocommerce_fullheight'))
				echo ' drone_media-full-height sc_layouts_flex sc_layouts_columns_middle';
			?>"<?php
			$drone_media_css = '';
			$drone_media_bg_mask = drone_media_get_theme_option('front_page_woocommerce_bg_mask');
			$drone_media_bg_color = drone_media_get_theme_option('front_page_woocommerce_bg_color');
			if (!empty($drone_media_bg_color) && $drone_media_bg_mask > 0)
				$drone_media_css .= 'background-color: '.esc_attr($drone_media_bg_mask==1
																	? $drone_media_bg_color
																	: drone_media_hex2rgba($drone_media_bg_color, $drone_media_bg_mask)
																).';';
			if (!empty($drone_media_css))
				echo ' style="' . esc_attr($drone_media_css) . '"';
	?>>
		<div class="front_page_section_content_wrap front_page_section_woocommerce_content_wrap content_wrap woocommerce">
			<?php
			// Content wrap with title and description
			$drone_media_caption = drone_media_get_theme_option('front_page_woocommerce_caption');
			$drone_media_description = drone_media_get_theme_option('front_page_woocommerce_description');
			if (!empty($drone_media_caption) || !empty($drone_media_description) || (current_user_can('edit_theme_options') && is_customize_preview())) {
				// Caption
				if (!empty($drone_media_caption) || (current_user_can('edit_theme_options') && is_customize_preview())) {
					?><h2 class="front_page_section_caption front_page_section_woocommerce_caption front_page_block_<?php echo !empty($drone_media_caption) ? 'filled' : 'empty'; ?>"><?php
						echo wp_kses_post($drone_media_caption);
					?></h2><?php
				}
			
				// Description (text)
				if (!empty($drone_media_description) || (current_user_can('edit_theme_options') && is_customize_preview())) {
					?><div class="front_page_section_description front_page_section_woocommerce_description front_page_block_<?php echo !empty($drone_media_description) ? 'filled' : 'empty'; ?>"><?php
						echo wp_kses_post(wpautop($drone_media_description));
					?></div><?php
				}
			}
		
			// Content (widgets)
			?><div class="front_page_section_output front_page_section_woocommerce_output list_products shop_mode_thumbs"><?php 
				$drone_media_woocommerce_sc = drone_media_get_theme_option('front_page_woocommerce_products');
				if ($drone_media_woocommerce_sc == 'products') {
					$drone_media_woocommerce_sc_ids = drone_media_get_theme_option('front_page_woocommerce_products_per_page');
					$drone_media_woocommerce_sc_per_page = count(explode(',', $drone_media_woocommerce_sc_ids));
				} else {
					$drone_media_woocommerce_sc_per_page = max(1, (int) drone_media_get_theme_option('front_page_woocommerce_products_per_page'));
				}
				$drone_media_woocommerce_sc_columns = max(1, min($drone_media_woocommerce_sc_per_page, (int) drone_media_get_theme_option('front_page_woocommerce_products_columns')));
				echo do_shortcode("[{$drone_media_woocommerce_sc}"
									. ($drone_media_woocommerce_sc == 'products' 
											? ' ids="'.esc_attr($drone_media_woocommerce_sc_ids).'"' 
											: '')
									. ($drone_media_woocommerce_sc == 'product_category' 
											? ' category="'.esc_attr(drone_media_get_theme_option('front_page_woocommerce_products_categories')).'"' 
											: '')
									. ($drone_media_woocommerce_sc != 'best_selling_products' 
											? ' orderby="'.esc_attr(drone_media_get_theme_option('front_page_woocommerce_products_orderby')).'"'
											  . ' order="'.esc_attr(drone_media_get_theme_option('front_page_woocommerce_products_order')).'"' 
											: '')
									. ' per_page="'.esc_attr($drone_media_woocommerce_sc_per_page).'"' 
									. ' columns="'.esc_attr($drone_media_woocommerce_sc_columns).'"' 
									. ']');
			?></div>
		</div>
	</div>
</div>