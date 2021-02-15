/* global jQuery:false */
/* global BASEKIT_STORAGE:false */

jQuery( document ).ready(
	function() {
		"use strict";
		setTimeout( function() {
			jQuery('.editor-block-list__layout').addClass('scheme_' + DRONE_MEDIA_STORAGE['color_scheme']);
		}, 100 );
	}
);

