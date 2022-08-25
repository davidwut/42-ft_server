<?php
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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         's_+u4S=<1T]w& Q)4]]_s(nCREJ-&)-j]%Y[he;KH.f97!d,&K1|d}<awQC30$^e');
define('SECURE_AUTH_KEY',  '~qApzifoAikVOezmM(#Azv[25R=Y*%DPWnmA-D?p%{DQT8-e#&oVk#iX+DR:Cx0z');
define('LOGGED_IN_KEY',    't#_|r8y@n3MpU!=[Ea:Vx3G2,?kE?g#}kw:pwiCw>E |<?dHiyfg`N-:H~/)H[QN');
define('NONCE_KEY',        ',Wep?xQoVgSx4&TB(a!nqi+GRpm[epF_E7`n 5K#Hlpj:P|+XrI$-.p-k*E39)ye');
define('AUTH_SALT',        'Uv`5n;v`n8JtV1k9fs25#-.sI6#fD-~wnk!CkXB4QpxXHC^`+nyHtpDd^Ux_p-!Z');
define('SECURE_AUTH_SALT', '+.0rDoayME29e(OA}6IBGI H1f&)&!{2MkysD_|VkFC,T+vEu!)ll*l9>U#_L|2y');
define('LOGGED_IN_SALT',   'rOG>QNIDc|?6,w8Vo|2lQa6*,g4]F3]U{4Z,B#c[6d__ib:!8m2hIme7#st^>fm=');
define('NONCE_SALT',       ':Yp=(]pt515Lw+tu$C{YaXLL`b=M>=:L-#S(pqFpO+#jXX@XOEwz1;%X{sqwi)Z6');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
