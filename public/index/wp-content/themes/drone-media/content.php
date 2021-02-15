<?php
/**
 * The default template to display the content of the single post, page or attachment
 *
 * Used for index/archive/search.
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

$drone_media_seo = drone_media_is_on(drone_media_get_theme_option('seo_snippets'));
?>

<article id="post-<?php the_ID(); ?>" <?php post_class( 'post_item_single post_type_'.esc_attr(get_post_type()) 
												. ' post_format_'.esc_attr(str_replace('post-format-', '', get_post_format())) 
												);
		if ($drone_media_seo) {
			?> itemscope="itemscope" 
			   itemprop="articleBody" 
			   itemtype="//schema.org/<?php echo esc_attr(drone_media_get_markup_schema()); ?>"
			   itemid="<?php echo esc_url(get_the_permalink()); ?>"
			   content="<?php the_title_attribute(); ?>"<?php
		}
?>><?php

	do_action('drone_media_action_before_post_data'); 

	// Structured data snippets
	if ($drone_media_seo)
		get_template_part('templates/seo');

	// Featured image
	if ( drone_media_is_off(drone_media_get_theme_option('hide_featured_on_single'))
			&& !drone_media_sc_layouts_showed('featured') 
			&& strpos(get_the_content(), '[trx_widget_banner]')===false) {
		do_action('drone_media_action_before_post_featured'); 
		drone_media_show_post_featured();
		do_action('drone_media_action_after_post_featured'); 
	} else if (has_post_thumbnail()) {
		?><meta itemprop="image" itemtype="//schema.org/ImageObject" content="<?php echo esc_url(wp_get_attachment_url(get_post_thumbnail_id())); ?>"><?php
	}

	// Title and post meta
	if ( (!drone_media_sc_layouts_showed('title') || !drone_media_sc_layouts_showed('postmeta')) && !in_array(get_post_format(), array('link', 'aside', 'status', 'quote')) ) {
		do_action('drone_media_action_before_post_title'); 
		?>
		<div class="post_header entry-header">
			<?php
			// Post title
			if (!drone_media_sc_layouts_showed('title')) {
				the_title( '<h3 class="post_title entry-title"'.($drone_media_seo ? ' itemprop="headline"' : '').'>', '</h3>' );
			}
			// Post meta
			if (!drone_media_sc_layouts_showed('postmeta') && drone_media_is_on(drone_media_get_theme_option('show_post_meta'))) {
				drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
					'components' => drone_media_array_get_keys_by_value(drone_media_get_theme_option('meta_parts')),
					'counters' => drone_media_array_get_keys_by_value(drone_media_get_theme_option('counters')),
					'seo' => drone_media_is_on(drone_media_get_theme_option('seo_snippets'))
					), 'single', 1)
				);
			}
			?>
		</div><!-- .post_header -->
		<?php
		do_action('drone_media_action_after_post_title'); 
	}

	do_action('drone_media_action_before_post_content'); 

	// Post content
	?>
	<div class="post_content entry-content" itemprop="mainEntityOfPage">
		<?php
        if( !drone_media_exists_trx_addons()){
            $args = array();

            $args = array_merge(array(
                'components' => 'categories,date,author,counters,share,edit',
                'counters' => 'comments',    //comments,views,likes
                'seo' => false,
                'echo' => true
            ), $args);

            if (!$args['echo']) ob_start();

            $components = explode(',', $args['components']);
            foreach ($components as $comp) {
                $comp = trim($comp);
                // Post categories
                if ($comp == 'categories') {
                    $cats = get_post_type() == 'post' ? get_the_category_list(' ') : apply_filters('drone_media_filter_get_post_categories', '');
                    if (!empty($cats)) {
                        ?>
                        <span class="post_meta_item post_categories"><?php drone_media_show_layout($cats); ?></span>
                        <?php
                    }

                }
            }
        }
		the_content( );

		do_action('drone_media_action_before_post_pagination'); 

		wp_link_pages( array(
			'before'      => '<div class="page_links"><span class="page_links_title">' . esc_html__( 'Pages:', 'drone-media' ) . '</span>',
			'after'       => '</div>',
			'link_before' => '<span>',
			'link_after'  => '</span>',
			'pagelink'    => '<span class="screen-reader-text">' . esc_html__( 'Page', 'drone-media' ) . ' </span>%',
			'separator'   => '<span class="screen-reader-text">, </span>',
		) );

		// Taxonomies and share
		if ( is_single() && !is_attachment() ) {
			
			do_action('drone_media_action_before_post_meta'); 

			?><div class="post_meta post_meta_single"><?php
				
				// Post taxonomies
				the_tags( '<span class="post_meta_item post_tags"><span class="post_meta_label">'.esc_html__('Tags:', 'drone-media').'</span> ', ', ', '</span>' );

				
			?></div><?php

            if (drone_media_exists_trx_addons()) {
                ?>
                <div class="ex-bot"><?php
                // Share
                if (drone_media_is_on(drone_media_get_theme_option('show_share_links'))) {
                    drone_media_show_share_links(array(
                        'type' => 'block',
                        'caption' => '',
                        'before' => '<span class="post_meta_item post_share">',
                        'after' => '</span>'
                    ));
                }

                drone_media_show_post_meta(apply_filters('drone_media_filter_post_meta_args', array(
                        'components' => 'counters',
                        'counters' => 'views,comments',
                        'seo' => false
                    ), 'excerpt', 1)
                );
                ?></div><?php

            }

			do_action('drone_media_action_after_post_meta'); 
		}
		?>
	</div><!-- .entry-content -->
	

	<?php
	do_action('drone_media_action_after_post_content'); 

	// Author bio.
	if ( drone_media_get_theme_option('show_author_info')==1 && is_single() && !is_attachment() && get_the_author_meta( 'description' ) ) {
		do_action('drone_media_action_before_post_author'); 
		get_template_part( 'templates/author-bio' );
		do_action('drone_media_action_after_post_author'); 
	}

	do_action('drone_media_action_after_post_data'); 
	?>
</article>
