<?php
/**
 * Palmeria functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package Palmeria
 */

if (!function_exists('palmeria_setup')):
    /**
     * Sets up theme defaults and registers support for various WordPress features.
     *
     * Note that this function is hooked into the after_setup_theme hook, which
     * runs before the init hook. The init hook is too late for some features, such
     * as indicating support for post thumbnails.
     */
    function palmeria_setup()
{
        /*
         * Make theme available for translation.
         * Translations can be filed in the /languages/ directory.
         * If you're building a theme based on Palmeria, use a find and replace
         * to change 'palmeria' to the name of your theme in all the template files.
         */
        load_theme_textdomain('palmeria', get_template_directory() . '/languages');

        // Add default posts and comments RSS feed links to head.
        add_theme_support('automatic-feed-links');

        /*
         * Let WordPress manage the document title.
         * By adding theme support, we declare that this theme does not use a
         * hard-coded <title> tag in the document head, and expect WordPress to
         * provide it for us.
         */
        add_theme_support('title-tag');

        /*
         * Enable support for Post Thumbnails on posts and pages.
         *
         * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
         */
        add_theme_support('post-thumbnails');

        set_post_thumbnail_size(892);

        add_image_size('palmeria-cropped', 892, 594, true);
        add_image_size('palmeria-thumbnail-cropped', 150, 100, true);
        add_image_size('palmeria-square', 892, 892, true);
        add_image_size('palmeria-x-large', 2560);

        // This theme uses wp_nav_menu() in one location.
        register_nav_menus(array(
            'menu-1' => esc_html__('Primary', 'palmeria'),
            'menu-2' => esc_html__('Footer', 'palmeria'),
            'menu-3' => esc_html__('Footer Socials', 'palmeria'),
        ));

        /*
         * Switch default core markup for search form, comment form, and comments
         * to output valid HTML5.
         */
        add_theme_support('html5', array(
            'search-form',
            'comment-form',
            'comment-list',
            'gallery',
            'caption',
        ));

        // Set up the WordPress core custom background feature.
        add_theme_support('custom-background', apply_filters('palmeria_custom_background_args', array(
            'default-color' => 'f6f6f6',
            'default-image' => '',
        )));

        // Add theme support for selective refresh for widgets.
        add_theme_support('customize-selective-refresh-widgets');

        /**
         * Add support for core custom logo.
         *
         * @link https://codex.wordpress.org/Theme_Logo
         */
        add_theme_support('custom-logo', array(
            'height'      => 50,
            'width'       => 50,
            'flex-width'  => true,
            'flex-height' => true,
        ));

        add_post_type_support('page', 'excerpt');

        add_theme_support('align-wide');

        add_theme_support('editor-color-palette', array(
            array(
                'name'  => esc_html__('black', 'palmeria'),
                'slug'  => 'black',
                'color' => '#2c2c2c',
            ),
            array(
                'name'  => esc_html__('dark gray', 'palmeria'),
                'slug'  => 'dark-gray',
                'color' => '#3e3f46',
            ),
            array(
                'name'  => esc_html__('gray', 'palmeria'),
                'slug'  => 'gray',
                'color' => '#ddd',
            ),
            array(
                'name'  => esc_html__('light gray', 'palmeria'),
                'slug'  => 'light-gray',
                'color' => '#afb2bb',
            ),
            array(
                'name'  => esc_html__('whitesmoke', 'palmeria'),
                'slug'  => 'whitesmoke',
                'color' => '#f6f6f6',
            ),
            array(
                'name'  => esc_html__('red', 'palmeria'),
                'slug'  => 'red',
                'color' => '#b34a4a',
            ),

        ));

        add_theme_support('responsive-embeds');
        add_theme_support('editor-styles');

        /*
         * This theme styles the visual editor to resemble the theme style,
         * specifically font, colors, icons, and column width.
         */
        add_editor_style(array('css/editor-style.css', palmeria_fonts_url()));
    }
endif;
add_action('after_setup_theme', 'palmeria_setup');

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function palmeria_content_width()
{
    // This variable is intended to be overruled from themes.
    // Open WPCS issue: {@link https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/issues/1043}.
    // phpcs:ignore WordPress.NamingConventions.PrefixAllGlobals.NonPrefixedVariableFound
    $GLOBALS['content_width'] = apply_filters('palmeria_content_width', 672);
}
add_action('after_setup_theme', 'palmeria_content_width', 0);

function palmeria_adjust_content_width()
{
    global $content_width;

    if (is_page_template('template-wide-page.php') || is_page_template('template-wide-post.php') || is_page_template('template-front-page.php')) {
        $content_width = 896;
    }

}
add_action('template_redirect', 'palmeria_adjust_content_width');

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function palmeria_widgets_init()
{
    register_sidebar(array(
        'name'          => esc_html__('Sidebar', 'palmeria'),
        'id'            => 'sidebar-1',
        'description'   => esc_html__('Add widgets here.', 'palmeria'),
        'before_widget' => '<section id="%1$s" class="widget %2$s">',
        'after_widget'  => '</section>',
        'before_title'  => '<h2 class="widget-title">',
        'after_title'   => '</h2>',
    ));
    register_sidebar(array(
        'name'          => esc_html__('Front Page Sidebar', 'palmeria'),
        'id'            => 'sidebar-front-page',
        'description'   => esc_html__('Add widgets here.', 'palmeria'),
        'before_widget' => '<section id="%1$s" class="widget %2$s">',
        'after_widget'  => '</section>',
        'before_title'  => '<h2 class="widget-title hidden">',
        'after_title'   => '</h2>',
    ));
}
add_action('widgets_init', 'palmeria_widgets_init');

/**
 * Enqueue scripts and styles.
 */
function palmeria_scripts()
{

    wp_enqueue_style('palmeria-fonts', palmeria_fonts_url(), array(), null);

    wp_enqueue_style('palmeria-style', get_stylesheet_uri(), array(), palmeria_get_theme_version());

    wp_enqueue_style('font-awesome', get_template_directory_uri() . '/assets/fontawesome/css/all.css', array(), '5.11.2');

    wp_enqueue_script('palmeria-functions', get_template_directory_uri() . '/js/functions.js', array('jquery'), palmeria_get_theme_version(), true);

    wp_enqueue_script('palmeria-navigation', get_template_directory_uri() . '/js/navigation.js', array(), palmeria_get_theme_version(), true);

    //wp_enqueue_script('safari-date', get_template_directory_uri() . '/js/jquery.js', array(), palmeria_get_theme_version(), true );

    wp_enqueue_script('palmeria-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), palmeria_get_theme_version(), true);

    if (is_singular() && comments_open() && get_option('thread_comments')) {
        wp_enqueue_script('comment-reply');
    }
}
add_action('wp_enqueue_scripts', 'palmeria_scripts');

/**
 * Define globals
 */

define('PALMERIA_ACCOMMODATION_LIST_LAYOUT_1', 'classic');
define('PALMERIA_ACCOMMODATION_LIST_LAYOUT_2', 'masonry');

define('PALMERIA_BLOG_LAYOUT_1', 'classic-wide-blog');
define('PALMERIA_BLOG_LAYOUT_2', 'classic-boxed-blog');

define('PALMERIA_ACCENT_COLOR', '#b34a4a');

define('PALMERIA_HEADER_OVERLAY_COLOR', '#3e3e46');
define('PALMERIA_HEADER_OVERLAY_OPACITY', 50);

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Demo import.
 */
require get_template_directory() . '/inc/demo-import.php';

/**
 * Functions which enhance the theme by hooking into WordPress.
 */
require get_template_directory() . '/inc/template-functions.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * TGM init.
 */
require get_template_directory() . '/inc/tgmpa-init.php';

/**
 * Load Jetpack compatibility file.
 */
if (defined('JETPACK__VERSION')) {
    require get_template_directory() . '/inc/jetpack.php';
}

/**
 * Load WooCommerce compatibility file.
 */
if (class_exists('WooCommerce')) {
    require get_template_directory() . '/inc/woocommerce.php';
}

/**
 * Load MP Hotel Booking Compatibility file.
 */
if (class_exists('HotelBookingPlugin')) {
    require get_template_directory() . '/inc/mphb-functions.php';
}

function palmeria_get_theme_version()
{
    $theme_info = wp_get_theme(get_template());

    return $theme_info->get('Version');
}

if (!function_exists('palmeria_fonts_url')):
    /**
     * Register Google fonts for palmeria.
     *
     * Create your own palmeria_fonts_url() function to override in a child theme.
     *
     * @since palmeria 1.0.0
     *
     * @return string Google fonts URL for the theme.
     */
    function palmeria_fonts_url()
{
        $fonts_url     = '';
        $font_families = array();

        /**
         * Translators: If there are characters in your language that are not
         * supported by Libre Baskerville, translate this to 'off'. Do not translate
         * into your own language.
         */
        $meriweather = esc_html_x('on', 'Libre Baskerville font: on or off', 'palmeria');
        if ('off' !== $meriweather) {
            $font_families[] = 'Libre Baskerville:400,400i,700,700i';
        }
        /**
         * Translators: If there are characters in your language that are not
         * supported by Open Sans, translate this to 'off'. Do not translate
         * into your own language.
         */
        $osans = esc_html_x('on', 'Open Sans font: on or off', 'palmeria');
        if ('off' !== $osans) {
            $font_families[] = 'Open Sans:300,400,400i,700, 700i';
        }

        $query_args = array(
            'family' => urlencode(implode('|', $font_families)),
            'subset' => urlencode('latin,latin-ext,cyrillic'),
        );
        if ($font_families) {
            $fonts_url = add_query_arg($query_args, 'https://fonts.googleapis.com/css');
        }

        return esc_url_raw($fonts_url);
    }
endif;

/**
 * Filters the title of the default page template displayed in the drop-down.
 */
function palmeria_default_page_template_title()
{
    return esc_html__('Boxed', 'palmeria');
}
add_filter('default_page_template_title', 'palmeria_default_page_template_title');

/**
 * Modifies tag cloud widget arguments to have all tags in the widget same font size.
 *
 */
function palmeria_widget_tag_cloud_args($args)
{
    $args['largest']  = 0.75;
    $args['smallest'] = 0.75;
    $args['unit']     = 'rem';

    return $args;
}
add_filter('widget_tag_cloud_args', 'palmeria_widget_tag_cloud_args');

if (!function_exists('wp_body_open')) {
    function wp_body_open()
    {
        do_action('wp_body_open');
    }
}

/********For add Images to amenties******/

add_action('room_facilities_add_form_fields', 'add_term_image', 10, 2);
function add_term_image($taxonomy)
{
    ?>
    <div class="form-field term-group">
        <label for="">Upload and Image</label>
        <input type="text" name="txt_upload_image" id="txt_upload_image" value="" style="width: 77%">
        <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
    </div>
    <?php
}

add_action('created_room_facilities', 'save_term_image', 10, 2);
function save_term_image($term_id, $tt_id)
{
    if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
        $group = ($_POST['txt_upload_image']);
        add_term_meta($term_id, 'term_image', $group, true);
    }
}

add_action('room_facilities_edit_form_fields', 'edit_image_upload', 10, 2);
function edit_image_upload($term, $taxonomy)
{
    // get current group
    $txt_upload_image = get_term_meta($term->term_id, 'term_image', true);
    ?>
    <div class="form-field term-group">
        <label for="">Upload and Image</label>
        <input type="text" name="txt_upload_image" id="txt_upload_image" value="<?php echo $txt_upload_image; ?>" style="width: 77%">
        <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
    </div>
<?php
}

add_action('edited_room_facilities', 'update_image_upload', 10, 2);
function update_image_upload($term_id, $tt_id)
{
    if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
        $group = ($_POST['txt_upload_image']);
        update_term_meta($term_id, 'term_image', $group);

    }
}

//cal js

function image_uploader_enqueue()
{
    global $typenow;
    if (($typenow == 'room')) {
        wp_enqueue_media();

        wp_register_script('facilities-image', get_template_directory_uri() . '/js/media-uploader.js', array('jquery'));
        wp_localize_script('facilities-image', 'meta_image',
            array(
                'title'  => 'Upload an Image',
                'button' => 'Use this Image',
            )
        );
        wp_enqueue_script('facilities-image');
    }
}
add_action('admin_enqueue_scripts', 'image_uploader_enqueue');

//Custom post linking

function wporg_add_custom_box()
{
    $screens = ['post', 'room'];
    foreach ($screens as $screen) {
        add_meta_box(
            'related_room_id', // Unique ID
            'Hotel room to be added', // Box title
            'wporg_custom_hotel_room_box', // Content callback, must be of type callable
            $screen // Post type
        );
    }
}
add_action('add_meta_boxes', 'wporg_add_custom_box');

add_action('save_post', 'wpse_143600_save_box');

//build the box
function wporg_custom_hotel_room_box($post)
{

    wp_nonce_field(basename(__FILE__), 'wpse_143600_nonce');

    $wpse_143600_stored_meta = get_post_meta($post->ID);
//echo "<pre>";
    //print_r(($wpse_143600_stored_meta['meta-select']));
    //var_dump(unserialize($wpse_143600_stored_meta['meta-select']));
    //$chk1 = unserialize( ($wpse_143600_stored_meta['meta-select'])[0] );

    $testimonialArgs = array(
        'post_type'   => 'cpt_1039',
        'post_status' => 'publish',
        'numberposts' => -1,
    );
    $testimonials = get_posts($testimonialArgs);

    if ($testimonials): ?>
<p>
  <label for="meta-select" class="wpse_143600-row-title"><?php _e('Assign Hotel Room', 'wpse_143600_translation')?></label>
  <select name="meta-select[]" id="meta-select" multiple="multiple">
    <option value="NULL">Please select Hotel rooms</option>
<?php foreach ($testimonials as $testimonial): ?>
    <option value="<?php echo $testimonial->ID; ?>" <?php if (isset($wpse_143600_stored_meta['meta-select'])) {
        selected($wpse_143600_stored_meta['meta-select'][0], $testimonial->ID);
    }
    ?>><?php echo $testimonial->post_title; ?></option>
<?php endforeach;?>
  </select>
</p>
<?php
else:
    ?>
<p>There are no testimonials - please save this post, and write some testimonials. You'll then be able to choose a testimonial for this location.</p>
<?php
endif;
}

//save the box
function wpse_143600_save_box($post_id)
{
    $is_autosave    = wp_is_post_autosave($post_id);
    $is_revision    = wp_is_post_revision($post_id);
    $is_valid_nonce = (isset($_POST['wpse_143600_nonce']) && wp_verify_nonce($_POST['wpse_143600_nonce'], basename(__FILE__))) ? 'true' : 'false';

// Exits script depending on save status
    if ($is_autosave || $is_revision || !$is_valid_nonce) {
        return;
    }
// Checks for input and saves if needed
    if (isset($_POST['meta-select'])) {
        update_post_meta($post_id, 'meta-select', $_POST['meta-select']);
    }
}

//add hotel price in categories

add_action('room_cat_add_form_fields', 'custom_add_term_fields');

function custom_add_term_fields($taxonomy)
{

    echo '<div class="form-field">
    <label for="hotel_price">Add Hotel Price</label>
    <input type="number" name="hotel_price" id="hotel_price" />
    <p>Hotel price based on categories.</p>
    </div>';

}

add_action('room_cat_edit_form_fields', 'custom_edit_term_fields', 10, 2);

function custom_edit_term_fields($term, $taxonomy)
{

    $value = get_term_meta($term->term_id, 'hotel_price', true);

    echo '<tr class="form-field">
    <th>
        <label for="hotel_price">Add Hotel Room Price</label>
    </th>
    <td>
    <input name="hotel_price" id="hotel_price" type="number" value="' . esc_attr($value) . '" />
        <p class="description">Hotel price based on categories.</p>
    </td>
    </tr>';

}

add_action('created_room_cat', 'custom_save_term_fields');
add_action('edited_room_cat', 'custom_save_term_fields');

function custom_save_term_fields($term_id)
{

    update_term_meta(
        $term_id,
        'hotel_price',
        sanitize_text_field($_POST['hotel_price'])
    );

}

//Extra Adult  Price

add_action('room_cat_add_form_fields', 'extra_adult_add_term_field', 10, 2);

function extra_adult_add_term_field($taxonomy)
{

    echo '<div class="form-field">
    <label for="extra_adult">Extra Adult Accomodation Charge</label>
    <input type="number" name="extra_adult" id="extra_adult" />
    <p>Extra Acomodation charges of room if adults are more than 2</p>
    </div>';

}

add_action('room_cat_edit_form_fields', 'extra_adult_edit_term_field', 10, 2);

function extra_adult_edit_term_field($term, $taxonomy)
{

    $value = get_term_meta($term->term_id, 'extra_adult', true);

    echo '<tr class="form-field">
    <th>
        <label for="extra_adult">Extra Adult Accomodation Charge</label>
    </th>
    <td>
        <input name="extra_adult" id="extra_adult" type="number" value="' . esc_attr($value) . '" />
        <p class="description">Extra Acomodation charges of room if adults are more than 2</p>
    </td>
    </tr>';

}

add_action('created_room_cat', 'extra_adult_save_term_field');
add_action('edited_room_cat', 'extra_adult_save_term_field');

function extra_adult_save_term_field($term_id)
{

    update_term_meta(
        $term_id,
        'extra_adult',
        sanitize_text_field($_POST['extra_adult'])
    );

}

//Extra Child  Price

add_action('room_cat_add_form_fields', 'extra_child_add_term_field', 10, 2);

function extra_child_add_term_field($taxonomy)
{

    echo '<div class="form-field">
    <label for="extra_child">Extra Child Accomodation Charge</label>
    <input type="number" name="extra_child" id="extra_child" />
    <p>Extra Acomodation charges </p>
    </div>';

}

add_action('room_cat_edit_form_fields', 'extra_child_edit_term_field', 10, 2);

function extra_child_edit_term_field($term, $taxonomy)
{

    $value = get_term_meta($term->term_id, 'extra_child', true);

    echo '<tr class="form-field">
    <th>
        <label for="extra_child">Extra child Accomodation Charge</label>
    </th>
    <td>
        <input name="extra_child" id="extra_child" type="number" value="' . esc_attr($value) . '" />
        <p class="description">Extra Acomodation charges</p>
    </td>
    </tr>';

}

add_action('created_room_cat', 'extra_child_save_term_field');
add_action('edited_room_cat', 'extra_child_save_term_field');

function extra_child_save_term_field($term_id)
{

    update_term_meta(
        $term_id,
        'extra_child',
        sanitize_text_field($_POST['extra_child'])
    );

}

/* AJAX requests */
add_action('wp_ajax_users_details', 'users_details_callback');
add_action('wp_ajax_nopriv_users_details', 'users_details_callback');
function users_details_callback()
{
    global $wpdb;

    $request  = $_POST['request'];
    $response = array();
    // Fetch all records
    if ($request == 1) {
        $response = $wpdb->get_results("select id,username from users");
    }
    // Fetch record by id
    if ($request == 2) {
        $userid   = $_POST['userid'];
        $response = $wpdb->get_results("select name,username,email from users where id=" . $userid);
    }

    echo json_encode($response);
    wp_die();
}

add_action('wp_footer', 'redirect_cf7');

add_action('wp_ajax_get_availsafari_date', 'get_availsafari_date');
add_action('wp_ajax_nopriv_get_availsafari_date', 'get_availsafari_date');
function get_availsafari_date()
{

    $SafariDate = $_POST['safaridate'];
    $SafariDate = date('d-m-Y', strtotime($SafariDate));
    $mode       = $_POST['mode'];
    $SafariSlot = $_POST['safarislot'];
    global $wpdb;
    $get_date = $wpdb->get_results("select status from wp_safari_date where safaridate = '" . $SafariDate . "' and slot = '" . $SafariSlot . "' and safarimode = '" . $mode . "'");
    $status   = $get_date[0]->status;

    $args[] = array("status" => $status);
    echo json_encode($args);

    die;
}

function redirect_cf7()
{

    // get safari date from db

    ?>
<script type="text/javascript">

document.addEventListener( 'wpcf7submit', function( event ) {
    if(event.detail.contactFormId == '1043' || event.detail.contactFormId == '1045') {
        var shift = jQuery("#shift option:selected ").text();
        if(shift == "Evening") {

            shift = "E";
        } else {

            shift = "M";
        }

         var safarimode = jQuery("#safarimode option:selected ").text();
         if(safarimode == 'Canter') {

            safarimode = "C";

         } else {

            safarimode = "G";
         }
    jQuery.ajax({

        url : "/wp-admin/admin-ajax.php",
        type : "post",
        datatype : "json",
        data : { action : 'get_availsafari_date' , safaridate : jQuery("#jeep_date").val(), safarislot : shift , mode : safarimode },
        success : function(res) {
            var obj = JSON.parse(res);
            if( obj[0].status == "1") {

                location = '/payment';
            }


        }
    });
          }
}, false );

</script>
<?php

}

//safari form payment

add_action('wp_footer', 'cf7_safari_redirect');

//function
add_action('wp_ajax_get_safari_date', 'get_safari_date');
add_action('wp_ajax_nopriv_get_safari_date', 'get_safari_date');
function get_safari_date()
{

    $raw_date    = $_POST['safaridate'];
    $date        = date('d-m-Y', strtotime($raw_date));
    $selectmode  = $_POST['mode'];
    $safarishift = $_POST['safarislot'];

    global $wpdb;
    $get_date = $wpdb->get_results("select status from wp_safari_date where safaridate = '" . $date . "' and slot = '" . $safarishift . "' and safarimode = '" . $selectmode . "'");

    $status   = $get_date[0]->status;
    $args[] = array("status" => $status);
    echo json_encode($args);

    die;

}

//redirect and ajax check
function cf7_safari_redirect()
{

    ?>
  <script type="text/javascript">

document.addEventListener( 'wpcf7submit', function( event ) {
    if(event.detail.contactFormId == '1256') {

        var safarishift = document.querySelector('input[name="shift"]:checked').value;
        if(safarishift == "Evening") {

            safarishift = "E";
        } else {

            safarishift = "M";
        }

         var safari_mode = jQuery("#safarimode option:selected ").text();
         if(safari_mode == 'Canter') {

            safari_mode = "C";

         } else {

            safari_mode = "G";
         }
    jQuery.ajax({

        url : "/wp-admin/admin-ajax.php",
        type : "post",
        datatype : "json",
        data : { action : 'get_safari_date' , safaridate : jQuery("input[name='TravelDate']").val(), safarislot : safarishift , mode : safari_mode },
        success : function(res) {
            var obj = JSON.parse(res);
            if( obj[0].status == "1") {
                
                location = '/safari-payment/';
            }


        }
    });
          }
}, false );

</script>


    <?php
}


// define the wpcf7_after_flamingo callback
function action_wpcf7_after_flamingo($result)
{
    
    // make action magic happen here...
   global $wpdb;
    
    $getSafariDate = get_post_meta($result['flamingo_inbound_id'], '_field_jeep-safari-date', true);
    $getSafariDate = date('d-m-Y', strtotime($getSafariDate));
    $getSafari_1     = $wpdb->get_results("select status from wp_safari_date where safaridate = '" . $getSafariDate . "'");
    

    $getdate_raw = get_post_meta($result['flamingo_inbound_id'], '_field_traveldate', true);
    $getdate = date('d-m-Y', strtotime($getdate_raw));
    $getSafari_2     = $wpdb->get_results("select status from wp_safari_date where safaridate = '".$getdate."'");


    if( $getSafari_1[0]->status != "" ) {
           
      $_SESSION['flamingo_contact_id'] = $result['flamingo_inbound_id'];
    
    $get_amount = get_post_meta($result['flamingo_inbound_id'], '_field_amount', true);

    $tax_amount   = $get_amount / 100 * (get_option('GST(%)'));
    $con_fee      = $get_amount / 100 * (get_option('confee'));
    $total_amount = $get_amount + $tax_amount + $con_fee;

    $fill_con_fee     = add_post_meta($result['flamingo_inbound_id'], 'con_fee', $con_fee);
    $fill_gst         = add_post_meta($result['flamingo_inbound_id'], 'Gst_18per', $tax_amount);
    $fill_amount      = add_post_meta($result['flamingo_inbound_id'], 'amount', $total_amount);
    $fill_description = add_post_meta($result['flamingo_inbound_id'], 'description', 'Hotel / Package Booking');
}

    if( $getSafari_2[0]->status != "" ) {

    $_SESSION['flamingo_contact_id'] = $result['flamingo_inbound_id'];

    $get_amount = get_post_meta($result['flamingo_inbound_id'], '_field_amount', true);

    $tax_amount   = $get_amount / 100 * (get_option('GST(%)'));
    $con_fee      = $get_amount / 100 * (get_option('confee'));
    $total_amount = $get_amount + $tax_amount + $con_fee;

    $fill_con_fee     = add_post_meta($result['flamingo_inbound_id'], 'con_fee', $con_fee);
    $fill_gst         = add_post_meta($result['flamingo_inbound_id'], 'Gst_18per', $tax_amount);
    $fill_amount      = add_post_meta($result['flamingo_inbound_id'], 'amount', $total_amount);
    $fill_description = add_post_meta($result['flamingo_inbound_id'], 'description', ' Safari Booking');
}

        
}
    
    
// add the action
add_action('wpcf7_after_flamingo', 'action_wpcf7_after_flamingo', 10, 1);

//Add Gst Field

add_filter('admin_init', 'gst_settings_register_fields');

function gst_settings_register_fields()
{
    register_setting('general', 'GST(%)', 'esc_attr');
    add_settings_field('GST(%)', '<label for="GST(%)">' . __('GST(%)', 'GST(%)') . '</label>', 'gst_settings_fields_html', 'general');
}

function gst_settings_fields_html()
{
    $value = get_option('GST(%)', '');
    echo '<input type="number" id="GST(%)" name="GST(%)" value="' . $value . '" />';
}

//Add Conv. Fee Field

add_filter('admin_init', 'confee_settings_register_fields');

function confee_settings_register_fields()
{
    register_setting('general', 'confee', 'esc_attr');
    add_settings_field('confee', '<label for="confee">' . __('Convenience Fee(%)', 'confee') . '</label>', 'confee_settings_fields_html', 'general');
}

function confee_settings_fields_html()
{
    $value = get_option('confee', '');
    echo '<input type="number" id="confee" name="confee" value="' . $value . '" />';
}

//Add CanterSafari Price field

add_filter('admin_init', 'canter_settings_register_fields');

function canter_settings_register_fields()
{
    register_setting('general', 'canter_price', 'esc_attr');
    add_settings_field('canter_price', '<label for="canter_price">' . __('Canter Safari Price(p/h)') . '</label>', 'canter_settings_fields_html', 'general');
}

function canter_settings_fields_html()
{
    $value = get_option('canter_price', '');
    echo '<input type="number" id="canter_price" name="canter_price" value="' . $value . '" />';
}

//Add GypsySafari price field

add_filter('admin_init', 'gypsy_settings_register_fields');

function gypsy_settings_register_fields()
{
    register_setting('general', 'gypsy_price', 'esc_attr');
    add_settings_field('gypsy_price', '<label for="gypsy_price">' . __('Gypsy Safari Price', 'gypsy_price') . '</label>', 'gypsy_settings_fields_html', 'general');
}

function gypsy_settings_fields_html()
{
    $value = get_option('gypsy_price', '');
    echo '<input type="number" id="gypsy_price" name="gypsy_price" value="' . $value . '" />';
}


//Mail function
add_action('wp_ajax_sendMail', 'sendMail');
add_action('wp_ajax_nopriv_sendMail', 'sendMail');

function sendMail() {

$to = get_option('admin_email',true);

$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
$headers .= 'From: Jimcorbett.in <info@jimcorbett.in>' . "\r\n";

$subject = 'New Customer Jimcorbett Booking Processing...'.$_POST['name'];
$message = 'Name : '. $_POST['name']."<br>";
$message .= 'Phone : '. $_POST['phnum']."<br>";
wp_mail($to, $subject, $message, $headers);
echo "Success";
die;
}