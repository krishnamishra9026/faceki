<?php
// Add plugin-specific colors and fonts to the custom CSS
if (!function_exists('drone_media_trx_addons_get_mycss')) {
	add_filter('drone_media_filter_get_css', 'drone_media_trx_addons_get_mycss', 10, 4);
	function drone_media_trx_addons_get_mycss($css, $colors, $fonts, $scheme='') {

        if (isset($css['fonts']) && $fonts) {
            $css['fonts'] .= <<<CSS
            .sc_price_item_price,
            .esg-grid .eg-droneportfolio-element-11,
            .esg-grid .eg-droneportfolio-element-10,
            blockquote:before, .widget_calendar th, .widget_calendar td,
            blockquote > a, blockquote > p > a, blockquote > cite, blockquote > p > cite{
                {$fonts['p_font-family']}
            }
            .sc_services_light .sc_services_item_number,
            .esg-grid .eg-droneportfolio-element-3,
            .comments_list_wrap .comment_reply,
            .sc_skills_pie.sc_skills_compact_off .sc_skills_item_title,
            table th,
            .sc_services_light .sc_services_item_title,
            .ex-top .post_meta,
            .post_meta_item.post_categories a,
            .ex-top .post_meta .post_meta_item,
            .ex-bot .post_meta,
            .ex-bot .post_meta .post_meta_item,
            blockquote p,
            .widget_product_tag_cloud a,
            .widget_tag_cloud a,
            .trx_addons_dropcap,
            body .mejs-container *  {
                {$fonts['h1_font-family']}
            }
            
            .sc_layouts_row_type_normal .sc_layouts_cart .sc_layouts_item_details .sc_layouts_item_details_line1,
            .sc_layouts_row_type_normal .sc_layouts_cart .sc_layouts_item_details .sc_layouts_item_details_line2 {
                {$fonts['menu_font-family']}
                {$fonts['menu_font-weight']}
                {$fonts['menu_font-size']}
                {$fonts['menu_font-style']}
                {$fonts['menu_text-decoration']}
                {$fonts['menu_text-transform']}
                {$fonts['menu_letter-spacing']}
            }
CSS;
        }

        if (isset($css['colors']) && $colors) {
            $css['colors'] .= <<<CSS
            
            /* Inline colors */
            .trx_addons_accent,
            .trx_addons_accent_big,
            .trx_addons_accent > a,
            .trx_addons_accent > * {
                color: {$colors['text_link']};
            }
            .trx_addons_accent_hovered {
                color: {$colors['text_hover']};
            }
            .trx_addons_accent_bg {
                background-color: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }

            
            /* Tooltip */
            .trx_addons_tooltip {
                color: {$colors['text_dark']};
                border-color: {$colors['text_dark']};
            }
            .trx_addons_tooltip:before {
                background-color: {$colors['text_dark']};
                color: {$colors['inverse_link']};
            }
            .trx_addons_tooltip:after {
                border-top-color: {$colors['text_dark']};
            }
            
            
            /* Dropcaps */
            .trx_addons_dropcap_style_1 {
                background: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }
            .trx_addons_dropcap_style_2 {
                background: {$colors['bg_color_0']};
                border-color: {$colors['text_link']};
                color: {$colors['text_link']};
            }
            
            
            /* Blockqoute my styles */
            blockquote {
                color: {$colors['text_dark']};
                background: {$colors['bg_color_0']};
            }
            blockquote > a, blockquote > p > a,
            blockquote > cite, blockquote > p > cite {
                color: {$colors['text_dark']};
            }
            blockquote > a, blockquote > p > a:hover {
                color: {$colors['text_link']};
            }
            blockquote:before {
                color: {$colors['text_link']};
            }
            
            /* Images */
            figure figcaption,
            .wp-caption .wp-caption-text,
            .wp-caption .wp-caption-dd,
            .wp-caption-overlay .wp-caption .wp-caption-text,
            .wp-caption-overlay .wp-caption .wp-caption-dd {
                color: {$colors['inverse_link']};
                background-color: {$colors['text_link_08']};
            }
            
            
            /* Lists */
            ul[class*="trx_addons_list"] > li:before{
                color: {$colors['text_link']};
            }
            .trx_addons_list_square li:before {
                background-color: {$colors['text_link']};
            }
            ul[class*="trx_addons_list_circle"] > li:before {
                border-color: {$colors['text_link']};
            }
            
            /* Table */
            table th {
                color: {$colors['inverse_link']};
                background-color: {$colors['text_link']};
            }
            table th, table th + th, table td + th  {
                border-color: {$colors['inverse_link_02']};
            }
            table td, table th + td, table td + td {
                color: {$colors['text']};
                border-color: {$colors['alter_bd_color']};
            }
            table:not(.wp-calendar-table) > tbody > tr:nth-child(2n+1) > td {
                background-color: {$colors['alter_bg_hover']};
            }
            table:not(.wp-calendar-table) > tbody > tr:nth-child(2n) > td {
                background-color: {$colors['alter_bg_color']};
            }

            /* Main menu */
            .sc_layouts_menu_nav>li>a {
                color: {$colors['text_dark']} !important;
            }
            .sc_layouts_menu_nav>li>a:hover,
            .sc_layouts_menu_nav>li.sfHover>a,
            .sc_layouts_menu_nav>li.current-menu-item>a,
            .sc_layouts_menu_nav>li.current-menu-parent>a,
            .sc_layouts_menu_nav>li.current-menu-ancestor>a {
                color: {$colors['text_link']} !important;
            }
            
            /* Dropdown menu */
            .sc_layouts_menu_nav>li ul {
                background-color: {$colors['text_link']};
            }
            .sc_layouts_menu_popup .sc_layouts_menu_nav>li>a,
            .sc_layouts_menu_nav>li li>a {
                color: {$colors['inverse_link']} !important;
            }
            .sc_layouts_menu_nav>li li>a:hover:after,
            .sc_layouts_menu_popup .sc_layouts_menu_nav>li>a:hover,
            .sc_layouts_menu_popup .sc_layouts_menu_nav>li.sfHover>a,
            .sc_layouts_menu_nav>li li>a:hover,
            .sc_layouts_menu_nav>li li.sfHover>a,
            .sc_layouts_menu_nav>li li.current-menu-item>a,
            .sc_layouts_menu_nav>li li.current-menu-parent>a,
            .sc_layouts_menu_nav>li li.current-menu-ancestor>a {
                color: {$colors['inverse_dark']} !important;
                background-color: {$colors['bg_color_0']};
            }
            
            
            /* Breadcrumbs */
            .sc_layouts_title_caption {
                color: {$colors['text_dark']};
                background-color: {$colors['text_link']};
            }
            .sc_layouts_title_breadcrumbs a {
                color: {$colors['text_dark']} !important;
            }
            .breadcrumbs_item.current{
                color: {$colors['text_dark']} !important;
            }
            .sc_layouts_title_breadcrumbs a:hover {
                color: {$colors['text_link']} !important;
            }
            
            /* Slider */
            .sc_slider_controls .slider_controls_wrap > a,
            .slider_container.slider_controls_side .slider_controls_wrap > a,
            .slider_outer_controls_side .slider_controls_wrap > a {
                color: {$colors['inverse_link']};
                background-color: {$colors['text_link']};
            }
            .sc_slider_controls .slider_controls_wrap > a:hover,
            .slider_container.slider_controls_side .slider_controls_wrap > a:hover,
            .slider_outer_controls_side .slider_controls_wrap > a:hover {
                 color: {$colors['inverse_link']};
                background-color: {$colors['text_dark']};
            }
            
            
            /* Price */
            .sc_price_item {
                color: {$colors['text']};
                background-color: {$colors['bg_color']};
                border-color: {$colors['text_dark']};
            }
            .sc_price_item:hover {
                color: {$colors['text']};
                background-color: {$colors['bg_color']};
                border-color: {$colors['text_link']};
            }
            .sc_price_item .sc_price_item_icon {
                color: {$colors['text_link']};
            }
            .sc_price_item:hover .sc_price_item_icon {
                color: {$colors['text_hover']};
            }
            .sc_price_item .sc_price_item_label {
                background-color: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }
            .sc_price_item:hover .sc_price_item_label {
                background-color: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }
            .sc_price_item .sc_price_item_subtitle {
                color: {$colors['text_dark']};
            }
            .sc_price_item .sc_price_item_title,
            .sc_price_item .sc_price_item_title a {
                color: {$colors['text_dark']};
            }
            .sc_price_item:hover .sc_price_item_title,
            .sc_price_item:hover .sc_price_item_title a {
                color: {$colors['text_link']};
            }
            .sc_price_item .sc_price_item_price {
                color: {$colors['text_link']};
            }
            .sc_price_item .sc_price_item_description,
            .sc_price_item .sc_price_item_details {
                color: {$colors['text']};
            }
            
            
            /* Layouts */
            .sc_layouts_logo .logo_text {
                color: {$colors['text_dark']};
            }
            

            /* Shortcodes */
            .sc_skills_pie.sc_skills_compact_off .sc_skills_total {
                color: {$colors['text_dark']};
            }
            .sc_skills_pie.sc_skills_compact_off .sc_skills_item_title {
                color: {$colors['text_dark']};
            }
            .sc_countdown .sc_countdown_label,
            .sc_countdown_default .sc_countdown_digits span {
                color: {$colors['text_dark']};
                background: {$colors['bg_color_0']};
            }
            
            /* Audio */
            .trx_addons_audio_player.without_cover,
            .format-audio .post_featured.without_thumb .post_audio {
                background: {$colors['bg_color']};
            }
            .mejs-controls .mejs-horizontal-volume-slider .mejs-horizontal-volume-current,
            .mejs-controls .mejs-time-rail .mejs-time-current {
                background: {$colors['bg_color']};
            }
            .mejs-controls .mejs-button {
                background: {$colors['bg_color_0']};
                color: {$colors['inverse_link']};
            }
            .mejs-controls .mejs-button:hover {
                background: {$colors['bg_color_0']};
                color: {$colors['text_link']};
            }
            .trx_addons_audio_player .mejs-controls .mejs-horizontal-volume-slider .mejs-horizontal-volume-total:before, .trx_addons_audio_player .mejs-controls .mejs-time-rail .mejs-time-total:before,
            .mejs-controls .mejs-time-rail .mejs-time-total,
            .mejs-controls .mejs-time-rail .mejs-time-loaded,
            .mejs-container .mejs-controls .mejs-horizontal-volume-slider .mejs-horizontal-volume-total {
                background: {$colors['bg_color_02']};
            }
            .without_thumb .mejs-controls .mejs-currenttime,
            .without_thumb .mejs-controls .mejs-duration,
            .trx_addons_audio_player.without_cover .audio_author,
            .format-audio .post_featured .post_audio_author,
            .trx_addons_audio_player .mejs-container .mejs-controls .mejs-time {
                color: {$colors['text']};
            }
            .format-audio .post_featured.without_thumb .post_audio:not(.with_iframe):before {
                background: {$colors['text_dark']};
            }
            
            .sc_layouts_item_details_line1,
            .sc_layouts_item_details_line2 {
                color: {$colors['text_dark']};
            }
            .ex-bot .sc_button_simple:not(.sc_button_bg_image) {
                color: {$colors['text_dark']};
            }
            .ex-bot .sc_button_simple:not(.sc_button_bg_image):hover {
                color: {$colors['text_link']} !important;
            }
            .widget .elementor-element .socials_wrap .social_item .social_icon,
            .widget_contacts .socials_wrap .social_item .social_icon {
                background: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }
            .widget .elementor-element .socials_wrap .social_item:hover .social_icon,
            .widget_contacts .socials_wrap .social_item:hover .social_icon {
                background: {$colors['text_hover']};
                color: {$colors['inverse_hover']};
            }
            
            .sc_promo.sc_promo_default.sc_promo_size_normal {
                border-color: {$colors['alter_bg_color']};
            }
            .sc_testimonials_item_author_title,
            .sc_promo .trx_addons_list {
                color: {$colors['text_dark']};
            }
            .sc_blogger_default .sc_blogger_item {
                border-color: {$colors['alter_bg_color']};
                background: {$colors['bg_color_0']};
            }
            .sc_blogger_default .sc_blogger_item:hover {
                border-color: {$colors['text_link']};
            }
            .sc_blogger_item_content {
                color: {$colors['text']};
            }
            .sc_team_short .sc_team_item .trx_addons_hover_mask {
                border-color: {$colors['text_link']};
                background: {$colors['bg_color_05']};
            }
            .sc_team .sc_team_item_thumb .sc_team_item_socials .social_item .social_icon {
                border-color: {$colors['text_link']};
                background: {$colors['text_link']};
                color: {$colors['inverse_link']};
            }
            .sc_team .sc_team_item_thumb .sc_team_item_socials .social_item:hover .social_icon {
                border-color: {$colors['text_dark']};
                background: {$colors['text_dark']};
                color: {$colors['inverse_link']};
            }
            .sc_team_default .sc_team_item_subtitle, .sc_team_short .sc_team_item_subtitle, .sc_team_featured .sc_team_item_subtitle {
                color: {$colors['text_link']};
            }
            .sc_form_simple button {
                background: {$colors['text_dark']};
                color: {$colors['text_link']};
            }
            .sc_form_simple button:focus,
            .sc_form_simple button:hover {
                background: {$colors['text_dark']};
                color: {$colors['inverse_hover']};
            }
            .sc_services_light .sc_services_item_number {
                color: {$colors['alter_bg_color']};
            }
            .sc_services_light .with_icon .sc_services_item_icon {
                color: {$colors['inverse_dark']};
            }
            .sc_services_light .sc_services_item_content {
                color: {$colors['text_dark_07']};
            }
            .sc_services_light .with_icon .sc_services_item_title a:hover {
                color: {$colors['inverse_dark']};
            }
            .sc_layouts_item_icon {
                color: {$colors['text_link']};
            }
            
            .wpcf7-form .send_message input[type="submit"] {
                background: {$colors['text_dark']};
                color: {$colors['text_link']};
            }
            .wpcf7-form .send_message input[type="submit"]:focus,
            .wpcf7-form .send_message input[type="submit"]:hover {
                background: {$colors['text_dark']};
                color: {$colors['inverse_hover']};
            }
            
            .wpcf7 .send_message .wpcf7-acceptance .wpcf7-list-item-label,
            .wpcf7 .send_message span.wpcf7-not-valid-tip,
            .wpcf7 .send_message + .wpcf7-response-output{
                color: {$colors['text_dark']};
            }

CSS;
		}

		return $css;
	}
}
?>