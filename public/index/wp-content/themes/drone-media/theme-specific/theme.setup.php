<?php
/**
 * Setup theme-specific fonts and colors
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0.22
 */

if (!defined("DRONE_MEDIA_THEME_FREE")) define("DRONE_MEDIA_THEME_FREE", false);
if (!defined("DRONE_MEDIA_THEME_FREE_WP")) define("DRONE_MEDIA_THEME_FREE_WP", false);

// Theme storage
$DRONE_MEDIA_STORAGE = array(
	// Theme required plugin's slugs
	'required_plugins' => array_merge(

		// List of plugins for both - FREE and PREMIUM versions
		//-----------------------------------------------------
		array(
			// Required plugins
			// DON'T COMMENT OR REMOVE NEXT LINES!
			'trx_addons'					=> esc_html__('ThemeREX Addons', 'drone-media'),

			// Recommended (supported) plugins fot both (lite and full) versions
			// If plugin not need - comment (or remove) it
			'mailchimp-for-wp'					=> esc_html__('MailChimp for WP', 'drone-media'),
            'woocommerce'						=> esc_html__('WooCommerce', 'drone-media'),
            'contact-form-7'					=> esc_html__('Contact Form 7', 'drone-media'),
            'gdpr-framework'					=> esc_html__('GDPR Framework', 'drone-media'),
            'elementor'         				=> esc_html__('Elementor', 'drone-media'),
		),

		// List of plugins for PREMIUM version only
		//-----------------------------------------------------
		DRONE_MEDIA_THEME_FREE 
			? array(
					// Recommended (supported) plugins for the FREE (lite) version
					'siteorigin-panels'			=> esc_html__('SiteOrigin Panels', 'drone-media'),
					) 
			: array(
					// Recommended (supported) plugins for the PRO (full) version
					// If plugin not need - comment (or remove) it
					'essential-grid'			=> esc_html__('Essential Grid', 'drone-media'),
					'revslider'					=> esc_html__('Revolution Slider', 'drone-media'),
					'js_composer'				=> esc_html__('WPBakery PageBuilder', 'drone-media'),
                    'elegro-payment'			=> esc_html__('Elegro Crypto Payment', 'drone-media'),
					'vc-extensions-bundle'		=> esc_html__('WPBakery PageBuilder extensions bundle', 'drone-media'),
					'trx_updater'		        => esc_html__('TRX Updater', 'drone-media')
				)
	),
	
	// Theme-specific URLs (will be escaped in place of the output)
	'theme_demo_url'	=> '//drone-media.ancorathemes.com',
	'theme_doc_url'		=> '//drone-media.ancorathemes.com/doc',
	'theme_download_url'=> '//themeforest.net/item/drone-media-aerial-photography-videography/21057990?s_rank=1',

	'theme_support_url'	=> '//themerex.net/support/',							// Ancora

	'theme_video_url'	=> 'https://www.youtube.com/channel/UCdIjRh7-lPVHqTTKpaf8PLA',	// Ancora
);

// Theme init priorities:
// Action 'after_setup_theme'
// 1 - register filters to add/remove lists items in the Theme Options
// 2 - create Theme Options
// 3 - add/remove Theme Options elements
// 5 - load Theme Options. Attention! After this step you can use only basic options (not overriden)
// 9 - register other filters (for installer, etc.)
//10 - standard Theme init procedures (not ordered)
// Action 'wp_loaded'
// 1 - detect override mode. Attention! Only after this step you can use overriden options (separate values for the shop, courses, etc.)

if ( !function_exists('drone_media_customizer_theme_setup1') ) {
	add_action( 'after_setup_theme', 'drone_media_customizer_theme_setup1', 1 );
	function drone_media_customizer_theme_setup1() {

		// -----------------------------------------------------------------
		// -- ONLY FOR PROGRAMMERS, NOT FOR CUSTOMER
		// -- Internal theme settings
		// -----------------------------------------------------------------
		drone_media_storage_set('settings', array(
			
			'duplicate_options'		=> 'child',		// none  - use separate options for template and child-theme
													// child - duplicate theme options from the main theme to the child-theme only
													// both  - sinchronize changes in the theme options between main and child themes
			
			'custmize_refresh'		=> 'auto',		// Refresh method for preview area in the Appearance - Customize:
													// auto - refresh preview area on change each field with Theme Options
													// manual - refresh only obn press button 'Refresh' at the top of Customize frame
		
			'max_load_fonts'		=> 5,			// Max fonts number to load from Google fonts or from uploaded fonts
		
			'comment_maxlength'		=> 1000,		// Max length of the message from contact form

			'comment_after_name'	=> true,		// Place 'comment' field before the 'name' and 'email'
			
			'socials_type'			=> 'icons',		// Type of socials:
													// icons - use font icons to present social networks
													// images - use images from theme's folder trx_addons/css/icons.png
			
			'icons_type'			=> 'icons',		// Type of other icons:
													// icons - use font icons to present icons
													// images - use images from theme's folder trx_addons/css/icons.png
			
			'icons_selector'		=> 'internal',	// Icons selector in the shortcodes:
													// internal - internal popup with plugin's or theme's icons list (fast)
			'check_min_version'		=> true,		// Check if exists a .min version of .css and .js and return path to it
													// instead the path to the original file
													// (if debug_mode is off and modification time of the original file < time of the .min file)
			'autoselect_menu'		=> false,		// Show any menu if no menu selected in the location 'main_menu'
													// (for example, the theme is just activated)
			'disable_jquery_ui'		=> false,		// Prevent loading custom jQuery UI libraries in the third-party plugins
		
			'use_mediaelements'		=> true,		// Load script "Media Elements" to play video and audio
			
			'tgmpa_upload'			=> false,		// Allow upload not pre-packaged plugins via TGMPA

			'separate_schemes'       => true,               // Save color schemes to the separate files __color_xxx.css (true) or append its to the __custom.css (false)

			'gutenberg_add_context'  => false,              // Add context to the Gutenberg editor styles with our method (if true - use if any problem with editor styles) or use native Gutenberg way via add_editor_style() (if false - used by default)

			'gutenberg_safe_mode'    => array('elementor'), // vc,elementor - Prevent simultaneous editing of posts for Gutenberg and other PageBuilders (VC, Elementor)
		));


		// -----------------------------------------------------------------
		// -- Theme fonts (Google and/or custom fonts)
		// -----------------------------------------------------------------
		
		// Fonts to load when theme start
		// It can be Google fonts or uploaded fonts, placed in the folder /css/font-face/font-name inside the theme folder
		// Attention! Font's folder must have name equal to the font's name, with spaces replaced on the dash '-'
		
		drone_media_storage_set('load_fonts', array(
			// Google font
			array(
				'name'	 => 'Fjalla One',
				'family' => 'sans-serif'
				),
			// Font-face packed with theme
			array(
				'name'   => 'Montserrat',
				'family' => 'sans-serif',
                'styles' => '400,500,700'
				)
		));
		
		// Characters subset for the Google fonts. Available values are: latin,latin-ext,cyrillic,cyrillic-ext,greek,greek-ext,vietnamese
		drone_media_storage_set('load_fonts_subset', 'latin,latin-ext');
		
		// Settings of the main tags
		drone_media_storage_set('theme_fonts', array(
			'p' => array(
				'title'				=> esc_html__('Main text', 'drone-media'),
				'description'		=> esc_html__('Font settings of the main text of the site', 'drone-media'),
				'font-family'		=> '"Montserrat",sans-serif',
				'font-size' 		=> '14px',
				'font-weight'		=> '500',
				'font-style'		=> 'normal',
				'line-height'		=> '24px',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'none',
				'letter-spacing'	=> '',
				'margin-top'		=> '0em',
				'margin-bottom'		=> '1.72em'
				),
			'h1' => array(
				'title'				=> esc_html__('Heading 1', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '4.1em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.21em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1.2px',
				'margin-top'		=> '6rem',
				'margin-bottom'		=> '2.85rem'
				),
			'h2' => array(
				'title'				=> esc_html__('Heading 2', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '3.5em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.23em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1px',
				'margin-top'		=> '6.15rem',
				'margin-bottom'		=> '2.1rem'
				),
			'h3' => array(
				'title'				=> esc_html__('Heading 3', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '2.571em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.29em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '0.7px',
				'margin-top'		=> '6.2rem',
				'margin-bottom'		=> '1.8rem'
				),
			'h4' => array(
				'title'				=> esc_html__('Heading 4', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '2.143em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.27em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '0.6px',
				'margin-top'		=> '6.25rem',
				'margin-bottom'		=> '1.5rem'
				),
			'h5' => array(
				'title'				=> esc_html__('Heading 5', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '1.714em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.36em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '0.5px',
				'margin-top'		=> '6.3rem',
				'margin-bottom'		=> '1.1rem'
				),
			'h6' => array(
				'title'				=> esc_html__('Heading 6', 'drone-media'),
				'font-family'		=> '"Montserrat",sans-serif',
				'font-size' 		=> '1.1em',
				'font-weight'		=> '700',
				'font-style'		=> 'normal',
				'line-height'		=> '1.4706em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'none',
				'letter-spacing'	=> '0px',
				'margin-top'		=> '6.3rem',
				'margin-bottom'		=> '1rem'
				),
			'logo' => array(
				'title'				=> esc_html__('Logo text', 'drone-media'),
				'description'		=> esc_html__('Font settings of the text case of the logo', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '2.143em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.25em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1px'
				),
			'button' => array(
				'title'				=> esc_html__('Buttons', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '1.143em',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.5em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1px'
				),
			'input' => array(
				'title'				=> esc_html__('Input fields', 'drone-media'),
				'description'		=> esc_html__('Font settings of the input fields, dropdowns and textareas', 'drone-media'),
				'font-family'		=> '"Montserrat",sans-serif',
				'font-size' 		=> '1em',
				'font-weight'		=> '500',
				'font-style'		=> 'normal',
				'line-height'		=> '1.5em',	// Attention! Firefox don't allow line-height less then 1.5em in the select
				'text-decoration'	=> 'none',
				'text-transform'	=> 'none',
				'letter-spacing'	=> '0px'
				),
			'info' => array(
				'title'				=> esc_html__('Post meta', 'drone-media'),
				'description'		=> esc_html__('Font settings of the post meta: date, counters, share, etc.', 'drone-media'),
				'font-family'		=> '"Montserrat",sans-serif',
				'font-size' 		=> '1em',
				'font-weight'		=> '700',
				'font-style'		=> 'normal',
				'line-height'		=> '1.5em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'none',
				'letter-spacing'	=> '0px',
				'margin-top'		=> '0.4em',
				'margin-bottom'		=> ''
				),
			'menu' => array(
				'title'				=> esc_html__('Main menu', 'drone-media'),
				'description'		=> esc_html__('Font settings of the main menu items', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '16px',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.5em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1px'
				),
			'submenu' => array(
				'title'				=> esc_html__('Dropdown menu', 'drone-media'),
				'description'		=> esc_html__('Font settings of the dropdown menu items', 'drone-media'),
				'font-family'		=> '"Fjalla One",sans-serif',
				'font-size' 		=> '16px',
				'font-weight'		=> '400',
				'font-style'		=> 'normal',
				'line-height'		=> '1.2em',
				'text-decoration'	=> 'none',
				'text-transform'	=> 'uppercase',
				'letter-spacing'	=> '1px'
				)
		));
		
		
		// -----------------------------------------------------------------
		// -- Theme colors for customizer
		// -- Attention! Inner scheme must be last in the array below
		// -----------------------------------------------------------------
		drone_media_storage_set('scheme_color_groups', array(
			'main'	=> array(
							'title'			=> esc_html__('Main', 'drone-media'),
							'description'	=> esc_html__('Colors of the main content area', 'drone-media')
							),
			'alter'	=> array(
							'title'			=> esc_html__('Alter', 'drone-media'),
							'description'	=> esc_html__('Colors of the alternative blocks (sidebars, etc.)', 'drone-media')
							),
			'extra'	=> array(
							'title'			=> esc_html__('Extra', 'drone-media'),
							'description'	=> esc_html__('Colors of the extra blocks (dropdowns, price blocks, table headers, etc.)', 'drone-media')
							),
			'inverse' => array(
							'title'			=> esc_html__('Inverse', 'drone-media'),
							'description'	=> esc_html__('Colors of the inverse blocks - when link color used as background of the block (dropdowns, blockquotes, etc.)', 'drone-media')
							),
			'input'	=> array(
							'title'			=> esc_html__('Input', 'drone-media'),
							'description'	=> esc_html__('Colors of the form fields (text field, textarea, select, etc.)', 'drone-media')
							),
			)
		);
		drone_media_storage_set('scheme_color_names', array(
			'bg_color'	=> array(
							'title'			=> esc_html__('Background color', 'drone-media'),
							'description'	=> esc_html__('Background color of this block in the normal state', 'drone-media')
							),
			'bg_hover'	=> array(
							'title'			=> esc_html__('Background hover', 'drone-media'),
							'description'	=> esc_html__('Background color of this block in the hovered state', 'drone-media')
							),
			'bd_color'	=> array(
							'title'			=> esc_html__('Border color', 'drone-media'),
							'description'	=> esc_html__('Border color of this block in the normal state', 'drone-media')
							),
			'bd_hover'	=>  array(
							'title'			=> esc_html__('Border hover', 'drone-media'),
							'description'	=> esc_html__('Border color of this block in the hovered state', 'drone-media')
							),
			'text'		=> array(
							'title'			=> esc_html__('Text', 'drone-media'),
							'description'	=> esc_html__('Color of the plain text inside this block', 'drone-media')
							),
			'text_dark'	=> array(
							'title'			=> esc_html__('Text dark', 'drone-media'),
							'description'	=> esc_html__('Color of the dark text (bold, header, etc.) inside this block', 'drone-media')
							),
			'text_light'=> array(
							'title'			=> esc_html__('Text light', 'drone-media'),
							'description'	=> esc_html__('Color of the light text (post meta, etc.) inside this block', 'drone-media')
							),
			'text_link'	=> array(
							'title'			=> esc_html__('Link', 'drone-media'),
							'description'	=> esc_html__('Color of the links inside this block', 'drone-media')
							),
			'text_hover'=> array(
							'title'			=> esc_html__('Link hover', 'drone-media'),
							'description'	=> esc_html__('Color of the hovered state of links inside this block', 'drone-media')
							),
			'text_link2'=> array(
							'title'			=> esc_html__('Link 2', 'drone-media'),
							'description'	=> esc_html__('Color of the accented texts (areas) inside this block', 'drone-media')
							),
			'text_hover2'=> array(
							'title'			=> esc_html__('Link 2 hover', 'drone-media'),
							'description'	=> esc_html__('Color of the hovered state of accented texts (areas) inside this block', 'drone-media')
							),
			'text_link3'=> array(
							'title'			=> esc_html__('Link 3', 'drone-media'),
							'description'	=> esc_html__('Color of the other accented texts (buttons) inside this block', 'drone-media')
							),
			'text_hover3'=> array(
							'title'			=> esc_html__('Link 3 hover', 'drone-media'),
							'description'	=> esc_html__('Color of the hovered state of other accented texts (buttons) inside this block', 'drone-media')
							)
			)
		);
		drone_media_storage_set('schemes', array(
		
			// Color scheme: 'default'
			'default' => array(
				'title'	 => esc_html__('Default', 'drone-media'),
				'colors' => array(
					
					// Whole block border and background
					'bg_color'			=> '#ffffff',   //
					'bd_color'			=> '#dbdada',   //
		
					// Text and links colors
					'text'				=> '#7e8285',   //
					'text_light'		=> '#b7b7b7',
					'text_dark'			=> '#222d35',   //
					'text_link'			=> '#d72323',   //
					'text_hover'		=> '#222d35',   //
					'text_link2'		=> '#80d572',
					'text_hover2'		=> '#8be77c',
					'text_link3'		=> '#ddb837',
					'text_hover3'		=> '#eec432',
		
					// Alternative blocks (sidebar, tabs, alternative blocks, etc.)
					'alter_bg_color'	=> '#f7f7f7',   //
					'alter_bg_hover'	=> '#efefef',   //
					'alter_bd_color'	=> '#e9eaeb',   //
					'alter_bd_hover'	=> '#dadada',
					'alter_text'		=> '#333333',
					'alter_light'		=> '#b7b7b7',
					'alter_dark'		=> '#222d35',   //
					'alter_link'		=> '#d72323',   //
					'alter_hover'		=> '#72cfd5',
					'alter_link2'		=> '#8be77c',
					'alter_hover2'		=> '#80d572',
					'alter_link3'		=> '#eec432',
					'alter_hover3'		=> '#ddb837',
		
					// Extra blocks (submenu, tabs, color blocks, etc.)
					'extra_bg_color'	=> '#1e1d22',
					'extra_bg_hover'	=> '#222d35',//
					'extra_bd_color'	=> '#313131',
					'extra_bd_hover'	=> '#3d3d3d',
					'extra_text'		=> '#bfbfbf',
					'extra_light'		=> '#afafaf',
					'extra_dark'		=> '#ffffff',
					'extra_link'		=> '#a13535',   //
					'extra_hover'		=> '#f92828',   //
					'extra_link2'		=> '#d72323',//
					'extra_hover2'		=> '#8be77c',
					'extra_link3'		=> '#ddb837',
					'extra_hover3'		=> '#eec432',
		
					// Input fields (form's fields and textarea)
					'input_bg_color'	=> '#efefef',   //
					'input_bg_hover'	=> '#efefef',   //
					'input_bd_color'	=> '#efefef',   //
					'input_bd_hover'	=> '#222d35',   //
					'input_text'		=> '#7e8285',   //
					'input_light'		=> '#7e8285',   //
					'input_dark'		=> '#222d35',   //
					
					// Inverse blocks (text and links on the 'text_link' background)
					'inverse_bd_color'	=> '#67bcc1',
					'inverse_bd_hover'	=> '#5aa4a9',
					'inverse_text'		=> '#1d1d1d',
					'inverse_light'		=> '#333333',
					'inverse_dark'		=> '#222d35',       //
					'inverse_link'		=> '#ffffff',
					'inverse_hover'		=> '#ffffff'
				)
			),
		
			// Color scheme: 'dark'
			'dark' => array(
				'title'  => esc_html__('Dark', 'drone-media'),
				'colors' => array(
					
					// Whole block border and background
					'bg_color'			=> '#232e35',   //
					'bd_color'			=> '#2e2c33',
		
					// Text and links colors
					'text'				=> '#a4a7a9',   //
					'text_light'		=> '#5f5f5f',
					'text_dark'			=> '#ffffff',
					'text_link'			=> '#d72323',   //
					'text_hover'		=> '#ffffff',   //
					'text_link2'		=> '#80d572',
					'text_hover2'		=> '#8be77c',
					'text_link3'		=> '#ddb837',
					'text_hover3'		=> '#eec432',

					// Alternative blocks (sidebar, tabs, alternative blocks, etc.)
					'alter_bg_color'	=> '#222d35',   //
					'alter_bg_hover'	=> '#333333',
					'alter_bd_color'	=> '#464646',
					'alter_bd_hover'	=> '#4a4a4a',
					'alter_text'		=> '#a6a6a6',
					'alter_light'		=> '#5f5f5f',
					'alter_dark'		=> '#ffffff',
					'alter_link'		=> '#d72323',   //
					'alter_hover'		=> '#fe7259',
					'alter_link2'		=> '#8be77c',
					'alter_hover2'		=> '#80d572',
					'alter_link3'		=> '#eec432',
					'alter_hover3'		=> '#ddb837',

					// Extra blocks (submenu, tabs, color blocks, etc.)
					'extra_bg_color'	=> '#1e1d22',
					'extra_bg_hover'	=> '#40505c',//
					'extra_bd_color'	=> '#464646',
					'extra_bd_hover'	=> '#4a4a4a',
					'extra_text'		=> '#a6a6a6',
					'extra_light'		=> '#5f5f5f',
					'extra_dark'		=> '#ffffff',
					'extra_link'		=> '#ffaa5f',
					'extra_hover'		=> '#fe7259',
					'extra_link2'		=> '#ffffff',//
					'extra_hover2'		=> '#8be77c',
					'extra_link3'		=> '#ddb837',
					'extra_hover3'		=> '#eec432',

					// Input fields (form's fields and textarea)
					'input_bg_color'	=> '#f62c32',
					'input_bg_hover'	=> '#f62c32',
					'input_bd_color'	=> '#f62c32',
					'input_bd_hover'	=> '#ffffff',
					'input_text'		=> '#ffffff',
					'input_light'		=> 'rgba(255,255,255,0.7)',
					'input_dark'		=> '#ffffff',
					
					// Inverse blocks (text and links on the 'text_link' background)
					'inverse_bd_color'	=> '#e36650',
					'inverse_bd_hover'	=> '#cb5b47',
					'inverse_text'		=> '#1d1d1d',
					'inverse_light'		=> '#5f5f5f',
					'inverse_dark'		=> '#222d35',   //
					'inverse_link'		=> '#ffffff',
					'inverse_hover'		=> '#222d35'
				)
			),

            // Color scheme: 'default_blue'
			'default_blue' => array(
            'title'	 => esc_html__('Default Blue', 'drone-media'),
            'colors' => array(

                // Whole block border and background
                'bg_color'			=> '#ffffff',   //
                'bd_color'			=> '#dbdada',   //

                // Text and links colors
                'text'				=> '#7e8285',   //
                'text_light'		=> '#b7b7b7',
                'text_dark'			=> '#222d35',   //
                'text_link'			=> '#1FACE1',   //
                'text_hover'		=> '#222d35',   //
                'text_link2'		=> '#80d572',
                'text_hover2'		=> '#8be77c',
                'text_link3'		=> '#ddb837',
                'text_hover3'		=> '#eec432',

                // Alternative blocks (sidebar, tabs, alternative blocks, etc.)
                'alter_bg_color'	=> '#f7f7f7',   //
                'alter_bg_hover'	=> '#efefef',   //
                'alter_bd_color'	=> '#e9eaeb',   //
                'alter_bd_hover'	=> '#dadada',
                'alter_text'		=> '#333333',
                'alter_light'		=> '#b7b7b7',
                'alter_dark'		=> '#222d35',   //
                'alter_link'		=> '#1FACE1',   //
                'alter_hover'		=> '#72cfd5',
                'alter_link2'		=> '#8be77c',
                'alter_hover2'		=> '#80d572',
                'alter_link3'		=> '#eec432',
                'alter_hover3'		=> '#ddb837',

                // Extra blocks (submenu, tabs, color blocks, etc.)
                'extra_bg_color'	=> '#1e1d22',
                'extra_bg_hover'	=> '#222d35',//
                'extra_bd_color'	=> '#313131',
                'extra_bd_hover'	=> '#3d3d3d',
                'extra_text'		=> '#bfbfbf',
                'extra_light'		=> '#afafaf',
                'extra_dark'		=> '#ffffff',
                'extra_link'		=> '#0996db',   //
                'extra_hover'		=> '#4eb2e1',   //
                'extra_link2'		=> '#1FACE1',//
                'extra_hover2'		=> '#8be77c',
                'extra_link3'		=> '#ddb837',
                'extra_hover3'		=> '#eec432',

                // Input fields (form's fields and textarea)
                'input_bg_color'	=> '#efefef',   //
                'input_bg_hover'	=> '#efefef',   //
                'input_bd_color'	=> '#efefef',   //
                'input_bd_hover'	=> '#222d35',   //
                'input_text'		=> '#7e8285',   //
                'input_light'		=> '#7e8285',   //
                'input_dark'		=> '#222d35',   //

                // Inverse blocks (text and links on the 'text_link' background)
                'inverse_bd_color'	=> '#67bcc1',
                'inverse_bd_hover'	=> '#5aa4a9',
                'inverse_text'		=> '#1d1d1d',
                'inverse_light'		=> '#333333',
                'inverse_dark'		=> '#222d35',       //
                'inverse_link'		=> '#ffffff',
                'inverse_hover'		=> '#ffffff'
            )
        ),

			// Color scheme: 'dark_blue'
			'dark_blue' => array(
            'title'  => esc_html__('Dark Blue', 'drone-media'),
            'colors' => array(

                // Whole block border and background
                'bg_color'			=> '#232e35',   //
                'bd_color'			=> '#2e2c33',

                // Text and links colors
                'text'				=> '#a4a7a9',   //
                'text_light'		=> '#5f5f5f',
                'text_dark'			=> '#ffffff',
                'text_link'			=> '#1FACE1',   //
                'text_hover'		=> '#ffffff',   //
                'text_link2'		=> '#80d572',
                'text_hover2'		=> '#8be77c',
                'text_link3'		=> '#ddb837',
                'text_hover3'		=> '#eec432',

                // Alternative blocks (sidebar, tabs, alternative blocks, etc.)
                'alter_bg_color'	=> '#222d35',   //
                'alter_bg_hover'	=> '#1b2730',
                'alter_bd_color'	=> '#1b2730',
                'alter_bd_hover'	=> '#4a4a4a',
                'alter_text'		=> '#a6a6a6',
                'alter_light'		=> '#5f5f5f',
                'alter_dark'		=> '#ffffff',
                'alter_link'		=> '#1FACE1',   //
                'alter_hover'		=> '#44c9fd',
                'alter_link2'		=> '#8be77c',
                'alter_hover2'		=> '#80d572',
                'alter_link3'		=> '#eec432',
                'alter_hover3'		=> '#ddb837',

                // Extra blocks (submenu, tabs, color blocks, etc.)
                'extra_bg_color'	=> '#1e1d22',
                'extra_bg_hover'	=> '#40505c',//
                'extra_bd_color'	=> '#1b2730',
                'extra_bd_hover'	=> '#4a4a4a',
                'extra_text'		=> '#a6a6a6',
                'extra_light'		=> '#5f5f5f',
                'extra_dark'		=> '#ffffff',
                'extra_link'		=> '#70d6fd',
                'extra_hover'		=> '#44c9fd',
                'extra_link2'		=> '#ffffff',//
                'extra_hover2'		=> '#8be77c',
                'extra_link3'		=> '#ddb837',
                'extra_hover3'		=> '#eec432',

                // Input fields (form's fields and textarea)
                'input_bg_color'	=> '#4eb2e1',
                'input_bg_hover'	=> '#4eb2e1',
                'input_bd_color'	=> '#4eb2e1',
                'input_bd_hover'	=> '#ffffff',
                'input_text'		=> '#ffffff',
                'input_light'		=> 'rgba(255,255,255,0.7)',
                'input_dark'		=> '#ffffff',

                // Inverse blocks (text and links on the 'text_link' background)
                'inverse_bd_color'	=> '#32c6ff',
                'inverse_bd_hover'	=> '#238fbb',
                'inverse_text'		=> '#1d1d1d',
                'inverse_light'		=> '#5f5f5f',
                'inverse_dark'		=> '#222d35',   //
                'inverse_link'		=> '#ffffff',
                'inverse_hover'		=> '#222d35'
            )
        )
		
		));
		
		// Simple schemes substitution
		drone_media_storage_set('schemes_simple', array(
			// Main color	// Slave elements and it's darkness koef.
			'text_link'		=> array('alter_hover' => 1,	'extra_link' => 1, 'inverse_bd_color' => 0.85, 'inverse_bd_hover' => 0.7),
			'text_hover'	=> array('alter_link' => 1,		'extra_hover' => 1),
			'text_link2'	=> array('alter_hover2' => 1,	'extra_link2' => 1),
			'text_hover2'	=> array('alter_link2' => 1,	'extra_hover2' => 1),
			'text_link3'	=> array('alter_hover3' => 1,	'extra_link3' => 1),
			'text_hover3'	=> array('alter_link3' => 1,	'extra_hover3' => 1)
		));

		// Additional colors for each scheme
		drone_media_storage_set('scheme_colors_add', array(
			'bg_color_0'		=> array('color' => 'bg_color',			'alpha' => 0),
			'bg_color_02'		=> array('color' => 'bg_color',			'alpha' => 0.2),
			'bg_color_05'		=> array('color' => 'bg_color',			'alpha' => 0.5),
			'bg_color_07'		=> array('color' => 'bg_color',			'alpha' => 0.7),
			'bg_color_08'		=> array('color' => 'bg_color',			'alpha' => 0.8),
			'bg_color_09'		=> array('color' => 'bg_color',			'alpha' =>  0.9),
			'inverse_link_02'	=> array('color' => 'inverse_link',		'alpha' =>  0.2),
			'inverse_link_05'	=> array('color' => 'inverse_link',		'alpha' =>  0.5),
			'alter_bg_color_07'	=> array('color' => 'alter_bg_color',	'alpha' => 0.7),
			'alter_bg_color_04'	=> array('color' => 'alter_bg_color',	'alpha' => 0.4),
			'alter_bg_color_02'	=> array('color' => 'alter_bg_color',	'alpha' => 0.2),
			'alter_bd_color_02'	=> array('color' => 'alter_bd_color',	'alpha' => 0.2),
			'extra_bg_color_07'	=> array('color' => 'extra_bg_color',	'alpha' => 0.7),
			'text_05'		=> array('color' => 'text',		'alpha' => 0.5),
			'text_dark_01'		=> array('color' => 'text_dark',		'alpha' => 0.1),
			'text_dark_02'		=> array('color' => 'text_dark',		'alpha' => 0.2),
			'text_dark_07'		=> array('color' => 'text_dark',		'alpha' => 0.7),
			'text_link_02'		=> array('color' => 'text_link',		'alpha' => 0.2),
			'text_link_05'		=> array('color' => 'text_link',		'alpha' => 0.5),
			'extra_link2_05'		=> array('color' => 'extra_link2',		'alpha' => 0.5),
			'text_link_07'		=> array('color' => 'text_link',		'alpha' => 0.7),
			'text_link_08'		=> array('color' => 'text_link',		'alpha' => 0.8),
			'text_link_blend'	=> array('color' => 'text_link',		'hue' => 2, 'saturation' => -5, 'brightness' => 5),
			'alter_link_blend'	=> array('color' => 'alter_link',		'hue' => 2, 'saturation' => -5, 'brightness' => 5)
		));

		// Add for Gutenberg
		// Parameters to set order of schemes in the css
		drone_media_storage_set(
			'schemes_sorted', array(
				'color_scheme',
				'header_scheme',
				'menu_scheme',
				'sidebar_scheme',
				'footer_scheme',
			)
		);
		
		// -----------------------------------------------------------------
		// -- Theme specific thumb sizes
		// -----------------------------------------------------------------
		drone_media_storage_set('theme_thumbs', apply_filters('drone_media_filter_add_thumb_sizes', array(
			'drone_media-thumb-huge'		=> array(
												'size'	=> array(1170, 658, true),
												'title' => esc_html__( 'Huge image', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-huge'
												),
			'drone_media-thumb-big' 		=> array(
												'size'	=> array( 770, 470, true),
												'title' => esc_html__( 'Large image', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-big'
												),

			'drone_media-thumb-med' 		=> array(
												'size'	=> array( 370, 270, true),
												'title' => esc_html__( 'Medium image', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-medium'
												),
                'drone_media-thumb-team' 		=> array(
                    'size'	=> array( 370, 421, true),
                    'title' => esc_html__( 'Team image', 'drone-media' ),
                    'subst'	=> 'trx_addons-thumb-team'
                ),
                'drone_media-thumb-serv' 		=> array(
                    'size'	=> array( 270, 361, true),
                    'title' => esc_html__( 'Team image', 'drone-media' ),
                    'subst'	=> 'trx_addons-thumb-serv'
                ),
			'drone_media-thumb-tiny' 		=> array(
												'size'	=> array(  90,  90, true),
												'title' => esc_html__( 'Small square avatar', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-tiny'
												),

			'drone_media-thumb-masonry-big' => array(
												'size'	=> array( 760,   0, false),		// Only downscale, not crop
												'title' => esc_html__( 'Masonry Large (scaled)', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-masonry-big'
												),

			'drone_media-thumb-masonry'		=> array(
												'size'	=> array( 370,   0, false),		// Only downscale, not crop
												'title' => esc_html__( 'Masonry (scaled)', 'drone-media' ),
												'subst'	=> 'trx_addons-thumb-masonry'
												)
			))
		);
	}
}




//------------------------------------------------------------------------
// One-click import support
//------------------------------------------------------------------------

// Set theme specific importer options
if ( !function_exists( 'drone_media_importer_set_options' ) ) {
    add_filter( 'trx_addons_filter_importer_options', 'drone_media_importer_set_options', 9 );
    function drone_media_importer_set_options($options=array()) {
        if (is_array($options)) {
            // Save or not installer's messages to the log-file
            $options['debug'] = false;
            // Allow import/export functionality
            $rtl_prefix = is_rtl() ? 'rtl.' : '';
            $rtl_demo_sufix = is_rtl() ? '_rtl' : '';
            $options['allow_import'] = true;
            $options['allow_export'] = true;
            // Prepare demo data
            $options['demo_url'] = esc_url(drone_media_get_protocol() . '://demofiles.ancorathemes.com/drone-media' . $rtl_demo_sufix . '/');
            // Required plugins
            $options['required_plugins'] = array_keys(drone_media_storage_get('required_plugins'));
            // Set number of thumbnails to regenerate when its imported (if demo data was zipped without cropped images)
            // Set 0 to prevent regenerate thumbnails (if demo data archive is already contain cropped images)
            $options['regenerate_thumbnails'] = 3;
            // Default demo
            $options['files']['default']['title'] = esc_html__('Drone Media Demo', 'drone-media');
            $options['files']['default']['domain_dev'] = '';		// Developers domain
            $options['files']['default']['domain_demo']= esc_url('http://.' . $rtl_prefix . 'drone-media.ancorathemes.com');		// Demo-site domain
			// Banners
			$options['banners'] = array(
				array(
					'image' => drone_media_get_file_url('theme-specific/theme.about/images/frontpage.png'),
					'title' => esc_html__('Front page Builder', 'drone-media'),
					'content' => wp_kses_post(__('Create your Frontpage right in WordPress Customizer! To do this, you will not need either the WPBakery PageBuilder or any other Builder. Just turn on/off sections, and fill them with content and decorate to your liking', 'drone-media')),
					'link_url' => esc_url('//www.youtube.com/watch?v=VT0AUbMl_KA'),
					'link_caption' => esc_html__('More about Frontpage Builder', 'drone-media'),
					'duration' => 20
					),
				array(
					'image' => drone_media_get_file_url('theme-specific/theme.about/images/layouts.png'),
					'title' => esc_html__('Custom layouts', 'drone-media'),
					'content' => wp_kses_post(__('Forget about problems with customization of header or footer! You can edit any layout without any changes in CSS or HTML directly in Visual Builder. Moreover - you can easily create your own headers and footers and use them along with built-in', 'drone-media')),
					'link_url' => esc_url('//www.youtube.com/watch?v=pYhdFVLd7y4'),
					'link_caption' => esc_html__('More about Custom Layouts', 'drone-media'),
					'duration' => 20
					),
				array(
					'image' => drone_media_get_file_url('theme-specific/theme.about/images/documentation.png'),
					'title' => esc_html__('Read full documentation', 'drone-media'),
					'content' => wp_kses_post(__('Need more details? Please check our full online documentation for detailed information on how to use Drone Media', 'drone-media')),
					'link_url' => esc_url(drone_media_storage_get('theme_doc_url')),
					'link_caption' => esc_html__('Online documentation', 'drone-media'),
					'duration' => 15
					),
				array(
					'image' => drone_media_get_file_url('theme-specific/theme.about/images/video-tutorials.png'),
					'title' => esc_html__('Video tutorials', 'drone-media'),
					'content' => wp_kses_post(__('No time for reading documentation? Check out our video tutorials and learn how to customize Drone Media in detail.', 'drone-media')),
					'link_url' => esc_url(drone_media_storage_get('theme_video_url')),
					'link_caption' => esc_html__('Video tutorials', 'drone-media'),
					'duration' => 15
					),
				array(
					'image' => drone_media_get_file_url('theme-specific/theme.about/images/studio.png'),
					'title' => esc_html__('Website Customization', 'drone-media'),
					'content' => wp_kses_post(__('We can make a website based on this theme for a very fair price.
                        We can implement any extra functional: translate your website, WPML implementation and many other customization according to your request.', 'drone-media')),
					'link_url' => esc_url('//themerex.net/offers/?utm_source=offers&utm_medium=click&utm_campaign=themedash'),
					'link_caption' => esc_html__('Contact us', 'drone-media'),
					'duration' => 25
					)
				);
		}
		return $options;
	}
}




// -----------------------------------------------------------------
// -- Theme options for customizer
// -----------------------------------------------------------------
if (!function_exists('drone_media_create_theme_options')) {

	function drone_media_create_theme_options() {

		// Message about options override. 
		// Attention! Not need esc_html() here, because this message put in wp_kses_data() below
		$msg_override = __('<b>Attention!</b> Some of these options can be overridden in the following sections (Blog, Plugins settings, etc.) or in the settings of individual pages', 'drone-media');

		drone_media_storage_set('options', array(
		
			// 'Logo & Site Identity'
			'title_tagline' => array(
				"title" => esc_html__('Logo & Site Identity', 'drone-media'),
				"desc" => '',
				"priority" => 10,
				"type" => "section"
				),
			'logo_info' => array(
				"title" => esc_html__('Logo in the header', 'drone-media'),
				"desc" => '',
				"priority" => 20,
				"type" => "info",
				),
			'logo_text' => array(
				"title" => esc_html__('Use Site Name as Logo', 'drone-media'),
				"desc" => wp_kses_data( __('Use the site title and tagline as a text logo if no image is selected', 'drone-media') ),
				"class" => "drone_media_column-1_2 drone_media_new_row",
				"priority" => 30,
				"std" => 1,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'logo_retina_enabled' => array(
				"title" => esc_html__('Allow retina display logo', 'drone-media'),
				"desc" => wp_kses_data( __('Show fields to select logo images for Retina display', 'drone-media') ),
				"class" => "drone_media_column-1_2",
				"priority" => 40,
				"refresh" => false,
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'logo_max_height' => array(
				"title" => esc_html__('Logo max. height', 'drone-media'),
				"desc" => wp_kses_data( __("Max. height of the logo image (in pixels). Maximum size of logo depends on the actual size of the picture", 'drone-media') ),
				"std" => 70,
				"min" => 20,
				"max" => 160,
				"step" => 1,
				"refresh" => false,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "slider"
				),
			// Parameter 'logo' was replaced with standard WordPress 'custom_logo'
			'logo_retina' => array(
				"title" => esc_html__('Logo for Retina', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo used on Retina displays (if empty - use default logo from the field above)', 'drone-media') ),
				"class" => "drone_media_column-1_2",
				"priority" => 70,
				"dependency" => array(
					'logo_retina_enabled' => array(1)
				),
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "image"
				),
			'logo_mobile_header' => array(
				"title" => esc_html__('Logo for the mobile header', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo to display it in the mobile header (if enabled in the section "Header - Header mobile"', 'drone-media') ),
				"class" => "drone_media_column-1_2 drone_media_new_row",
				"std" => '',
				"type" => "image"
				),
			'logo_mobile_header_retina' => array(
				"title" => esc_html__('Logo for the mobile header for Retina', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo used on Retina displays (if empty - use default logo from the field above)', 'drone-media') ),
				"class" => "drone_media_column-1_2",
				"dependency" => array(
					'logo_retina_enabled' => array(1)
				),
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "image"
				),
			'logo_mobile' => array(
				"title" => esc_html__('Logo mobile', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo to display it in the mobile menu', 'drone-media') ),
				"class" => "drone_media_column-1_2 drone_media_new_row",
				"std" => '',
				"type" => "image"
				),
			'logo_mobile_retina' => array(
				"title" => esc_html__('Logo mobile for Retina', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo used on Retina displays (if empty - use default logo from the field above)', 'drone-media') ),
				"class" => "drone_media_column-1_2",
				"dependency" => array(
					'logo_retina_enabled' => array(1)
				),
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "image"
				),
			'logo_side' => array(
				"title" => esc_html__('Logo side', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo (with vertical orientation) to display it in the side menu', 'drone-media') ),
				"class" => "drone_media_column-1_2 drone_media_new_row",
				"std" => '',
				"type" => "image"
				),
			'logo_side_retina' => array(
				"title" => esc_html__('Logo side for Retina', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo (with vertical orientation) to display it in the side menu on Retina displays (if empty - use default logo from the field above)', 'drone-media') ),
				"class" => "drone_media_column-1_2",
				"dependency" => array(
					'logo_retina_enabled' => array(1)
				),
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "image"
				),
			
		
		
			// 'General settings'
			'general' => array(
				"title" => esc_html__('General Settings', 'drone-media'),
				"desc" => wp_kses_data( $msg_override ),
				"priority" => 20,
				"type" => "section",
				),

			'general_layout_info' => array(
				"title" => esc_html__('Layout', 'drone-media'),
				"desc" => '',
				"type" => "info",
				),
			'body_style' => array(
				"title" => esc_html__('Body style', 'drone-media'),
				"desc" => wp_kses_data( __('Select width of the body content', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Content', 'drone-media')
				),
				"refresh" => false,
				"std" => 'wide',
				"options" => drone_media_get_list_body_styles(),
				"type" => "select"
				),
			'boxed_bg_image' => array(
				"title" => esc_html__('Boxed bg image', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload image, used as background in the boxed body', 'drone-media') ),
				"dependency" => array(
					'body_style' => array('boxed')
				),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Content', 'drone-media')
				),
				"std" => '',
				"hidden" => true,
				"type" => "image"
				),
			'remove_margins' => array(
				"title" => esc_html__('Remove margins', 'drone-media'),
				"desc" => wp_kses_data( __('Remove margins above and below the content area', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Content', 'drone-media')
				),
				"refresh" => false,
				"std" => 0,
				"type" => "checkbox"
				),

			'general_sidebar_info' => array(
				"title" => esc_html__('Sidebar', 'drone-media'),
				"desc" => '',
				"type" => "info",
				),
			'sidebar_position' => array(
				"title" => esc_html__('Sidebar position', 'drone-media'),
				"desc" => wp_kses_data( __('Select position to show sidebar', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"std" => 'right',
				"options" => array(),
				"type" => "switch"
				),
			'sidebar_widgets' => array(
				"title" => esc_html__('Sidebar widgets', 'drone-media'),
				"desc" => wp_kses_data( __('Select default widgets to show in the sidebar', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"dependency" => array(
					'sidebar_position' => array('left', 'right')
				),
				"std" => 'sidebar_widgets',
				"options" => array(),
				"type" => "select"
				),
			'expand_content' => array(
				"title" => esc_html__('Expand content', 'drone-media'),
				"desc" => wp_kses_data( __('Expand the content width if the sidebar is hidden', 'drone-media') ),
				"refresh" => false,
				"std" => 1,
				"type" => "checkbox"
				),


			'general_widgets_info' => array(
				"title" => esc_html__('Additional widgets', 'drone-media'),
				"desc" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info",
				),
			'widgets_above_page' => array(
				"title" => esc_html__('Widgets at the top of the page', 'drone-media'),
				"desc" => wp_kses_data( __('Select widgets to show at the top of the page (above content and sidebar)', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"std" => 'hide',
				"options" => array(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
				),
			'widgets_above_content' => array(
				"title" => esc_html__('Widgets above the content', 'drone-media'),
				"desc" => wp_kses_data( __('Select widgets to show at the beginning of the content area', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"std" => 'hide',
				"options" => array(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
				),
			'widgets_below_content' => array(
				"title" => esc_html__('Widgets below the content', 'drone-media'),
				"desc" => wp_kses_data( __('Select widgets to show at the ending of the content area', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"std" => 'hide',
				"options" => array(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
				),
			'widgets_below_page' => array(
				"title" => esc_html__('Widgets at the bottom of the page', 'drone-media'),
				"desc" => wp_kses_data( __('Select widgets to show at the bottom of the page (below content and sidebar)', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Widgets', 'drone-media')
				),
				"std" => 'hide',
				"options" => array(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
				),

			'general_effects_info' => array(
				"title" => esc_html__('Design & Effects', 'drone-media'),
				"desc" => '',
				"type" => "info",
				),
			'border_radius' => array(
				"title" => esc_html__('Border radius', 'drone-media'),
				"desc" => wp_kses_data( __('Specify the border radius of the form fields and buttons in pixels or other valid CSS units', 'drone-media') ),
				"std" => 0,
				"type" => "text"
				),

			'general_misc_info' => array(
				"title" => esc_html__('Miscellaneous', 'drone-media'),
				"desc" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info",
				),
			'seo_snippets' => array(
				"title" => esc_html__('SEO snippets', 'drone-media'),
				"desc" => wp_kses_data( __('Add structured data markup to the single posts and pages', 'drone-media') ),
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
            'privacy_text' => array(
                "title" => esc_html__("Text with Privacy Policy link", 'drone-media'),
                "desc"  => wp_kses_data( __("Specify text with Privacy Policy link for the checkbox 'I agree ...'", 'drone-media') ),
                "std"   => wp_kses_post( __( 'I agree that my submitted data is being collected and stored.', 'drone-media') ),
                "type"  => "text"
            ),
		
		
			// 'Header'
			'header' => array(
				"title" => esc_html__('Header', 'drone-media'),
				"desc" => wp_kses_data( $msg_override ),
				"priority" => 30,
				"type" => "section"
				),

			'header_style_info' => array(
				"title" => esc_html__('Header style', 'drone-media'),
				"desc" => '',
				"type" => "info"
				),
			'header_type' => array(
				"title" => esc_html__('Header style', 'drone-media'),
				"desc" => wp_kses_data( __('Choose whether to use the default header or header Layouts (available only if the ThemeREX Addons is activated)', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => 'default',
				"options" => drone_media_get_list_header_footer_types(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
				),
			'header_style' => array(
				"title" => esc_html__('Select custom layout', 'drone-media'),
				"desc" => wp_kses_post( __("Select custom header from Layouts Builder", 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"dependency" => array(
					'header_type' => array('custom')
				),
				"std" => DRONE_MEDIA_THEME_FREE ? 'header-default' : 'header-default',
				"options" => array(),
				"type" => "select"
				),
			'header_position' => array(
				"title" => esc_html__('Header position', 'drone-media'),
				"desc" => wp_kses_data( __('Select position to display the site header', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => 'default',
				"options" => array(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
				),
			'header_fullheight' => array(
				"title" => esc_html__('Header fullheight', 'drone-media'),
				"desc" => wp_kses_data( __("Enlarge header area to fill whole screen. Used only if header have a background image", 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_zoom' => array(
				"title" => esc_html__('Header zoom', 'drone-media'),
				"desc" => wp_kses_data( __("Zoom the header title. 1 - original size", 'drone-media') ),
				"std" => 1,
				"min" => 0.3,
				"max" => 2,
				"step" => 0.1,
				"refresh" => false,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "slider"
				),
			'header_wide' => array(
				"title" => esc_html__('Header fullwide', 'drone-media'),
				"desc" => wp_kses_data( __('Do you want to stretch the header widgets area to the entire window width?', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"dependency" => array(
					'header_type' => array('default')
				),
				"std" => 1,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),

			'header_widgets_info' => array(
				"title" => esc_html__('Header widgets', 'drone-media'),
				"desc" => wp_kses_data( __('Here you can place a widget slider, advertising banners, etc.', 'drone-media') ),
				"type" => "info"
				),
			'header_widgets' => array(
				"title" => esc_html__('Header widgets', 'drone-media'),
				"desc" => wp_kses_data( __('Select set of widgets to show in the header on each page', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media'),
					"desc" => wp_kses_data( __('Select set of widgets to show in the header on this page', 'drone-media') ),
				),
				"std" => 'hide',
				"options" => array(),
				"type" => "select"
				),
			'header_columns' => array(
				"title" => esc_html__('Header columns', 'drone-media'),
				"desc" => wp_kses_data( __('Select number columns to show widgets in the Header. If 0 - autodetect by the widgets count', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"dependency" => array(
					'header_type' => array('default'),
					'header_widgets' => array('^hide')
				),
				"std" => 0,
				"options" => drone_media_get_list_range(0,6),
				"type" => "select"
				),

			'menu_info' => array(
				"title" => esc_html__('Main menu', 'drone-media'),
				"desc" => wp_kses_data( __('Select main menu style, position, color scheme and other parameters', 'drone-media') ),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info"
				),
			'menu_style' => array(
				"title" => esc_html__('Menu position', 'drone-media'),
				"desc" => wp_kses_data( __('Select position of the main menu', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => 'top',
				"options" => array(
					'top'	=> esc_html__('Top',	'drone-media'),
					'left'	=> esc_html__('Left',	'drone-media'),
					'right'	=> esc_html__('Right',	'drone-media')
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
				),
			'menu_side_stretch' => array(
				"title" => esc_html__('Stretch sidemenu', 'drone-media'),
				"desc" => wp_kses_data( __('Stretch sidemenu to window height (if menu items number >= 5)', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"dependency" => array(
					'menu_style' => array('left', 'right')
				),
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'menu_side_icons' => array(
				"title" => esc_html__('Iconed sidemenu', 'drone-media'),
				"desc" => wp_kses_data( __('Get icons from anchors and display it in the sidemenu or mark sidemenu items with simple dots', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Header', 'drone-media')
				),
				"dependency" => array(
					'menu_style' => array('left', 'right')
				),
				"std" => 1,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'menu_mobile_fullscreen' => array(
				"title" => esc_html__('Mobile menu fullscreen', 'drone-media'),
				"desc" => wp_kses_data( __('Display mobile and side menus on full screen (if checked) or slide narrow menu from the left or from the right side (if not checked)', 'drone-media') ),
				"std" => 1,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),

			'header_image_info' => array(
				"title" => esc_html__('Header image', 'drone-media'),
				"desc" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info"
				),
			'header_image_override' => array(
				"title" => esc_html__('Header image override', 'drone-media'),
				"desc" => wp_kses_data( __("Allow override the header image with the page's/post's/product's/etc. featured image", 'drone-media') ),
				"override" => array(
					'mode' => 'page',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),

			'header_mobile_info' => array(
				"title" => esc_html__('Mobile header', 'drone-media'),
				"desc" => wp_kses_data( __("Configure the mobile version of the header", 'drone-media') ),
				"priority" => 500,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info"
				),
			'header_mobile_enabled' => array(
				"title" => esc_html__('Enable the mobile header', 'drone-media'),
				"desc" => wp_kses_data( __("Use the mobile version of the header (if checked) or relayout the current header on mobile devices", 'drone-media') ),
				"std" => 0,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_mobile_additional_info' => array(
				"title" => esc_html__('Additional info', 'drone-media'),
				"desc" => wp_kses_data( __('Additional info to show at the top of the mobile header', 'drone-media') ),
				"std" => '',
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"refresh" => false,
				"teeny" => false,
				"rows" => 20,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "text_editor"
				),
			'header_mobile_hide_info' => array(
				"title" => esc_html__('Hide additional info', 'drone-media'),
				"std" => 0,
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_mobile_hide_logo' => array(
				"title" => esc_html__('Hide logo', 'drone-media'),
				"std" => 0,
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_mobile_hide_login' => array(
				"title" => esc_html__('Hide login/logout', 'drone-media'),
				"std" => 0,
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_mobile_hide_search' => array(
				"title" => esc_html__('Hide search', 'drone-media'),
				"std" => 0,
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),
			'header_mobile_hide_cart' => array(
				"title" => esc_html__('Hide cart', 'drone-media'),
				"std" => 0,
				"dependency" => array(
					'header_mobile_enabled' => array(1)
				),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
				),


		
			// 'Footer'
			'footer' => array(
				"title" => esc_html__('Footer', 'drone-media'),
				"desc" => wp_kses_data( $msg_override ),
				"priority" => 50,
				"type" => "section"
				),
			'footer_type' => array(
				"title" => esc_html__('Footer style', 'drone-media'),
				"desc" => wp_kses_data( __('Choose whether to use the default footer or footer Layouts (available only if the ThemeREX Addons is activated)', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Footer', 'drone-media')
				),
				"std" => 'default',
				"options" => drone_media_get_list_header_footer_types(),
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
				),
			'footer_style' => array(
				"title" => esc_html__('Select custom layout', 'drone-media'),
				"desc" => wp_kses_post( __("Select custom footer from Layouts Builder", 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Footer', 'drone-media')
				),
				"dependency" => array(
					'footer_type' => array('custom')
				),
				"std" => DRONE_MEDIA_THEME_FREE ? 'footer-default' : 'footer-default',
				"options" => array(),
				"type" => "select"
				),
			'footer_widgets' => array(
				"title" => esc_html__('Footer widgets', 'drone-media'),
				"desc" => wp_kses_data( __('Select set of widgets to show in the footer', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Footer', 'drone-media')
				),
				"dependency" => array(
					'footer_type' => array('default')
				),
				"std" => 'footer_widgets',
				"options" => array(),
				"type" => "select"
				),
			'footer_columns' => array(
				"title" => esc_html__('Footer columns', 'drone-media'),
				"desc" => wp_kses_data( __('Select number columns to show widgets in the footer. If 0 - autodetect by the widgets count', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Footer', 'drone-media')
				),
				"dependency" => array(
					'footer_type' => array('default'),
					'footer_widgets' => array('^hide')
				),
				"std" => 0,
				"options" => drone_media_get_list_range(0,6),
				"type" => "select"
				),
			'footer_wide' => array(
				"title" => esc_html__('Footer fullwide', 'drone-media'),
				"desc" => wp_kses_data( __('Do you want to stretch the footer to the entire window width?', 'drone-media') ),
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Footer', 'drone-media')
				),
				"dependency" => array(
					'footer_type' => array('default')
				),
				"std" => 0,
				"type" => "checkbox"
				),
			'logo_in_footer' => array(
				"title" => esc_html__('Show logo', 'drone-media'),
				"desc" => wp_kses_data( __('Show logo in the footer', 'drone-media') ),
				'refresh' => false,
				"dependency" => array(
					'footer_type' => array('default')
				),
				"std" => 0,
				"type" => "checkbox"
				),
			'logo_footer' => array(
				"title" => esc_html__('Logo for footer', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload site logo to display it in the footer', 'drone-media') ),
				"dependency" => array(
					'footer_type' => array('default'),
					'logo_in_footer' => array(1)
				),
				"std" => '',
				"type" => "image"
				),
			'logo_footer_retina' => array(
				"title" => esc_html__('Logo for footer (Retina)', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload logo for the footer area used on Retina displays (if empty - use default logo from the field above)', 'drone-media') ),
				"dependency" => array(
					'footer_type' => array('default'),
					'logo_in_footer' => array(1),
					'logo_retina_enabled' => array(1)
				),
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "image"
				),
			'socials_in_footer' => array(
				"title" => esc_html__('Show social icons', 'drone-media'),
				"desc" => wp_kses_data( __('Show social icons in the footer (under logo or footer widgets)', 'drone-media') ),
				"dependency" => array(
					'footer_type' => array('default')
				),
				"std" => 0,
				"type" => "checkbox"
				),
			'copyright' => array(
				"title" => esc_html__('Copyright', 'drone-media'),
				"desc" => wp_kses_data( __('Copyright text in the footer. Use {Y} to insert current year and press "Enter" to create a new line', 'drone-media') ),
				"std" => esc_html__('AncoraThemes &copy; {Y}. All rights reserved.', 'drone-media'),
				"dependency" => array(
					'footer_type' => array('default')
				),
				"refresh" => false,
				"type" => "textarea"
				),
			
		
		
			// 'Blog'
			'blog' => array(
				"title" => esc_html__('Blog', 'drone-media'),
				"desc" => wp_kses_data( __('Options of the the blog archive', 'drone-media') ),
				"priority" => 70,
				"type" => "panel",
				),
		
				// Blog - Posts page
				'blog_general' => array(
					"title" => esc_html__('Posts page', 'drone-media'),
					"desc" => wp_kses_data( __('Style and components of the blog archive', 'drone-media') ),
					"type" => "section",
					),
				'blog_general_info' => array(
					"title" => esc_html__('General settings', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'blog_style' => array(
					"title" => esc_html__('Blog style', 'drone-media'),
					"desc" => '',
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"std" => 'excerpt',
					"options" => array(),
					"type" => "select"
					),
				'first_post_large' => array(
					"title" => esc_html__('First post large', 'drone-media'),
					"desc" => wp_kses_data( __('Make your first post stand out by making it bigger', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
						'blog_style' => array('classic', 'masonry')
					),
					"std" => 0,
					"type" => "checkbox"
					),
				"blog_content" => array( 
					"title" => esc_html__('Posts content', 'drone-media'),
					"desc" => wp_kses_data( __("Display either post excerpts or the full post content", 'drone-media') ),
					"std" => "excerpt",
					"dependency" => array(
						'blog_style' => array('excerpt')
					),
					"options" => array(
						'excerpt'	=> esc_html__('Excerpt',	'drone-media'),
						'fullpost'	=> esc_html__('Full post',	'drone-media')
					),
					"type" => "switch"
					),
				'excerpt_length' => array(
					"title" => esc_html__('Excerpt length', 'drone-media'),
					"desc" => wp_kses_data( __("Length (in words) to generate excerpt from the post content. Attention! If the post excerpt is explicitly specified - it appears unchanged", 'drone-media') ),
					"dependency" => array(
						'blog_style' => array('excerpt'),
						'blog_content' => array('excerpt')
					),
					"std" => 60,
					"type" => "text"
					),
				'blog_columns' => array(
					"title" => esc_html__('Blog columns', 'drone-media'),
					"desc" => wp_kses_data( __('How many columns should be used in the blog archive (from 2 to 4)?', 'drone-media') ),
					"std" => 2,
					"options" => drone_media_get_list_range(2,4),
					"type" => "hidden"
					),
				'post_type' => array(
					"title" => esc_html__('Post type', 'drone-media'),
					"desc" => wp_kses_data( __('Select post type to show in the blog archive', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"linked" => 'parent_cat',
					"refresh" => false,
					"hidden" => true,
					"std" => 'post',
					"options" => array(),
					"type" => "select"
					),
				'parent_cat' => array(
					"title" => esc_html__('Category to show', 'drone-media'),
					"desc" => wp_kses_data( __('Select category to show in the blog archive', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"refresh" => false,
					"hidden" => true,
					"std" => '0',
					"options" => array(),
					"type" => "select"
					),
				'posts_per_page' => array(
					"title" => esc_html__('Posts per page', 'drone-media'),
					"desc" => wp_kses_data( __('How many posts will be displayed on this page', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"hidden" => true,
					"std" => '',
					"type" => "text"
					),
				"blog_pagination" => array( 
					"title" => esc_html__('Pagination style', 'drone-media'),
					"desc" => wp_kses_data( __('Show Older/Newest posts or Page numbers below the posts list', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"std" => "pages",
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"options" => array(
						'pages'	=> esc_html__("Page numbers", 'drone-media'),
						'links'	=> esc_html__("Older/Newest", 'drone-media'),
						'more'	=> esc_html__("Load more", 'drone-media'),
						'infinite' => esc_html__("Infinite scroll", 'drone-media')
					),
					"type" => "select"
					),
				'show_filters' => array(
					"title" => esc_html__('Show filters', 'drone-media'),
					"desc" => wp_kses_data( __('Show categories as tabs to filter posts', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
						'blog_style' => array('portfolio', 'gallery')
					),
					"hidden" => true,
					"std" => 0,
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
					),
	
				'blog_sidebar_info' => array(
					"title" => esc_html__('Sidebar', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'sidebar_position_blog' => array(
					"title" => esc_html__('Sidebar position', 'drone-media'),
					"desc" => wp_kses_data( __('Select position to show sidebar', 'drone-media') ),
					"std" => 'right',
					"options" => array(),
					"type" => "switch"
					),
				'sidebar_widgets_blog' => array(
					"title" => esc_html__('Sidebar widgets', 'drone-media'),
					"desc" => wp_kses_data( __('Select default widgets to show in the sidebar', 'drone-media') ),
					"dependency" => array(
						'sidebar_position_blog' => array('left', 'right')
					),
					"std" => 'sidebar_widgets',
					"options" => array(),
					"type" => "select"
					),
				'expand_content_blog' => array(
					"title" => esc_html__('Expand content', 'drone-media'),
					"desc" => wp_kses_data( __('Expand the content width if the sidebar is hidden', 'drone-media') ),
					"refresh" => false,
					"std" => 1,
					"type" => "checkbox"
					),
	
	
				'blog_widgets_info' => array(
					"title" => esc_html__('Additional widgets', 'drone-media'),
					"desc" => '',
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info",
					),
				'widgets_above_page_blog' => array(
					"title" => esc_html__('Widgets at the top of the page', 'drone-media'),
					"desc" => wp_kses_data( __('Select widgets to show at the top of the page (above content and sidebar)', 'drone-media') ),
					"std" => 'hide',
					"options" => array(),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				'widgets_above_content_blog' => array(
					"title" => esc_html__('Widgets above the content', 'drone-media'),
					"desc" => wp_kses_data( __('Select widgets to show at the beginning of the content area', 'drone-media') ),
					"std" => 'hide',
					"options" => array(),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				'widgets_below_content_blog' => array(
					"title" => esc_html__('Widgets below the content', 'drone-media'),
					"desc" => wp_kses_data( __('Select widgets to show at the ending of the content area', 'drone-media') ),
					"std" => 'hide',
					"options" => array(),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				'widgets_below_page_blog' => array(
					"title" => esc_html__('Widgets at the bottom of the page', 'drone-media'),
					"desc" => wp_kses_data( __('Select widgets to show at the bottom of the page (below content and sidebar)', 'drone-media') ),
					"std" => 'hide',
					"options" => array(),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),

				'blog_advanced_info' => array(
					"title" => esc_html__('Advanced settings', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'no_image' => array(
					"title" => esc_html__('Image placeholder', 'drone-media'),
					"desc" => wp_kses_data( __('Select or upload an image used as placeholder for posts without a featured image', 'drone-media') ),
					"std" => '',
					"type" => "image"
					),
				'time_diff_before' => array(
					"title" => esc_html__('Easy Readable Date Format', 'drone-media'),
					"desc" => wp_kses_data( __("For how many days to show the easy-readable date format (e.g. '3 days ago') instead of the standard publication date", 'drone-media') ),
					"std" => 0,
					"type" => "text"
					),
				'sticky_style' => array(
					"title" => esc_html__('Sticky posts style', 'drone-media'),
					"desc" => wp_kses_data( __('Select style of the sticky posts output', 'drone-media') ),
					"std" => 'inherit',
					"options" => array(
						'inherit' => esc_html__('Decorated posts', 'drone-media'),
						'columns' => esc_html__('Mini-cards',	'drone-media')
					),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				"blog_animation" => array( 
					"title" => esc_html__('Animation for the posts', 'drone-media'),
					"desc" => wp_kses_data( __('Select animation to show posts in the blog. Attention! Do not use any animation on pages with the "wheel to the anchor" behaviour (like a "Chess 2 columns")!', 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"std" => "none",
					"options" => array(),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				'meta_parts' => array(
					"title" => esc_html__('Post meta', 'drone-media'),
					"desc" => wp_kses_data( __("If your blog page is created using the 'Blog archive' page template, set up the 'Post Meta' settings in the 'Theme Options' section of that page.", 'drone-media') )
								. '<br>'
								. wp_kses_data( __("<b>Tip:</b> Drag items to change their order.", 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"dir" => 'vertical',
					"sortable" => true,
					"std" => 'categories=0|date=1|counters=0|author=0|share=0|edit=0',
					"options" => array(
						'categories' => esc_html__('Categories', 'drone-media'),
						'date'		 => esc_html__('Post date', 'drone-media'),
						'author'	 => esc_html__('Post author', 'drone-media'),
						'counters'	 => esc_html__('Views, Likes and Comments', 'drone-media'),
						'share'		 => esc_html__('Share links', 'drone-media'),
						'edit'		 => esc_html__('Edit link', 'drone-media')
					),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checklist"
				),
				'counters' => array(
					"title" => esc_html__('Views, Likes and Comments', 'drone-media'),
					"desc" => wp_kses_data( __("Likes and Views are available only if ThemeREX Addons is active", 'drone-media') ),
					"override" => array(
						'mode' => 'page',
						'section' => esc_html__('Content', 'drone-media')
					),
					"dependency" => array(
						'#page_template' => array('blog.php'),
                        '.editor-page-attributes__template select' => array( 'blog.php' ),
					),
					"dir" => 'vertical',
					"sortable" => true,
					"std" => 'views=1|likes=0|comments=1',
					"options" => array(
						'views' => esc_html__('Views', 'drone-media'),
						'likes' => esc_html__('Likes', 'drone-media'),
						'comments' => esc_html__('Comments', 'drone-media')
					),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checklist"
				),

				
				// Blog - Single posts
				'blog_single' => array(
					"title" => esc_html__('Single posts', 'drone-media'),
					"desc" => wp_kses_data( __('Settings of the single post', 'drone-media') ),
					"type" => "section",
					),
				'hide_featured_on_single' => array(
					"title" => esc_html__('Hide featured image on the single post', 'drone-media'),
					"desc" => wp_kses_data( __("Hide featured image on the single post's pages", 'drone-media') ),
					"override" => array(
						'mode' => 'page,post',
						'section' => esc_html__('Content', 'drone-media')
					),
					"std" => 0,
					"type" => "checkbox"
					),
				'hide_sidebar_on_single' => array(
					"title" => esc_html__('Hide sidebar on the single post', 'drone-media'),
					"desc" => wp_kses_data( __("Hide sidebar on the single post's pages", 'drone-media') ),
					"std" => 0,
					"type" => "checkbox"
					),
				'show_post_meta' => array(
					"title" => esc_html__('Show post meta', 'drone-media'),
					"desc" => wp_kses_data( __("Display block with post's meta: date, categories, counters, etc.", 'drone-media') ),
					"std" => 1,
					"type" => "checkbox"
					),
				'meta_parts_post' => array(
					"title" => esc_html__('Post meta', 'drone-media'),
					"desc" => wp_kses_data( __("Meta parts for single posts.", 'drone-media') ),
					"dependency" => array(
						'show_post_meta' => array(1)
					),
					"dir" => 'vertical',
					"sortable" => true,
					"std" => 'categories=1|date=1|counters=0|author=0|share=0|edit=0',
					"options" => array(
						'categories' => esc_html__('Categories', 'drone-media'),
						'date'		 => esc_html__('Post date', 'drone-media'),
						'author'	 => esc_html__('Post author', 'drone-media'),
						'counters'	 => esc_html__('Views, Likes and Comments', 'drone-media'),
						'share'		 => esc_html__('Share links', 'drone-media'),
						'edit'		 => esc_html__('Edit link', 'drone-media')
					),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checklist"
				),
				'counters_post' => array(
					"title" => esc_html__('Views, Likes and Comments', 'drone-media'),
					"desc" => wp_kses_data( __("Likes and Views are available only if ThemeREX Addons is active", 'drone-media') ),
					"dependency" => array(
						'show_post_meta' => array(1)
					),
					"dir" => 'vertical',
					"sortable" => true,
					"std" => 'views=1|likes=0|comments=1',
					"options" => array(
						'views' => esc_html__('Views', 'drone-media'),
						'likes' => esc_html__('Likes', 'drone-media'),
						'comments' => esc_html__('Comments', 'drone-media')
					),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checklist"
				),
				'show_share_links' => array(
					"title" => esc_html__('Show share links', 'drone-media'),
					"desc" => wp_kses_data( __("Display share links on the single post", 'drone-media') ),
					"std" => 1,
					"type" => "checkbox"
					),
				'show_author_info' => array(
					"title" => esc_html__('Show author info', 'drone-media'),
					"desc" => wp_kses_data( __("Display block with information about post's author", 'drone-media') ),
					"std" => 1,
					"type" => "checkbox"
					),
				'blog_single_related_info' => array(
					"title" => esc_html__('Related posts', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'show_related_posts' => array(
					"title" => esc_html__('Show related posts', 'drone-media'),
					"desc" => wp_kses_data( __("Show section 'Related posts' on the single post's pages", 'drone-media') ),
					"override" => array(
						'mode' => 'page,post',
						'section' => esc_html__('Content', 'drone-media')
					),
					"std" => 0,
					"type" => "checkbox"
					),
				'related_posts' => array(
					"title" => esc_html__('Related posts', 'drone-media'),
					"desc" => wp_kses_data( __('How many related posts should be displayed in the single post? If 0 - no related posts showed.', 'drone-media') ),
					"dependency" => array(
						'show_related_posts' => array(1)
					),
					"std" => 2,
					"options" => drone_media_get_list_range(1,9),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
					),
				'related_columns' => array(
					"title" => esc_html__('Related columns', 'drone-media'),
					"desc" => wp_kses_data( __('How many columns should be used to output related posts in the single page (from 2 to 4)?', 'drone-media') ),
					"dependency" => array(
						'show_related_posts' => array(1)
					),
					"std" => 2,
					"options" => drone_media_get_list_range(1,4),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
					),
				'related_style' => array(
					"title" => esc_html__('Related posts style', 'drone-media'),
					"desc" => wp_kses_data( __('Select style of the related posts output', 'drone-media') ),
					"dependency" => array(
						'show_related_posts' => array(1)
					),
					"std" => 2,
					"options" => drone_media_get_list_styles(1,2),
					"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
					),
			'blog_end' => array(
				"type" => "panel_end",
				),
			
		
		
			// 'Colors'
			'panel_colors' => array(
				"title" => esc_html__('Colors', 'drone-media'),
				"desc" => '',
				"priority" => 300,
				"type" => "section"
				),

			'color_schemes_info' => array(
				"title" => esc_html__('Color schemes', 'drone-media'),
				"desc" => wp_kses_data( __('Color schemes for various parts of the site. "Inherit" means that this block is used the Site color scheme (the first parameter)', 'drone-media') ),
				"type" => "info",
				),
			'color_scheme' => array(
				"title" => esc_html__('Site Color Scheme', 'drone-media'),
				"desc" => '',
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Colors', 'drone-media')
				),
				"std" => 'default',
				"options" => array(),
				"refresh" => false,
				"type" => "switch"
				),
			'header_scheme' => array(
				"title" => esc_html__('Header Color Scheme', 'drone-media'),
				"desc" => '',
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Colors', 'drone-media')
				),
				"std" => 'inherit',
				"options" => array(),
				"refresh" => false,
				"type" => "switch"
				),
			'menu_scheme' => array(
				"title" => esc_html__('Sidemenu Color Scheme', 'drone-media'),
				"desc" => '',
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Colors', 'drone-media')
				),
				"std" => 'inherit',
				"options" => array(),
				"refresh" => false,
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
				),
			'sidebar_scheme' => array(
				"title" => esc_html__('Sidebar Color Scheme', 'drone-media'),
				"desc" => '',
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Colors', 'drone-media')
				),
				"std" => 'default',
				"options" => array(),
				"refresh" => false,
				"type" => "switch"
				),
			'footer_scheme' => array(
				"title" => esc_html__('Footer Color Scheme', 'drone-media'),
				"desc" => '',
				"override" => array(
					'mode' => 'page,cpt_team,cpt_services,cpt_dishes,cpt_competitions,cpt_rounds,cpt_matches,cpt_cars,cpt_properties,cpt_courses,cpt_portfolio',
					'section' => esc_html__('Colors', 'drone-media')
				),
				"std" => 'dark',
				"options" => array(),
				"refresh" => false,
				"type" => "switch"
				),

			'color_scheme_editor_info' => array(
				"title" => esc_html__('Color scheme editor', 'drone-media'),
				"desc" => wp_kses_data(__('Select color scheme to modify. Attention! Only those sections in the site will be changed which this scheme was assigned to', 'drone-media') ),
				"type" => "info",
				),
			'scheme_storage' => array(
				"title" => esc_html__('Color scheme editor', 'drone-media'),
				"desc" => '',
				"std" => '$drone_media_get_scheme_storage',
				"refresh" => false,
				"colorpicker" => "tiny",
				"type" => "scheme_editor"
				),


			// 'Hidden'
			'media_title' => array(
				"title" => esc_html__('Media title', 'drone-media'),
				"desc" => wp_kses_data( __('Used as title for the audio and video item in this post', 'drone-media') ),
				"override" => array(
					'mode' => 'post',
					'section' => esc_html__('Content', 'drone-media')
				),
				"hidden" => true,
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "text"
				),
			'media_author' => array(
				"title" => esc_html__('Media author', 'drone-media'),
				"desc" => wp_kses_data( __('Used as author name for the audio and video item in this post', 'drone-media') ),
				"override" => array(
					'mode' => 'post',
					'section' => esc_html__('Content', 'drone-media')
				),
				"hidden" => true,
				"std" => '',
				"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "text"
				),


			// Internal options.
			// Attention! Don't change any options in the section below!
			// Use huge priority to call render this elements after all options!
			'reset_options' => array(
				"title" => '',
				"desc" => '',
				"std" => '0',
				"priority" => 10000,
				"type" => "hidden",
				),

			'last_option' => array(		// Need to manually call action to include Tiny MCE scripts
				"title" => '',
				"desc" => '',
				"std" => 1,
				"type" => "hidden",
				),

		));


		// Prepare panel 'Fonts'
		$fonts = array(
		
			// 'Fonts'
			'fonts' => array(
				"title" => esc_html__('Typography', 'drone-media'),
				"desc" => '',
				"priority" => 200,
				"type" => "panel"
				),

			// Fonts - Load_fonts
			'load_fonts' => array(
				"title" => esc_html__('Load fonts', 'drone-media'),
				"desc" => wp_kses_data( __('Specify fonts to load when theme start. You can use them in the base theme elements: headers, text, menu, links, input fields, etc.', 'drone-media') )
						. '<br>'
						. wp_kses_data( __('<b>Attention!</b> Press "Refresh" button to reload preview area after the all fonts are changed', 'drone-media') ),
				"type" => "section"
				),
			'load_fonts_subset' => array(
				"title" => esc_html__('Google fonts subsets', 'drone-media'),
				"desc" => wp_kses_data( __('Specify comma separated list of the subsets which will be load from Google fonts', 'drone-media') )
						. '<br>'
						. wp_kses_data( __('Available subsets are: latin,latin-ext,cyrillic,cyrillic-ext,greek,greek-ext,vietnamese', 'drone-media') ),
				"class" => "drone_media_column-1_3 drone_media_new_row",
				"refresh" => false,
				"std" => '$drone_media_get_load_fonts_subset',
				"type" => "text"
				)
		);

		for ($i=1; $i<=drone_media_get_theme_setting('max_load_fonts'); $i++) {
			if (drone_media_get_value_gp('page') != 'theme_options') {
				$fonts["load_fonts-{$i}-info"] = array(
					// Translators: Add font's number - 'Font 1', 'Font 2', etc
					"title" => esc_html(sprintf(__('Font %s', 'drone-media'), $i)),
					"desc" => '',
					"type" => "info",
					);
			}
			$fonts["load_fonts-{$i}-name"] = array(
				"title" => esc_html__('Font name', 'drone-media'),
				"desc" => '',
				"class" => "drone_media_column-1_3 drone_media_new_row",
				"refresh" => false,
				"std" => '$drone_media_get_load_fonts_option',
				"type" => "text"
				);
			$fonts["load_fonts-{$i}-family"] = array(
				"title" => esc_html__('Font family', 'drone-media'),
				"desc" => $i==1 
							? wp_kses_data( __('Select font family to use it if font above is not available', 'drone-media') )
							: '',
				"class" => "drone_media_column-1_3",
				"refresh" => false,
				"std" => '$drone_media_get_load_fonts_option',
				"options" => array(
					'inherit' => esc_html__("Inherit", 'drone-media'),
					'serif' => esc_html__('serif', 'drone-media'),
					'sans-serif' => esc_html__('sans-serif', 'drone-media'),
					'monospace' => esc_html__('monospace', 'drone-media'),
					'cursive' => esc_html__('cursive', 'drone-media'),
					'fantasy' => esc_html__('fantasy', 'drone-media')
				),
				"type" => "select"
				);
			$fonts["load_fonts-{$i}-styles"] = array(
				"title" => esc_html__('Font styles', 'drone-media'),
				"desc" => $i==1 
							? wp_kses_data( __('Font styles used only for the Google fonts. This is a comma separated list of the font weight and styles. For example: 400,400italic,700', 'drone-media') )
								. '<br>'
								. wp_kses_data( __('<b>Attention!</b> Each weight and style increase download size! Specify only used weights and styles.', 'drone-media') )
							: '',
				"class" => "drone_media_column-1_3",
				"refresh" => false,
				"std" => '$drone_media_get_load_fonts_option',
				"type" => "text"
				);
		}
		$fonts['load_fonts_end'] = array(
			"type" => "section_end"
			);

		// Fonts - H1..6, P, Info, Menu, etc.
		$theme_fonts = drone_media_get_theme_fonts();
		foreach ($theme_fonts as $tag=>$v) {
			$fonts["{$tag}_section"] = array(
				"title" => !empty($v['title']) 
								? $v['title'] 
								// Translators: Add tag's name to make title 'H1 settings', 'P settings', etc.
								: esc_html(sprintf(__('%s settings', 'drone-media'), $tag)),
				"desc" => !empty($v['description']) 
								? $v['description'] 
								// Translators: Add tag's name to make description
								: wp_kses_post( sprintf(__('Font settings of the "%s" tag.', 'drone-media'), $tag) ),
				"type" => "section",
				);
	
			foreach ($v as $css_prop=>$css_value) {
				if (in_array($css_prop, array('title', 'description'))) continue;
				$options = '';
				$type = 'text';
				$title = ucfirst(str_replace('-', ' ', $css_prop));
				if ($css_prop == 'font-family') {
					$type = 'select';
					$options = array();
				} else if ($css_prop == 'font-weight') {
					$type = 'select';
					$options = array(
						'inherit' => esc_html__("Inherit", 'drone-media'),
						'100' => esc_html__('100 (Light)', 'drone-media'), 
						'200' => esc_html__('200 (Light)', 'drone-media'), 
						'300' => esc_html__('300 (Thin)',  'drone-media'),
						'400' => esc_html__('400 (Normal)', 'drone-media'),
						'500' => esc_html__('500 (Semibold)', 'drone-media'),
						'600' => esc_html__('600 (Semibold)', 'drone-media'),
						'700' => esc_html__('700 (Bold)', 'drone-media'),
						'800' => esc_html__('800 (Black)', 'drone-media'),
						'900' => esc_html__('900 (Black)', 'drone-media')
					);
				} else if ($css_prop == 'font-style') {
					$type = 'select';
					$options = array(
						'inherit' => esc_html__("Inherit", 'drone-media'),
						'normal' => esc_html__('Normal', 'drone-media'), 
						'italic' => esc_html__('Italic', 'drone-media')
					);
				} else if ($css_prop == 'text-decoration') {
					$type = 'select';
					$options = array(
						'inherit' => esc_html__("Inherit", 'drone-media'),
						'none' => esc_html__('None', 'drone-media'), 
						'underline' => esc_html__('Underline', 'drone-media'),
						'overline' => esc_html__('Overline', 'drone-media'),
						'line-through' => esc_html__('Line-through', 'drone-media')
					);
				} else if ($css_prop == 'text-transform') {
					$type = 'select';
					$options = array(
						'inherit' => esc_html__("Inherit", 'drone-media'),
						'none' => esc_html__('None', 'drone-media'), 
						'uppercase' => esc_html__('Uppercase', 'drone-media'),
						'lowercase' => esc_html__('Lowercase', 'drone-media'),
						'capitalize' => esc_html__('Capitalize', 'drone-media')
					);
				}
				$fonts["{$tag}_{$css_prop}"] = array(
					"title" => $title,
					"desc" => '',
					"class" => "drone_media_column-1_5",
					"refresh" => false,
					"std" => '$drone_media_get_theme_fonts_option',
					"options" => $options,
					"type" => $type
				);
			}
			
			$fonts["{$tag}_section_end"] = array(
				"type" => "section_end"
				);
		}

		$fonts['fonts_end'] = array(
			"type" => "panel_end"
			);

		// Add fonts parameters to Theme Options
		drone_media_storage_set_array_before('options', 'panel_colors', $fonts);

		// Add Header Video if WP version < 4.7
		if (!function_exists('get_header_video_url')) {
			drone_media_storage_set_array_after('options', 'header_image_override', 'header_video', array(
				"title" => esc_html__('Header video', 'drone-media'),
				"desc" => wp_kses_data( __("Select video to use it as background for the header", 'drone-media') ),
				"override" => array(
					'mode' => 'page',
					'section' => esc_html__('Header', 'drone-media')
				),
				"std" => '',
				"type" => "video"
				)
			);
		}

		// Add option 'logo' if WP version < 4.5
		// or 'custom_logo' if current page is 'Theme Options'
		if (!function_exists('the_custom_logo') || (isset($_REQUEST['page']) && $_REQUEST['page']=='theme_options')) {
			drone_media_storage_set_array_before('options', 'logo_retina', function_exists('the_custom_logo') ? 'custom_logo' : 'logo', array(
				"title" => esc_html__('Logo', 'drone-media'),
				"desc" => wp_kses_data( __('Select or upload the site logo', 'drone-media') ),
				"class" => "drone_media_column-1_2 drone_media_new_row",
				"priority" => 60,
				"std" => '',
				"type" => "image"
				)
			);
		}
	}
}


// Returns a list of options that can be overridden for CPT
if (!function_exists('drone_media_options_get_list_cpt_options')) {
	function drone_media_options_get_list_cpt_options($cpt, $title='') {
		if (empty($title)) $title = ucfirst($cpt);
		return array(
					"header_info_{$cpt}" => array(
						"title" => esc_html__('Header', 'drone-media'),
						"desc" => '',
						"type" => "info",
						),
					"header_type_{$cpt}" => array(
						"title" => esc_html__('Header style', 'drone-media'),
						"desc" => wp_kses_data( __('Choose whether to use the default header or header Layouts (available only if the ThemeREX Addons is activated)', 'drone-media') ),
						"std" => 'inherit',
						"options" => drone_media_get_list_header_footer_types(true),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
						),
					"header_style_{$cpt}" => array(
						"title" => esc_html__('Select custom layout', 'drone-media'),
						// Translators: Add CPT name to the description
						"desc" => wp_kses_data( sprintf(__('Select custom layout to display the site header on the %s pages', 'drone-media'), $title) ),
						"dependency" => array(
							"header_type_{$cpt}" => array('custom')
						),
						"std" => 'inherit',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						),
					"header_position_{$cpt}" => array(
						"title" => esc_html__('Header position', 'drone-media'),
						// Translators: Add CPT name to the description
						"desc" => wp_kses_data( sprintf(__('Select position to display the site header on the %s pages', 'drone-media'), $title) ),
						"std" => 'inherit',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
						),
					"header_image_override_{$cpt}" => array(
						"title" => esc_html__('Header image override', 'drone-media'),
						"desc" => wp_kses_data( __("Allow override the header image with the post's featured image", 'drone-media') ),
						"std" => 0,
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "checkbox"
						),
					"header_widgets_{$cpt}" => array(
						"title" => esc_html__('Header widgets', 'drone-media'),
						// Translators: Add CPT name to the description
						"desc" => wp_kses_data( sprintf(__('Select set of widgets to show in the header on the %s pages', 'drone-media'), $title) ),
						"std" => 'hide',
						"options" => array(),
						"type" => "select"
						),
						
					"sidebar_info_{$cpt}" => array(
						"title" => esc_html__('Sidebar', 'drone-media'),
						"desc" => '',
						"type" => "info",
						),
					"sidebar_position_{$cpt}" => array(
						"title" => esc_html__('Sidebar position', 'drone-media'),
						// Translators: Add CPT name to the description
						"desc" => wp_kses_data( sprintf(__('Select position to show sidebar on the %s pages', 'drone-media'), $title) ),
						"refresh" => false,
						"std" => 'left',
						"options" => array(),
						"type" => "switch"
						),
					"sidebar_widgets_{$cpt}" => array(
						"title" => esc_html__('Sidebar widgets', 'drone-media'),
						// Translators: Add CPT name to the description
						"desc" => wp_kses_data( sprintf(__('Select sidebar to show on the %s pages', 'drone-media'), $title) ),
						"dependency" => array(
							"sidebar_position_{$cpt}" => array('left', 'right')
						),
						"std" => 'hide',
						"options" => array(),
						"type" => "select"
						),
					"hide_sidebar_on_single_{$cpt}" => array(
						"title" => esc_html__('Hide sidebar on the single pages', 'drone-media'),
						"desc" => wp_kses_data( __("Hide sidebar on the single page", 'drone-media') ),
						"std" => 0,
						"type" => "checkbox"
						),
						
					"footer_info_{$cpt}" => array(
						"title" => esc_html__('Footer', 'drone-media'),
						"desc" => '',
						"type" => "info",
						),
					"footer_type_{$cpt}" => array(
						"title" => esc_html__('Footer style', 'drone-media'),
						"desc" => wp_kses_data( __('Choose whether to use the default footer or footer Layouts (available only if the ThemeREX Addons is activated)', 'drone-media') ),
						"std" => 'inherit',
						"options" => drone_media_get_list_header_footer_types(true),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "switch"
						),
					"footer_style_{$cpt}" => array(
						"title" => esc_html__('Select custom layout', 'drone-media'),
						"desc" => wp_kses_data( __('Select custom layout to display the site footer', 'drone-media') ),
						"std" => 'inherit',
						"dependency" => array(
							"footer_type_{$cpt}" => array('custom')
						),
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						),
					"footer_widgets_{$cpt}" => array(
						"title" => esc_html__('Footer widgets', 'drone-media'),
						"desc" => wp_kses_data( __('Select set of widgets to show in the footer', 'drone-media') ),
						"dependency" => array(
							"footer_type_{$cpt}" => array('default')
						),
						"std" => 'footer_widgets',
						"options" => array(),
						"type" => "select"
						),
					"footer_columns_{$cpt}" => array(
						"title" => esc_html__('Footer columns', 'drone-media'),
						"desc" => wp_kses_data( __('Select number columns to show widgets in the footer. If 0 - autodetect by the widgets count', 'drone-media') ),
						"dependency" => array(
							"footer_type_{$cpt}" => array('default'),
							"footer_widgets_{$cpt}" => array('^hide')
						),
						"std" => 0,
						"options" => drone_media_get_list_range(0,6),
						"type" => "select"
						),
					"footer_wide_{$cpt}" => array(
						"title" => esc_html__('Footer fullwide', 'drone-media'),
						"desc" => wp_kses_data( __('Do you want to stretch the footer to the entire window width?', 'drone-media') ),
						"dependency" => array(
							"footer_type_{$cpt}" => array('default')
						),
						"std" => 0,
						"type" => "checkbox"
						),
						
					"widgets_info_{$cpt}" => array(
						"title" => esc_html__('Additional panels', 'drone-media'),
						"desc" => '',
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "info",
						),
					"widgets_above_page_{$cpt}" => array(
						"title" => esc_html__('Widgets at the top of the page', 'drone-media'),
						"desc" => wp_kses_data( __('Select widgets to show at the top of the page (above content and sidebar)', 'drone-media') ),
						"std" => 'hide',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						),
					"widgets_above_content_{$cpt}" => array(
						"title" => esc_html__('Widgets above the content', 'drone-media'),
						"desc" => wp_kses_data( __('Select widgets to show at the beginning of the content area', 'drone-media') ),
						"std" => 'hide',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						),
					"widgets_below_content_{$cpt}" => array(
						"title" => esc_html__('Widgets below the content', 'drone-media'),
						"desc" => wp_kses_data( __('Select widgets to show at the ending of the content area', 'drone-media') ),
						"std" => 'hide',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						),
					"widgets_below_page_{$cpt}" => array(
						"title" => esc_html__('Widgets at the bottom of the page', 'drone-media'),
						"desc" => wp_kses_data( __('Select widgets to show at the bottom of the page (below content and sidebar)', 'drone-media') ),
						"std" => 'hide',
						"options" => array(),
						"type" => DRONE_MEDIA_THEME_FREE ? "hidden" : "select"
						)
					);
	}
}


// Return lists with choises when its need in the admin mode
if (!function_exists('drone_media_options_get_list_choises')) {
	add_filter('drone_media_filter_options_get_list_choises', 'drone_media_options_get_list_choises', 10, 2);
	function drone_media_options_get_list_choises($list, $id) {
		if (is_array($list) && count($list)==0) {
			if (strpos($id, 'header_style')===0)
				$list = drone_media_get_list_header_styles(strpos($id, 'header_style_')===0);
			else if (strpos($id, 'header_position')===0)
				$list = drone_media_get_list_header_positions(strpos($id, 'header_position_')===0);
			else if (strpos($id, 'header_widgets')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'header_widgets_')===0, true);
			else if (substr($id, -7) == '_scheme')
				$list = drone_media_get_list_schemes($id!='color_scheme');
			else if (strpos($id, 'sidebar_widgets')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'sidebar_widgets_')===0, true);
			else if (strpos($id, 'sidebar_position')===0)
				$list = drone_media_get_list_sidebars_positions(strpos($id, 'sidebar_position_')===0);
			else if (strpos($id, 'widgets_above_page')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'widgets_above_page_')===0, true);
			else if (strpos($id, 'widgets_above_content')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'widgets_above_content_')===0, true);
			else if (strpos($id, 'widgets_below_page')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'widgets_below_page_')===0, true);
			else if (strpos($id, 'widgets_below_content')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'widgets_below_content_')===0, true);
			else if (strpos($id, 'footer_style')===0)
				$list = drone_media_get_list_footer_styles(strpos($id, 'footer_style_')===0);
			else if (strpos($id, 'footer_widgets')===0)
				$list = drone_media_get_list_sidebars(strpos($id, 'footer_widgets_')===0, true);
			else if (strpos($id, 'blog_style')===0)
				$list = drone_media_get_list_blog_styles(strpos($id, 'blog_style_')===0);
			else if (strpos($id, 'post_type')===0)
				$list = drone_media_get_list_posts_types();
			else if (strpos($id, 'parent_cat')===0)
				$list = drone_media_array_merge(array(0 => esc_html__('- Select category -', 'drone-media')), drone_media_get_list_categories());
			else if (strpos($id, 'blog_animation')===0)
				$list = drone_media_get_list_animations_in();
			else if ($id == 'color_scheme_editor')
				$list = drone_media_get_list_schemes();
			else if (strpos($id, '_font-family') > 0)
				$list = drone_media_get_list_load_fonts(true);
		}
		return $list;
	}
}
?>