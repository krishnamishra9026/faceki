<?php
/**
 * Theme storage manipulations
 *
 * @package WordPress
 * @subpackage DRONE_MEDIA
 * @since DRONE_MEDIA 1.0
 */

// Disable direct call
if ( ! defined( 'ABSPATH' ) ) { exit; }

// Get theme variable
if (!function_exists('drone_media_storage_get')) {
	function drone_media_storage_get($var_name, $default='') {
		global $DRONE_MEDIA_STORAGE;
		return isset($DRONE_MEDIA_STORAGE[$var_name]) ? $DRONE_MEDIA_STORAGE[$var_name] : $default;
	}
}

// Set theme variable
if (!function_exists('drone_media_storage_set')) {
	function drone_media_storage_set($var_name, $value) {
		global $DRONE_MEDIA_STORAGE;
		$DRONE_MEDIA_STORAGE[$var_name] = $value;
	}
}

// Check if theme variable is empty
if (!function_exists('drone_media_storage_empty')) {
	function drone_media_storage_empty($var_name, $key='', $key2='') {
		global $DRONE_MEDIA_STORAGE;
		if (!empty($key) && !empty($key2))
			return empty($DRONE_MEDIA_STORAGE[$var_name][$key][$key2]);
		else if (!empty($key))
			return empty($DRONE_MEDIA_STORAGE[$var_name][$key]);
		else
			return empty($DRONE_MEDIA_STORAGE[$var_name]);
	}
}

// Check if theme variable is set
if (!function_exists('drone_media_storage_isset')) {
	function drone_media_storage_isset($var_name, $key='', $key2='') {
		global $DRONE_MEDIA_STORAGE;
		if (!empty($key) && !empty($key2))
			return isset($DRONE_MEDIA_STORAGE[$var_name][$key][$key2]);
		else if (!empty($key))
			return isset($DRONE_MEDIA_STORAGE[$var_name][$key]);
		else
			return isset($DRONE_MEDIA_STORAGE[$var_name]);
	}
}

// Inc/Dec theme variable with specified value
if (!function_exists('drone_media_storage_inc')) {
	function drone_media_storage_inc($var_name, $value=1) {
		global $DRONE_MEDIA_STORAGE;
		if (empty($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = 0;
		$DRONE_MEDIA_STORAGE[$var_name] += $value;
	}
}

// Concatenate theme variable with specified value
if (!function_exists('drone_media_storage_concat')) {
	function drone_media_storage_concat($var_name, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (empty($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = '';
		$DRONE_MEDIA_STORAGE[$var_name] .= $value;
	}
}

// Get array (one or two dim) element
if (!function_exists('drone_media_storage_get_array')) {
	function drone_media_storage_get_array($var_name, $key, $key2='', $default='') {
		global $DRONE_MEDIA_STORAGE;
		if (empty($key2))
			return !empty($var_name) && !empty($key) && isset($DRONE_MEDIA_STORAGE[$var_name][$key]) ? $DRONE_MEDIA_STORAGE[$var_name][$key] : $default;
		else
			return !empty($var_name) && !empty($key) && isset($DRONE_MEDIA_STORAGE[$var_name][$key][$key2]) ? $DRONE_MEDIA_STORAGE[$var_name][$key][$key2] : $default;
	}
}

// Set array element
if (!function_exists('drone_media_storage_set_array')) {
	function drone_media_storage_set_array($var_name, $key, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if ($key==='')
			$DRONE_MEDIA_STORAGE[$var_name][] = $value;
		else
			$DRONE_MEDIA_STORAGE[$var_name][$key] = $value;
		return true;
	}
}

// Set two-dim array element
if (!function_exists('drone_media_storage_set_array2')) {
	function drone_media_storage_set_array2($var_name, $key, $key2, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if (!isset($DRONE_MEDIA_STORAGE[$var_name][$key])) $DRONE_MEDIA_STORAGE[$var_name][$key] = array();
		if ($key2==='')
			$DRONE_MEDIA_STORAGE[$var_name][$key][] = $value;
		else
			$DRONE_MEDIA_STORAGE[$var_name][$key][$key2] = $value;
	}
}

// Merge array elements
if (!function_exists('drone_media_storage_merge_array')) {
	function drone_media_storage_merge_array($var_name, $key, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if ($key==='')
			$DRONE_MEDIA_STORAGE[$var_name] = array_merge($DRONE_MEDIA_STORAGE[$var_name], $value);
		else
			$DRONE_MEDIA_STORAGE[$var_name][$key] = array_merge($DRONE_MEDIA_STORAGE[$var_name][$key], $value);
	}
}

// Add array element after the key
if (!function_exists('drone_media_storage_set_array_after')) {
	function drone_media_storage_set_array_after($var_name, $after, $key, $value='') {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if (is_array($key))
			drone_media_array_insert_after($DRONE_MEDIA_STORAGE[$var_name], $after, $key);
		else
			drone_media_array_insert_after($DRONE_MEDIA_STORAGE[$var_name], $after, array($key=>$value));
	}
}

// Add array element before the key
if (!function_exists('drone_media_storage_set_array_before')) {
	function drone_media_storage_set_array_before($var_name, $before, $key, $value='') {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if (is_array($key))
			drone_media_array_insert_before($DRONE_MEDIA_STORAGE[$var_name], $before, $key);
		else
			drone_media_array_insert_before($DRONE_MEDIA_STORAGE[$var_name], $before, array($key=>$value));
	}
}

// Push element into array
if (!function_exists('drone_media_storage_push_array')) {
	function drone_media_storage_push_array($var_name, $key, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if ($key==='')
			array_push($DRONE_MEDIA_STORAGE[$var_name], $value);
		else {
			if (!isset($DRONE_MEDIA_STORAGE[$var_name][$key])) $DRONE_MEDIA_STORAGE[$var_name][$key] = array();
			array_push($DRONE_MEDIA_STORAGE[$var_name][$key], $value);
		}
	}
}

// Pop element from array
if (!function_exists('drone_media_storage_pop_array')) {
	function drone_media_storage_pop_array($var_name, $key='', $defa='') {
		global $DRONE_MEDIA_STORAGE;
		$rez = $defa;
		if ($key==='') {
			if (isset($DRONE_MEDIA_STORAGE[$var_name]) && is_array($DRONE_MEDIA_STORAGE[$var_name]) && count($DRONE_MEDIA_STORAGE[$var_name]) > 0) 
				$rez = array_pop($DRONE_MEDIA_STORAGE[$var_name]);
		} else {
			if (isset($DRONE_MEDIA_STORAGE[$var_name][$key]) && is_array($DRONE_MEDIA_STORAGE[$var_name][$key]) && count($DRONE_MEDIA_STORAGE[$var_name][$key]) > 0) 
				$rez = array_pop($DRONE_MEDIA_STORAGE[$var_name][$key]);
		}
		return $rez;
	}
}

// Inc/Dec array element with specified value
if (!function_exists('drone_media_storage_inc_array')) {
	function drone_media_storage_inc_array($var_name, $key, $value=1) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if (empty($DRONE_MEDIA_STORAGE[$var_name][$key])) $DRONE_MEDIA_STORAGE[$var_name][$key] = 0;
		$DRONE_MEDIA_STORAGE[$var_name][$key] += $value;
	}
}

// Concatenate array element with specified value
if (!function_exists('drone_media_storage_concat_array')) {
	function drone_media_storage_concat_array($var_name, $key, $value) {
		global $DRONE_MEDIA_STORAGE;
		if (!isset($DRONE_MEDIA_STORAGE[$var_name])) $DRONE_MEDIA_STORAGE[$var_name] = array();
		if (empty($DRONE_MEDIA_STORAGE[$var_name][$key])) $DRONE_MEDIA_STORAGE[$var_name][$key] = '';
		$DRONE_MEDIA_STORAGE[$var_name][$key] .= $value;
	}
}

// Call object's method
if (!function_exists('drone_media_storage_call_obj_method')) {
	function drone_media_storage_call_obj_method($var_name, $method, $param=null) {
		global $DRONE_MEDIA_STORAGE;
		if ($param===null)
			return !empty($var_name) && !empty($method) && isset($DRONE_MEDIA_STORAGE[$var_name]) ? $DRONE_MEDIA_STORAGE[$var_name]->$method(): '';
		else
			return !empty($var_name) && !empty($method) && isset($DRONE_MEDIA_STORAGE[$var_name]) ? $DRONE_MEDIA_STORAGE[$var_name]->$method($param): '';
	}
}

// Get object's property
if (!function_exists('drone_media_storage_get_obj_property')) {
	function drone_media_storage_get_obj_property($var_name, $prop, $default='') {
		global $DRONE_MEDIA_STORAGE;
		return !empty($var_name) && !empty($prop) && isset($DRONE_MEDIA_STORAGE[$var_name]->$prop) ? $DRONE_MEDIA_STORAGE[$var_name]->$prop : $default;
	}
}
?>