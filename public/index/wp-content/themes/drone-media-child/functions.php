<?php
/**
 * Child-Theme functions and definitions
 */

add_action( 'wp_enqueue_scripts', 'drone_media_child_scripts' );
function drone_media_child_scripts() {
    wp_enqueue_style( 'drone-media-parent-style', get_template_directory_uri(). '/style.css' );
}