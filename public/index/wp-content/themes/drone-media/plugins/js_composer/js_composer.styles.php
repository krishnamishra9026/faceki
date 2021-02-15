<?php
// Add plugin-specific colors and fonts to the custom CSS
if ( !function_exists( 'drone_media_vc_get_css' ) ) {
	add_filter( 'drone_media_filter_get_css', 'drone_media_vc_get_css', 10, 4 );
	function drone_media_vc_get_css($css, $colors, $fonts, $scheme='') {
		if (isset($css['fonts']) && $fonts) {
			$css['fonts'] .= <<<CSS
			.vc_message_box,
			.vc_progress_bar.vc_progress_bar_narrow .vc_single_bar .vc_label,
			.wpb-js-composer .vc_tta.vc_tta-color-grey.vc_tta-style-classic .vc_tta-tab > a {
			    {$fonts['h1_font-family']}
			}
            .vc_progress_bar.vc_progress_bar_narrow .vc_single_bar .vc_label .vc_label_units {
                {$fonts['h1_font-family']}
            }

CSS;
		}

		if (isset($css['colors']) && $colors) {
			$css['colors'] .= <<<CSS

/* Row and columns */
.scheme_self.vc_section,
.scheme_self.wpb_row,
.scheme_self.wpb_column > .vc_column-inner > .wpb_wrapper,
.scheme_self.wpb_text_column {
	color: {$colors['text']};
}

/* Accordion */
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel-heading .vc_tta-controls-icon {
	color: {$colors['text_dark']};
	background-color: {$colors['bg_color_0']};
}
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel-heading .vc_tta-controls-icon:before,
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel-heading .vc_tta-controls-icon:after {
	border-color: {$colors['text_dark']};
}
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel .vc_tta-panel-title > a {
	color: {$colors['text_dark']};
}
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel.vc_active .vc_tta-panel-title > a,
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel .vc_tta-panel-title > a:hover {
	color: {$colors['text_link']};
}
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel.vc_active .vc_tta-panel-title > a .vc_tta-controls-icon,
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel .vc_tta-panel-title > a:hover .vc_tta-controls-icon {
	color: {$colors['text_link']};
	background-color: {$colors['bg_color_0']};
}
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel.vc_active .vc_tta-panel-title > a .vc_tta-controls-icon:before,
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-panel.vc_active .vc_tta-panel-title > a .vc_tta-controls-icon:after {
	border-color: {$colors['text_link']};
}
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel {
    border-color: {$colors['alter_bg_color']};
    background-color: {$colors['alter_bg_color']};
}
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel:hover,
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel.vc_active,
.wpb-js-composer .vc_tta.vc_tta-accordion .vc_tta-panel.vc_active .vc_tta-panel-body {
    border-color: {$colors['text_link']};
    background-color: {$colors['bg_color_0']};
}

/* Tabs */
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-tabs-list .vc_tta-tab > a {
	color: {$colors['text_dark']};
	border-color: {$colors['bg_color_0']};
	background-color: {$colors['bg_color_0']};
}
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-tabs-list .vc_tta-tab > a:hover,
.wpb-js-composer .vc_tta-color-grey.vc_tta-style-classic .vc_tta-tabs-list .vc_tta-tab.vc_active > a {
	color: {$colors['text_link']};
	border-color: {$colors['text_link']};
	background-color: {$colors['bg_color_0']};
}

/* Separator */
.vc_separator.vc_sep_color_grey .vc_sep_line {
	border-color: {$colors['bd_color']};
}

/* Progress bar */
.vc_progress_bar.vc_progress_bar_narrow .vc_single_bar {
	background-color: {$colors['alter_bd_color']};
}
.vc_progress_bar.vc_progress_bar_narrow.vc_progress-bar-color-bar_red .vc_single_bar .vc_bar {
	background-color: {$colors['text_link']};
}
.vc_progress_bar.vc_progress_bar_narrow .vc_single_bar .vc_label {
	color: {$colors['text_dark']};
}
.vc_progress_bar.vc_progress_bar_narrow .vc_single_bar .vc_label .vc_label_units {
	color: {$colors['text_link']};
}

.vc_color-grey.vc_message_box {
    background-color: {$colors['bg_color_0']};
    border-color: {$colors['alter_bg_color']};
    color: {$colors['text_dark']};
}
.vc_color-grey.vc_message_box .vc_message_box-icon {
    color: {$colors['text']};
}
.vc_color-grey.vc_message_box.vc_message_box_closeable:after {
    color: {$colors['text']};
    background-color: {$colors['alter_bg_color']};
}

.vc_color-warning.vc_message_box {
    background-color: {$colors['text_link']};
    border-color: {$colors['text_link']};
    color: {$colors['inverse_link']};
}
.vc_color-warning.vc_message_box.vc_message_box_closeable:after {
    color: {$colors['text_link']};
    background-color: {$colors['alter_bg_color']};
}
.vc_color-warning.vc_message_box .vc_message_box-icon {
    color: {$colors['inverse_link']};
}

.vc_color-info.vc_message_box {
    background: {$colors['alter_bg_color']};
    border-color: {$colors['alter_bg_color']};
    color: {$colors['text_dark']};
}
.vc_color-info.vc_message_box.vc_message_box_closeable:after {
    color: {$colors['inverse_link']};
    background-color: {$colors['text']};
}
.vc_color-info.vc_message_box .vc_message_box-icon {
    color: {$colors['text_dark']};
}

.vc_color-success.vc_message_box {
    background-color: {$colors['text_dark']};
    border-color: {$colors['text_dark']};
    color: {$colors['inverse_hover']};
}
.vc_color-success.vc_message_box.vc_message_box_closeable:after {
    color: {$colors['text_dark']};
    background-color: {$colors['alter_bg_color']};
}
.vc_color-success.vc_message_box .vc_message_box-icon {
    color: {$colors['inverse_link']};
}

CSS;
		}
		
		return $css;
	}
}
?>