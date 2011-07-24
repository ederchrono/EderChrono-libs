package com.ederchrono.utils
{
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequestMethod;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	/**
	 * @author Eder
	 */
	public class ServiceUtils
	{
		/**
         * Makes a post call via urlRequest
         * when finished makes a call to the callBack(e.data)
         * if failed e.data = null;
         * @example example:
         * ServiceUtils.makePostCall(url, requestVars, callBack);
         * function callback(data:*)
         * {
         * 	...
         * }
         */
		public static function makePostCall(url:String, requestVars:URLVariables, callBack:Function):void
		{
			var request:URLRequest = new URLRequest(url);
			request.data = requestVars;
			request.method = URLRequestMethod.POST;
			var urlLoader:URLLoader = new URLLoader();
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, function(e:Event):void
			{
				callBack(urlLoader.data);
			}, false, 0, true);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(e:HTTPStatusEvent):void
			{
				callBack(null);
			}, false, 0, true);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(e:HTTPStatusEvent):void
			{
				callBack(null);
			}, false, 0, true);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, function(e:HTTPStatusEvent):void
			{
				callBack(null);
			}, false, 0, true);
			urlLoader.load(request);
		}
	}
}
