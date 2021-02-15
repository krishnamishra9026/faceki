<?php
// Add plugin-specific colors and fonts to the custom CSS
if (!function_exists('drone_media_mailchimp_get_css')) {
	add_filter('drone_media_filter_get_css', 'drone_media_mailchimp_get_css', 10, 4);
	function drone_media_mailchimp_get_css($css, $colors, $fonts, $scheme='') {
		
		if (isset($css['fonts']) && $fonts) {
			$css['fonts'] .= <<<CSS
form.mc4wp-form .mc4wp-form-fields input[type="email"] {
	{$fonts['input_font-family']}
	{$fonts['input_font-size']}
	{$fonts['input_font-weight']}
	{$fonts['input_font-style']}
	{$fonts['input_line-height']}
	{$fonts['input_text-decoration']}
	{$fonts['input_text-transform']}
	{$fonts['input_letter-spacing']}
}
CSS;
		
			
			$rad = drone_media_get_border_radius();
			$css['fonts'] .= <<<CSS

form.mc4wp-form .mc4wp-form-fields input[type="email"],
form.mc4wp-form .mc4wp-form-fields input[type="submit"] {
	-webkit-border-radius: {$rad};
	    -ms-border-radius: {$rad};
			border-radius: {$rad};
}

CSS;
		}

		
		if (isset($css['colors']) && $colors) {
			$css['colors'] .= <<<CSS

form.mc4wp-form input[type="email"] {
	background-color: {$colors['text_dark_01']};
	border-color: {$colors['bg_color_0']};
	color: {$colors['text_dark']};
}
form.mc4wp-form input[type="email"]::-webkit-input-placeholder {
    color: {$colors['text_dark_02']};
}
form.mc4wp-form .mc4wp-alert {
	background-color: {$colors['text_link']};
	border-color: {$colors['text_hover']};
	color: {$colors['inverse_link']};
}
form.mc4wp-form .mc4wp-form-fields input[type="submit"] {
    background-color: {$colors['text_dark']};
    color: {$colors['bg_color']};
}
form.mc4wp-form .mc4wp-form-fields input[type="submit"]:hover {
    background-color: {$colors['text_link']};
    color: {$colors['inverse_link']};
}
CSS;
		}

		return $css;
	}
}
?>