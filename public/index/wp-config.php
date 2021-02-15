<?php
define('WP_AUTO_UPDATE_CORE', 'minor');// This setting is required to make sure that WordPress updates can be properly managed in WordPress Toolkit. Remove this line if this WordPress website is not managed by WordPress Toolkit anymore.
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_volkh' );

/** MySQL database username */
define( 'DB_USER', 'wp_ms6v5' );

/** MySQL database password */
define( 'DB_PASSWORD', 'O3BY9?ps@2JW&9Ct' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY', 'jUV25*V[R#098KpzH56hJnlE638:f_e91vfaelF5l%61i766k9Qe0K~L9JqWM:8%');
define('SECURE_AUTH_KEY', '#Q4Y!9Ak5r6opL@8BKJeUcVD#I0~*d[)&ys[-Fcv3alr:qSJ*O6&hkD-]+_po9hE');
define('LOGGED_IN_KEY', 'i*oT6t|4frCo0X47_l5xtX05%06Xm3[d9*U06GbBRoZg2O~6;x4Yi/g@rAG/Wql]');
define('NONCE_KEY', '9Kc7LdJo0y)IRR4N6r692Yt2tKMt8SbCA405xCI4#r70q9;h8p4Llu&J08*89N3R');
define('AUTH_SALT', 'u26v9_gT9QyCHS9V;;tYB3N*-B|9#SNt9m22X8bB7v0258ik;kf5V8/@n(7W5%U4');
define('SECURE_AUTH_SALT', '3:C2Ay8~z)l177Y5h3:w593BYX/D;G3QV;]6&(H%iF*3WagOOB2r8VgyioIa4+J5');
define('LOGGED_IN_SALT', 'hn8;KA1b5P7Tz*UgMG4V&_w&_c)C~2oZtQ0t%&!@9qtFhR]UxF4&5Ln4J%wo-*wv');
define('NONCE_SALT', 'li50LcI[L--]50ff%@a+#(w#2o;BJHXu9FFpi%9(*3@fc025Z3I4+3]+JG6:-(0O');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'QCZD9j_';


define('WP_ALLOW_MULTISITE', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
