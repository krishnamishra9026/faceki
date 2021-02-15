<?php
/* Woocommerce support functions
------------------------------------------------------------------------------- */

// Theme init priorities:
// 1 - register filters, that add/remove lists items for the Theme Options
if (!function_exists('drone_media_woocommerce_theme_setup1')) {
	add_action( 'after_setup_theme', 'drone_media_woocommerce_theme_setup1', 1 );
	function drone_media_woocommerce_theme_setup1() {

		add_theme_support( 'woocommerce' );

		// Next setting from the WooCommerce 3.0+ enable built-in image zoom on the single product page
		add_theme_support( 'wc-product-gallery-zoom' );

		// Next setting from the WooCommerce 3.0+ enable built-in image slider on the single product page
		add_theme_support( 'wc-product-gallery-slider' ); 

		// Next setting from the WooCommerce 3.0+ enable built-in image lightbox on the single product page
		add_theme_support( 'wc-product-gallery-lightbox' );

		add_filter( 'drone_media_filter_list_sidebars', 	'drone_media_woocommerce_list_sidebars' );
		add_filter( 'drone_media_filter_list_posts_types',	'drone_media_woocommerce_list_post_types');

		// Detect if WooCommerce support 'Product Grid' feature
		$product_grid = drone_media_exists_woocommerce() && function_exists( 'wc_get_theme_support' ) ? wc_get_theme_support( 'product_grid' ) : false;
		add_theme_support( 'wc-product-grid-enable', isset( $product_grid['min_columns'] ) && isset( $product_grid['max_columns'] ) );
	}
}

// Theme init priorities:
// 3 - add/remove Theme Options elements
if (!function_exists('drone_media_woocommerce_theme_setup3')) {
	add_action( 'after_setup_theme', 'drone_media_woocommerce_theme_setup3', 3 );
	function drone_media_woocommerce_theme_setup3() {
		if (drone_media_exists_woocommerce()) {
		
			// Section 'WooCommerce'
			drone_media_storage_set_array_before('options', 'fonts', array_merge(
				array(
					'shop' => array(
						"title" => esc_html__('Shop', 'drone-media'),
						"desc" => wp_kses_data( __('Select parameters to display the shop pages', 'drone-media') ),
						"priority" => 80,
						"type" => "section"
						),

					'products_info_shop' => array(
						"title" => esc_html__('Products list', 'drone-media'),
						"desc" => '',
						"type" => "info",
						),
					'posts_per_page_shop' => array(
						"title" => esc_html__('Products per page', 'drone-media'),
						"desc" => wp_kses_data( __('How many products should be displayed on the shop page. If empty - use global value from the menu Settings - Reading', 'drone-media') ),
						"std" => '',
						"type" => "text"
						),
					'blog_columns_shop' => array(
						"title" => esc_html__('Shop loop columns', 'drone-media'),
						"desc" => wp_kses_data( __('How many columns should be used in the shop loop (from 2 to 4)?', 'drone-media') ),
						"std" => 2,
						"options" => drone_media_get_list_range(2,4),
						"type" => "select"
						),
					'shop_mode' => array(
						"title" => esc_html__('Shop mode', 'drone-media'),
						"desc" => wp_kses_data( __('Select style for the products list', 'drone-media') ),
						"std" => 'thumbs',
						"options" => array(
							'thumbs'=> esc_html__('Thumbnails', 'drone-media'),
							'list'	=> esc_html__('List', 'drone-media'),
						),
						"type" => "select"
						),
					'shop_hover' => array(
						"title" => esc_html__('Hover style', 'drone-media'),
						"desc" => wp_kses_data( __('Hover style on the products in the shop archive', 'drone-media') ),
						"std" => 'shop',
						"options" => apply_filters('drone_media_filter_shop_hover', array(
							'none' => esc_html__('None', 'drone-media'),
							'shop' => esc_html__('Icons', 'drone-media'),
							'shop_buttons' => esc_html__('Buttons', 'drone-media')
						)),
						"type" => "select"
						),

					'single_info_shop' => array(
						"title" => esc_html__('Single product', 'drone-media'),
						"desc" => '',
						"type" => "info",
						),
					'stretch_tabs_area' => array(
						"title" => esc_html__('Stretch tabs area', 'drone-media'),
						"desc" => wp_kses_data( __('Stretch area with tabs on the single product to the screen width if the sidebar is hidden', 'drone-media') ),
						"std" => 1,
						"type" => "checkbox"
						),
					'show_related_posts_shop' => array(
						"title" => esc_html__('Show related products', 'drone-media'),
						"desc" => wp_kses_data( __("Show section 'Related products' on the single product page", 'drone-media') ),
						"std" => 1,
						"type" => "checkbox"
						),
					'related_posts_shop' => array(
						"title" => esc_html__('Related products', 'drone-media'),
						"desc" => wp_kses_data( __('How many related products should be displayed on the single product page?', 'drone-media') ),
						"dependency" => array(
							'show_related_posts_shop' => array(1)
						),
						"std" => 3,
						"options" => drone_media_get_list_range(1,9),
						"type" => "select"
						),
					'related_columns_shop' => array(
						"title" => esc_html__('Related columns', 'drone-media'),
						"desc" => wp_kses_data( __('How many columns should be used to output related products on the single product page?', 'drone-media') ),
						"dependency" => array(
							'show_related_posts_shop' => array(1)
						),
						"std" => 3,
						"options" => drone_media_get_list_range(1,4),
						"type" => "select"
						)
				),
				drone_media_options_get_list_cpt_options('shop')
			));
		}
	}
}


// Add section 'Products' to the Front Page option
if (!function_exists('drone_media_woocommerce_front_page_options')) {
	if (!DRONE_MEDIA_THEME_FREE) add_filter( 'drone_media_filter_front_page_options', 'drone_media_woocommerce_front_page_options' );
	function drone_media_woocommerce_front_page_options($options) {
		if (drone_media_exists_woocommerce()) {

			$options['front_page_sections']['std'] .= (!empty($options['front_page_sections']['std']) ? '|' : '') . 'woocommerce=1';
			$options['front_page_sections']['options'] = array_merge($options['front_page_sections']['options'], 
																	array(
																		'woocommerce' => esc_html__('Products', 'drone-media')
																		)
																	);
			$options = array_merge($options, array(
			
				// Front Page Sections - WooCommerce
				'front_page_woocommerce' => array(
					"title" => esc_html__('Products', 'drone-media'),
					"desc" => '',
					"priority" => 200,
					"type" => "section",
					),
				'front_page_woocommerce_layout_info' => array(
					"title" => esc_html__('Layout', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'front_page_woocommerce_fullheight' => array(
					"title" => esc_html__('Full height', 'drone-media'),
					"desc" => wp_kses_data( __('Stretch this section to the window height', 'drone-media') ),
					"std" => 0,
					"refresh" => false,
					"type" => "checkbox"
					),
				'front_page_woocommerce_paddings' => array(
					"title" => esc_html__('Paddings', 'drone-media'),
					"desc" => wp_kses_data( __('Select paddings inside this section', 'drone-media') ),
					"std" => 'medium',
					"options" => drone_media_get_list_paddings(),
					"refresh" => false,
					"type" => "switch"
					),
				'front_page_woocommerce_heading_info' => array(
					"title" => esc_html__('Title', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'front_page_woocommerce_caption' => array(
					"title" => esc_html__('Section title', 'drone-media'),
					"desc" => '',
					"refresh" => false,
					"std" => wp_kses_data(__('This text can be changed in the section "Products"', 'drone-media')),
					"type" => "text"
					),
				'front_page_woocommerce_description' => array(
					"title" => esc_html__('Description', 'drone-media'),
					"desc" => wp_kses_data( __("Short description after the section's title", 'drone-media') ),
					"refresh" => false,
					"std" => wp_kses_data(__('This text can be changed in the section "Products"', 'drone-media')),
					"type" => "textarea"
					),
				'front_page_woocommerce_products_info' => array(
					"title" => esc_html__('Products parameters', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'front_page_woocommerce_products' => array(
					"title" => esc_html__('Type of the products', 'drone-media'),
					"desc" => '',
					"std" => 'products',
					"options" => array(
									'recent_products' => esc_html__('Recent products', 'drone-media'),
									'featured_products' => esc_html__('Featured products', 'drone-media'),
									'top_rated_products' => esc_html__('Top rated products', 'drone-media'),
									'sale_products' => esc_html__('Sale products', 'drone-media'),
									'best_selling_products' => esc_html__('Best selling products', 'drone-media'),
									'product_category' => esc_html__('Products from categories', 'drone-media'),
									'products' => esc_html__('Products by IDs', 'drone-media')
									),
					"type" => "select"
					),
				'front_page_woocommerce_products_categories' => array(
					"title" => esc_html__('Categories', 'drone-media'),
					"desc" => esc_html__('Comma separated category slugs. Used only with "Products from categories"', 'drone-media'),
					"dependency" => array(
						'front_page_woocommerce_products' => array('product_category')
					),
					"std" => '',
					"type" => "text"
					),
				'front_page_woocommerce_products_per_page' => array(
					"title" => esc_html__('Per page', 'drone-media'),
					"desc" => wp_kses_data( __('How many products will be displayed on the page. Attention! For "Products by IDs" specify comma separated list of the IDs', 'drone-media') ),
					"std" => 3,
					"type" => "text"
					),
				'front_page_woocommerce_products_columns' => array(
					"title" => esc_html__('Columns', 'drone-media'),
					"desc" => wp_kses_data( __("How many columns will be used", 'drone-media') ),
					"std" => 3,
					"type" => "text"
					),
				'front_page_woocommerce_products_orderby' => array(
					"title" => esc_html__('Order by', 'drone-media'),
					"desc" => wp_kses_data( __("Not used with Best selling products", 'drone-media') ),
					"std" => 'date',
					"options" => array(
									'date' => esc_html__('Date', 'drone-media'),
									'title' => esc_html__('Title', 'drone-media')
									),
					"type" => "switch"
					),
				'front_page_woocommerce_products_order' => array(
					"title" => esc_html__('Order', 'drone-media'),
					"desc" => wp_kses_data( __("Not used with Best selling products", 'drone-media') ),
					"std" => 'desc',
					"options" => array(
									'asc' => esc_html__('Ascending', 'drone-media'),
									'desc' => esc_html__('Descending', 'drone-media')
									),
					"type" => "switch"
					),
				'front_page_woocommerce_color_info' => array(
					"title" => esc_html__('Colors and images', 'drone-media'),
					"desc" => '',
					"type" => "info",
					),
				'front_page_woocommerce_scheme' => array(
					"title" => esc_html__('Color scheme', 'drone-media'),
					"desc" => wp_kses_data( __('Color scheme for this section', 'drone-media') ),
					"std" => 'inherit',
					"options" => array(),
					"refresh" => false,
					"type" => "switch"
					),
				'front_page_woocommerce_bg_image' => array(
					"title" => esc_html__('Background image', 'drone-media'),
					"desc" => wp_kses_data( __('Select or upload background image for this section', 'drone-media') ),
					"refresh" => '.front_page_section_woocommerce',
					"refresh_wrapper" => true,
					"std" => '',
					"type" => "image"
					),
				'front_page_woocommerce_bg_color' => array(
					"title" => esc_html__('Background color', 'drone-media'),
					"desc" => wp_kses_data( __('Background color for this section', 'drone-media') ),
					"std" => '',
					"refresh" => false,
					"type" => "color"
					),
				'front_page_woocommerce_bg_mask' => array(
					"title" => esc_html__('Background mask', 'drone-media'),
					"desc" => wp_kses_data( __('Use Background color as section mask with specified opacity. If 0 - mask is not used', 'drone-media') ),
					"std" => 1,
					"max" => 1,
					"step" => 0.1,
					"refresh" => false,
					"type" => "slider"
					),
				'front_page_woocommerce_anchor_info' => array(
					"title" => esc_html__('Anchor', 'drone-media'),
					"desc" => wp_kses_data( __('You can select icon and/or specify a text to create anchor for this section and show it in the side menu (if selected in the section "Header - Menu".', 'drone-media'))
								. '<br>'
								. wp_kses_data(__('Attention! Anchors available only if plugin "ThemeREX Addons is installed and activated!', 'drone-media')),
					"type" => "info",
					),
				'front_page_woocommerce_anchor_icon' => array(
					"title" => esc_html__('Anchor icon', 'drone-media'),
					"desc" => '',
					"std" => '',
					"type" => "icon"
					),
				'front_page_woocommerce_anchor_text' => array(
					"title" => esc_html__('Anchor text', 'drone-media'),
					"desc" => '',
					"std" => '',
					"type" => "text"
					)
			));
		}
		return $options;
	}
}

// Theme init priorities:
// 9 - register other filters (for installer, etc.)
if (!function_exists('drone_media_woocommerce_theme_setup9')) {
	add_action( 'after_setup_theme', 'drone_media_woocommerce_theme_setup9', 9 );
	function drone_media_woocommerce_theme_setup9() {
		
		if (drone_media_exists_woocommerce()) {
			add_action( 'wp_enqueue_scripts', 								'drone_media_woocommerce_frontend_scripts', 1100 );
			add_filter( 'drone_media_filter_merge_styles',						'drone_media_woocommerce_merge_styles' );
			add_filter( 'drone_media_filter_merge_scripts',						'drone_media_woocommerce_merge_scripts');
			add_filter( 'drone_media_filter_get_post_info',		 				'drone_media_woocommerce_get_post_info');
			add_filter( 'drone_media_filter_post_type_taxonomy',				'drone_media_woocommerce_post_type_taxonomy', 10, 2 );
			add_action( 'drone_media_action_override_theme_options',			'drone_media_woocommerce_override_theme_options');
			if (!is_admin()) {
				add_filter( 'drone_media_filter_detect_blog_mode',				'drone_media_woocommerce_detect_blog_mode');
				add_filter( 'drone_media_filter_get_post_categories', 			'drone_media_woocommerce_get_post_categories');
				add_filter( 'drone_media_filter_allow_override_header_image',	'drone_media_woocommerce_allow_override_header_image');
				add_filter( 'drone_media_filter_get_blog_title',				'drone_media_woocommerce_get_blog_title');
				add_action( 'drone_media_action_before_post_meta',				'drone_media_woocommerce_action_before_post_meta');
				add_action( 'pre_get_posts',								'drone_media_woocommerce_pre_get_posts');
				add_filter( 'drone_media_filter_localize_script',				'drone_media_woocommerce_localize_script');
			}
		}
		if (is_admin()) {
			add_filter( 'drone_media_filter_tgmpa_required_plugins',			'drone_media_woocommerce_tgmpa_required_plugins' );
		}

		// Add wrappers and classes to the standard WooCommerce output
		if (drone_media_exists_woocommerce()) {

			// Remove WOOC sidebar
			remove_action( 'woocommerce_sidebar', 						'woocommerce_get_sidebar', 10 );

			// Remove link around product item
			remove_action('woocommerce_before_shop_loop_item',			'woocommerce_template_loop_product_link_open', 10);
			remove_action('woocommerce_after_shop_loop_item',			'woocommerce_template_loop_product_link_close', 5);

			// Remove link around product category
			remove_action('woocommerce_before_subcategory',				'woocommerce_template_loop_category_link_open', 10);
			remove_action('woocommerce_after_subcategory',				'woocommerce_template_loop_category_link_close', 10);
			
			// Open main content wrapper - <article>
			remove_action( 'woocommerce_before_main_content',			'woocommerce_output_content_wrapper', 10);
			add_action(    'woocommerce_before_main_content',			'drone_media_woocommerce_wrapper_start', 10);
			// Close main content wrapper - </article>
			remove_action( 'woocommerce_after_main_content',			'woocommerce_output_content_wrapper_end', 10);		
			add_action(    'woocommerce_after_main_content',			'drone_media_woocommerce_wrapper_end', 10);

			// Close header section
			add_action(    'woocommerce_before_shop_loop',				'drone_media_woocommerce_archive_description', 5 );
			add_action(    'woocommerce_no_products_found',				'drone_media_woocommerce_archive_description', 5 );

			// Add theme specific search form
			add_filter(    'get_product_search_form',					'drone_media_woocommerce_get_product_search_form' );

			// Change text on 'Add to cart' button
			add_filter(    'woocommerce_product_add_to_cart_text',		'drone_media_woocommerce_add_to_cart_text' );
			add_filter(    'woocommerce_product_single_add_to_cart_text','drone_media_woocommerce_add_to_cart_text' );

			// Add list mode buttons
			add_action(    'woocommerce_before_shop_loop', 				'drone_media_woocommerce_before_shop_loop', 10 );

			// Set columns number for the products loop
			if ( ! get_theme_support( 'wc-product-grid-enable' ) ) {
				add_filter(    'loop_shop_columns',							'drone_media_woocommerce_loop_shop_columns' );
				add_filter(    'post_class',								'drone_media_woocommerce_loop_shop_columns_class' );
				add_filter(    'product_cat_class',							'drone_media_woocommerce_loop_shop_columns_class', 10, 3 );
			}
			// Open product/category item wrapper
			add_action(    'woocommerce_before_subcategory_title',		'drone_media_woocommerce_item_wrapper_start', 9 );
			add_action(    'woocommerce_before_shop_loop_item_title',	'drone_media_woocommerce_item_wrapper_start', 9 );
			// Close featured image wrapper and open title wrapper
			add_action(    'woocommerce_before_subcategory_title',		'drone_media_woocommerce_title_wrapper_start', 20 );
			add_action(    'woocommerce_before_shop_loop_item_title',	'drone_media_woocommerce_title_wrapper_start', 20 );

			// Add tags before title
			add_action(    'woocommerce_before_shop_loop_item_title',	'drone_media_woocommerce_title_tags', 30 );

			// Wrap product title into link
			add_action(    'the_title',									'drone_media_woocommerce_the_title');

			// Close title wrapper and add description in the list mode
			add_action(    'woocommerce_after_shop_loop_item_title',	'drone_media_woocommerce_title_wrapper_end', 7);
			add_action(    'woocommerce_after_subcategory_title',		'drone_media_woocommerce_title_wrapper_end2', 10 );
			// Close product/category item wrapper
			add_action(    'woocommerce_after_subcategory',				'drone_media_woocommerce_item_wrapper_end', 20 );
			add_action(    'woocommerce_after_shop_loop_item',			'drone_media_woocommerce_item_wrapper_end', 20 );

			// Add product ID into product meta section (after categories and tags)
			add_action(    'woocommerce_product_meta_end',				'drone_media_woocommerce_show_product_id', 10);
			
			// Set columns number for the product's thumbnails
			add_filter(    'woocommerce_product_thumbnails_columns',	'drone_media_woocommerce_product_thumbnails_columns' );

			// Decorate price
			add_filter(    'woocommerce_get_price_html',				'drone_media_woocommerce_get_price_html' );

            // Wrap category title into link
            remove_action( 'woocommerce_shop_loop_subcategory_title', 'woocommerce_template_loop_category_title', 10 );
            add_action( 'woocommerce_shop_loop_subcategory_title',  'drone_media_woocommerce_shop_loop_subcategory_title', 9, 1);

			// Detect current shop mode
			if (!is_admin()) {
				$shop_mode = drone_media_get_value_gpc('drone_media_shop_mode');
				if (empty($shop_mode) && drone_media_check_theme_option('shop_mode'))
					$shop_mode = drone_media_get_theme_option('shop_mode');
				if (empty($shop_mode))
					$shop_mode = 'thumbs';
				drone_media_storage_set('shop_mode', $shop_mode);
			}
		}
	}
}

// Theme init priorities:
// Action 'wp'
// 1 - detect override mode. Attention! Only after this step you can use overriden options (separate values for the shop, courses, etc.)
if (!function_exists('drone_media_woocommerce_theme_setup_wp')) {
	add_action( 'wp', 'drone_media_woocommerce_theme_setup_wp' );
	function drone_media_woocommerce_theme_setup_wp() {
		if (drone_media_exists_woocommerce()) {
			// Set columns number for the related products
			if ((int) drone_media_get_theme_option('show_related_posts') == 0 || (int) drone_media_get_theme_option('related_posts') == 0) {
				remove_action( 'woocommerce_after_single_product_summary', 'woocommerce_output_related_products', 20 );
			} else {
				add_filter(    'woocommerce_output_related_products_args',	'drone_media_woocommerce_output_related_products_args' );
				add_filter(    'woocommerce_related_products_columns',		'drone_media_woocommerce_related_products_columns' );
			}
		}
	}
}

// Filter to add in the required plugins list
if ( !function_exists( 'drone_media_woocommerce_tgmpa_required_plugins' ) ) {
	function drone_media_woocommerce_tgmpa_required_plugins($list=array()) {
		if (drone_media_storage_isset('required_plugins', 'woocommerce')) {
			$list[] = array(
					'name' 		=> drone_media_storage_get_array('required_plugins', 'woocommerce'),
					'slug' 		=> 'woocommerce',
					'required' 	=> false
				);
		}
		return $list;
	}
}


// Check if WooCommerce installed and activated
if ( !function_exists( 'drone_media_exists_woocommerce' ) ) {
	function drone_media_exists_woocommerce() {
		return class_exists('Woocommerce');
	}
}

// Return true, if current page is any woocommerce page
if ( !function_exists( 'drone_media_is_woocommerce_page' ) ) {
	function drone_media_is_woocommerce_page() {
		$rez = false;
		if (drone_media_exists_woocommerce())
			$rez = is_woocommerce() || is_shop() || is_product() || is_product_category() || is_product_tag() || is_product_taxonomy() || is_cart() || is_checkout() || is_account_page();
		return $rez;
	}
}

// Detect current blog mode
if ( !function_exists( 'drone_media_woocommerce_detect_blog_mode' ) ) {
	function drone_media_woocommerce_detect_blog_mode($mode='') {
		if (is_shop() || is_product_category() || is_product_tag() || is_product_taxonomy())
			$mode = 'shop';
		else if (is_product() || is_cart() || is_checkout() || is_account_page())
			$mode = 'shop';
		return $mode;
	}
}

// Override options with stored page meta on 'Shop' pages
if ( !function_exists('drone_media_woocommerce_override_theme_options') ) {
	function drone_media_woocommerce_override_theme_options() {
		// Remove ' || is_product()' from the condition in the next row
		// if you don't need to override theme options from the page 'Shop' on single products
		if (is_shop() || is_product_category() || is_product_tag() || is_product_taxonomy() || is_product()) {
			if (($id = drone_media_woocommerce_get_shop_page_id()) > 0)
				drone_media_storage_set('options_meta', get_post_meta($id, 'drone_media_options', true));
		}
	}
}

// Return current page title
if ( !function_exists( 'drone_media_woocommerce_get_blog_title' ) ) {
	function drone_media_woocommerce_get_blog_title($title='') {
		if (!drone_media_exists_trx_addons() && drone_media_exists_woocommerce() && drone_media_is_woocommerce_page() && is_shop()) {
			$id = drone_media_woocommerce_get_shop_page_id();
			$title = $id ? get_the_title($id) : esc_html__('Shop', 'drone-media');
		}
		return $title;
	}
}


// Return taxonomy for current post type
if ( !function_exists( 'drone_media_woocommerce_post_type_taxonomy' ) ) {
	function drone_media_woocommerce_post_type_taxonomy($tax='', $post_type='') {
		if ($post_type == 'product')
			$tax = 'product_cat';
		return $tax;
	}
}

// Return true if page title section is allowed
if ( !function_exists( 'drone_media_woocommerce_allow_override_header_image' ) ) {
	function drone_media_woocommerce_allow_override_header_image($allow=true) {
		return is_product() ? false : $allow;
	}
}

// Return shop page ID
if ( !function_exists( 'drone_media_woocommerce_get_shop_page_id' ) ) {
	function drone_media_woocommerce_get_shop_page_id() {
		return get_option('woocommerce_shop_page_id');
	}
}

// Return shop page link
if ( !function_exists( 'drone_media_woocommerce_get_shop_page_link' ) ) {
	function drone_media_woocommerce_get_shop_page_link() {
		$url = '';
		$id = drone_media_woocommerce_get_shop_page_id();
		if ($id) $url = get_permalink($id);
		return $url;
	}
}

// Show categories of the current product
if ( !function_exists( 'drone_media_woocommerce_get_post_categories' ) ) {
	function drone_media_woocommerce_get_post_categories($cats='') {
		if (get_post_type()=='product') {
			$cats = drone_media_get_post_terms(', ', get_the_ID(), 'product_cat');
		}
		return $cats;
	}
}

// Add 'product' to the list of the supported post-types
if ( !function_exists( 'drone_media_woocommerce_list_post_types' ) ) {
	function drone_media_woocommerce_list_post_types($list=array()) {
		$list['product'] = esc_html__('Products', 'drone-media');
		return $list;
	}
}

// Show price of the current product in the widgets and search results
if ( !function_exists( 'drone_media_woocommerce_get_post_info' ) ) {
	function drone_media_woocommerce_get_post_info($post_info='') {
		if (get_post_type()=='product') {
			global $product;
			if ( $price_html = $product->get_price_html() ) {
				$post_info = '<div class="post_price product_price price">' . trim($price_html) . '</div>' . $post_info;
			}
		}
		return $post_info;
	}
}

// Show price of the current product in the search results streampage
if ( !function_exists( 'drone_media_woocommerce_action_before_post_meta' ) ) {
	function drone_media_woocommerce_action_before_post_meta() {
		if (!is_single() && get_post_type()=='product') {
			global $product;
			if ( $price_html = $product->get_price_html() ) {
				?><div class="post_price product_price price"><?php drone_media_show_layout($price_html); ?></div><?php
			}
		}
	}
}
	
// Enqueue WooCommerce custom styles
if ( !function_exists( 'drone_media_woocommerce_frontend_scripts' ) ) {
	function drone_media_woocommerce_frontend_scripts() {
			if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/woocommerce/woocommerce.css')!='')
				wp_enqueue_style( 'drone-media-woocommerce',  drone_media_get_file_url('plugins/woocommerce/woocommerce.css'), array(), null );
			if (drone_media_is_on(drone_media_get_theme_option('debug_mode')) && drone_media_get_file_dir('plugins/woocommerce/woocommerce.js')!='')
				wp_enqueue_script( 'drone-media-woocommerce', drone_media_get_file_url('plugins/woocommerce/woocommerce.js'), array('jquery'), null, true );
	}
}
	
// Merge custom styles
if ( !function_exists( 'drone_media_woocommerce_merge_styles' ) ) {
	function drone_media_woocommerce_merge_styles($list) {
		$list[] = 'plugins/woocommerce/woocommerce.css';
		return $list;
	}
}
	
// Merge custom scripts
if ( !function_exists( 'drone_media_woocommerce_merge_scripts' ) ) {
	function drone_media_woocommerce_merge_scripts($list) {
		$list[] = 'plugins/woocommerce/woocommerce.js';
		return $list;
	}
}



// Add WooCommerce specific items into lists
//------------------------------------------------------------------------

// Add sidebar
if ( !function_exists( 'drone_media_woocommerce_list_sidebars' ) ) {
	function drone_media_woocommerce_list_sidebars($list=array()) {
		$list['woocommerce_widgets'] = array(
											'name' => esc_html__('WooCommerce Widgets', 'drone-media'),
											'description' => esc_html__('Widgets to be shown on the WooCommerce pages', 'drone-media')
											);
		return $list;
	}
}




// Decorate WooCommerce output: Loop
//------------------------------------------------------------------------

// Add query vars to set products per page
if (!function_exists('drone_media_woocommerce_pre_get_posts')) {
	function drone_media_woocommerce_pre_get_posts($query) {
		if (!$query->is_main_query()) return;
		if ($query->get('post_type') == 'product') {
			$ppp = get_theme_mod('posts_per_page_shop', 0);
			if ($ppp > 0)
				$query->set('posts_per_page', $ppp);
		}
	}
}


// Before main content
if ( !function_exists( 'drone_media_woocommerce_wrapper_start' ) ) {
	function drone_media_woocommerce_wrapper_start() {
		if (is_product() || is_cart() || is_checkout() || is_account_page()) {
			?>
			<article class="post_item_single post_type_product">
			<?php
		} else {
			?>
			<div class="list_products shop_mode_<?php echo esc_attr(!drone_media_storage_empty('shop_mode') ? drone_media_storage_get('shop_mode') : 'thumbs'); ?>">
				<div class="list_products_header">
			<?php
		}
	}
}

// After main content
if ( !function_exists( 'drone_media_woocommerce_wrapper_end' ) ) {
	function drone_media_woocommerce_wrapper_end() {
		if (is_product() || is_cart() || is_checkout() || is_account_page()) {
			?>
			</article><!-- /.post_item_single -->
			<?php
		} else {
			?>
			</div><!-- /.list_products -->
			<?php
		}
	}
}

// Close header section
if ( !function_exists( 'drone_media_woocommerce_archive_description' ) ) {
	function drone_media_woocommerce_archive_description() {
		?>
		</div><!-- /.list_products_header -->
		<?php
	}
}

// Add list mode buttons
if ( !function_exists( 'drone_media_woocommerce_before_shop_loop' ) ) {
	function drone_media_woocommerce_before_shop_loop() {
		?>
		<div class="drone_media_shop_mode_buttons"><form action="<?php echo esc_url(drone_media_get_current_url()); ?>" method="post"><input type="hidden" name="drone_media_shop_mode" value="<?php echo esc_attr(drone_media_storage_get('shop_mode')); ?>" /><a href="#" class="woocommerce_thumbs icon-th" title="<?php esc_attr_e('Show products as thumbs', 'drone-media'); ?>"></a><a href="#" class="woocommerce_list icon-th-list" title="<?php esc_attr_e('Show products as list', 'drone-media'); ?>"></a></form></div><!-- /.drone_media_shop_mode_buttons -->
		<?php
	}
}

// Number of columns for the shop streampage
if ( !function_exists( 'drone_media_woocommerce_loop_shop_columns' ) ) {
	function drone_media_woocommerce_loop_shop_columns($cols) {
		return max(2, min(4, drone_media_get_theme_option('blog_columns')));
	}
}

// Add column class into product item in shop streampage
if ( !function_exists( 'drone_media_woocommerce_loop_shop_columns_class' ) ) {
	function drone_media_woocommerce_loop_shop_columns_class($classes, $class='', $cat='') {
		global $woocommerce_loop;
		if (is_product()) {
			if (!empty($woocommerce_loop['columns'])) {
				$classes[] = ' column-1_'.esc_attr($woocommerce_loop['columns']);
			}
		} else if (is_shop() || is_product_category() || is_product_tag() || is_product_taxonomy()) {
			$classes[] = ' column-1_'.esc_attr(max(2, min(4, drone_media_get_theme_option('blog_columns'))));
		}
		return $classes;
	}
}


// Open item wrapper for categories and products
if ( !function_exists( 'drone_media_woocommerce_item_wrapper_start' ) ) {
	function drone_media_woocommerce_item_wrapper_start($cat='') {
		drone_media_storage_set('in_product_item', true);
		$hover = drone_media_get_theme_option('shop_hover');
		?>
		<div class="post_item post_layout_<?php echo esc_attr(drone_media_storage_get('shop_mode')); ?>">
			<div class="post_featured hover_<?php echo esc_attr($hover); ?>">
				<?php do_action('drone_media_action_woocommerce_item_featured_start'); ?>
				<a href="<?php echo esc_url(is_object($cat) ? get_term_link($cat->slug, 'product_cat') : get_permalink()); ?>">
				<?php
	}
}

// Open item wrapper for categories and products
if ( !function_exists( 'drone_media_woocommerce_open_item_wrapper' ) ) {
	function drone_media_woocommerce_title_wrapper_start($cat='') {
				?></a><?php
				if (($hover = drone_media_get_theme_option('shop_hover')) != 'none') {
					?><div class="mask"></div><?php
					drone_media_hovers_add_icons($hover, array('cat'=>$cat));
				}
				do_action('drone_media_action_woocommerce_item_featured_end');
				?>
			</div><!-- /.post_featured -->
			<div class="post_data">
				<div class="post_data_inner">
					<div class="post_header entry-header">
					<?php
	}
}


// Display product's tags before the title
if ( !function_exists( 'drone_media_woocommerce_title_tags' ) ) {
	function drone_media_woocommerce_title_tags() {
		global $product;
	}
}

// Wrap product title into link
if ( !function_exists( 'drone_media_woocommerce_the_title' ) ) {
	function drone_media_woocommerce_the_title($title) {
		if (drone_media_storage_get('in_product_item') && get_post_type()=='product') {
			$title = '<a href="'.get_permalink().'">'.esc_html($title).'</a>';
		}
		return $title;
	}
}

// Wrap category title into link
if ( !function_exists( 'drone_media_woocommerce_shop_loop_subcategory_title' ) ) {
	function drone_media_woocommerce_shop_loop_subcategory_title($cat) {
        $cat->name = sprintf('<a href="%s">%s</a>', esc_url(get_term_link($cat->slug, 'product_cat')), $cat->name);
        ?>
        <h2 class="woocommerce-loop-category__title">
        <?php
        drone_media_show_layout( $cat->name );

        if ( $cat->count > 0 ) {
            echo apply_filters( 'woocommerce_subcategory_count_html', ' <mark class="count">(' . esc_html( $cat->count ) . ')</mark>', $cat ); // WPCS: XSS ok.
        }
        ?>
        </h2><?php
	}
}

// Add excerpt in output for the product in the list mode
if ( !function_exists( 'drone_media_woocommerce_title_wrapper_end' ) ) {
	function drone_media_woocommerce_title_wrapper_end() {
			?>
            </div><!-- /.post_header -->
		<?php
		if (drone_media_storage_get('shop_mode') == 'list' && (is_shop() || is_product_category() || is_product_tag() || is_product_taxonomy()) && !is_product()) {
		    $excerpt = apply_filters('the_excerpt', get_the_excerpt());
			?>
			<div class="post_content entry-content"><?php drone_media_show_layout($excerpt); ?></div>
			<?php
		}
	}
}

// Add excerpt in output for the product in the list mode
if ( !function_exists( 'drone_media_woocommerce_title_wrapper_end2' ) ) {
	function drone_media_woocommerce_title_wrapper_end2($category) {
			?>
			</div><!-- /.post_header -->
		<?php
		if (drone_media_storage_get('shop_mode') == 'list' && is_shop() && !is_product()) {
			?>
			<div class="post_content entry-content"><?php drone_media_show_layout($category->description); ?></div><!-- /.post_content -->
			<?php
		}
	}
}

// Close item wrapper for categories and products
if ( !function_exists( 'drone_media_woocommerce_close_item_wrapper' ) ) {
	function drone_media_woocommerce_item_wrapper_end($cat='') {
				?>
				</div><!-- /.post_data_inner -->
			</div><!-- /.post_data -->
		</div><!-- /.post_item -->
		<?php
		drone_media_storage_set('in_product_item', false);
	}
}

// Change text on 'Add to cart' button
if ( !function_exists( 'drone_media_woocommerce_add_to_cart_text' ) ) {
	function drone_media_woocommerce_add_to_cart_text($text='') {
		global $product;
		$product_type = $product->get_type();
		switch ($product_type) {
			case 'external':
				return $product->get_button_text();
				break;
			default:
				return esc_html__('Buy now', 'drone-media');
		}
	}
}

// Decorate price
if ( !function_exists( 'drone_media_woocommerce_get_price_html' ) ) {
	function drone_media_woocommerce_get_price_html($price='') {
		return $price;
	}
}



// Decorate WooCommerce output: Single product
//------------------------------------------------------------------------

// Add WooCommerce specific vars into localize array
if (!function_exists('drone_media_woocommerce_localize_script')) {
	function drone_media_woocommerce_localize_script($arr) {
		$arr['stretch_tabs_area'] = !drone_media_sidebar_present() ? drone_media_get_theme_option('stretch_tabs_area') : 0;
		return $arr;
	}
}

// Add Product ID for the single product
if ( !function_exists( 'drone_media_woocommerce_show_product_id' ) ) {
	function drone_media_woocommerce_show_product_id() {
		$authors = wp_get_post_terms(get_the_ID(), 'pa_product_author');
		if (is_array($authors) && count($authors)>0) {
			echo '<span class="product_author">'.esc_html__('Author: ', 'drone-media');
			$delim = '';
			foreach ($authors as $author) {
				echo  esc_html($delim) . '<span>' . esc_html($author->name) . '</span>';
				$delim = ', ';
			}
			echo '</span>';
		}
		echo '<span class="product_id">'.esc_html__('Product ID: ', 'drone-media') . '<span>' . get_the_ID() . '</span></span>';
	}
}

// Number columns for the product's thumbnails
if ( !function_exists( 'drone_media_woocommerce_product_thumbnails_columns' ) ) {
	function drone_media_woocommerce_product_thumbnails_columns($cols) {
		return 4;
	}
}

// Set products number for the related products
if ( !function_exists( 'drone_media_woocommerce_output_related_products_args' ) ) {
	function drone_media_woocommerce_output_related_products_args($args) {
		$args['posts_per_page'] = (int) drone_media_get_theme_option('show_related_posts') 
										? max(0, min(9, drone_media_get_theme_option('related_posts'))) 
										: 0;
		$args['columns'] = max(1, min(4, drone_media_get_theme_option('related_columns')));
		return $args;
	}
}

// Set columns number for the related products
if ( !function_exists( 'drone_media_woocommerce_related_products_columns' ) ) {
	function drone_media_woocommerce_related_products_columns($columns) {
		$columns = max(1, min(4, drone_media_get_theme_option('related_columns')));
		return $columns;
	}
}



// Decorate WooCommerce output: Widgets
//------------------------------------------------------------------------

// Search form
if ( !function_exists( 'drone_media_woocommerce_get_product_search_form' ) ) {
	function drone_media_woocommerce_get_product_search_form($form) {
		return '
		<form role="search" method="get" class="search_form" action="' . esc_url(home_url('/')) . '">
			<input type="text" class="search_field" placeholder="' . esc_attr__('Search for products &hellip;', 'drone-media') . '" value="' . get_search_query() . '" name="s" /><button class="search_button" type="submit">' . esc_html__('Search', 'drone-media') . '</button>
			<input type="hidden" name="post_type" value="product" />
		</form>
		';
	}
}


// Add plugin-specific colors and fonts to the custom CSS
if (drone_media_exists_woocommerce()) { require_once DRONE_MEDIA_THEME_DIR . 'plugins/woocommerce/woocommerce.styles.php'; }