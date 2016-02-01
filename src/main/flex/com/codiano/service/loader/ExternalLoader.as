/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.service.loader {

import flash.events.IEventDispatcher;

public interface ExternalLoader extends IEventDispatcher {

	function load()					:void;

	function get url()				:String;
	function get data()				:*;

}
}
