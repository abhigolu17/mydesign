<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"lang="en" xml:lang="en">
    <head>
        <title>MapmyIndia Maps API: Map properties and events</title>
        <link rel="icon" href="http://mapmyindia.com/images/favicon.ico" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style type="text/css">
            html { 
                height: 100%;
            }
            body { 
                height: 100%;font-family:Verdana,sans-serif, Arial;color:#000;margin: 0; font-size:14px; padding: 0; 
            }
            #map {
                position: absolute;left: 312px; top: 46px; right: 2px; bottom: 2px; border: 1px solid #cccccc;
            }
            #result {
                position: absolute;left: 2px; top: 46px;width: 306px;bottom: 2px; border: 1px solid #cccccc;background-color: #FAFAFA; overflow: auto;
            }
            button{
                width: 220px;font-family:Verdana,sans-serif, Arial;font-size:12px;padding:2px 0;color:#333
            }
            .top-div{
                border-bottom: 1px solid #e9e9e9;padding:10px 12px;background:#fff;
            }
            .top-div-span1{
                font-size: 20px;
            }
            .top-div-span2{
                font-size:16px;color:#777
            }
            .btn-div{
                padding: 16px 12px 6px 38px;
            }
            .msg-cont{
                padding:6px 12px 1px; border-bottom:1px solid #e9e9e9;
            }
            .msg-list{
                line-height: 20px; font-size: 12px; color: #555;
            }
            .event-header{
                padding:14px 12px 6px 38px;color: #666;
            }
            #event-log{
                padding:6px 12px 6px 38px;color: #777; font-size: 12px; line-height: 22px;
            }
            .map_marker{
                position:relative;width:34px;height:48px
            }
            /*marker text span css*/
            .my-div-span{
                position: absolute;left:1.5em;right: 1em;top:1.4em;bottom:2.5em;font-size:9px;font-weight:bold;width:1px;color:black;
            }
        </style>

        <script src="https://apis.mapmyindia.com/advancedmaps/v1/8205fd4cd5e6c4401b8b63a2b483c1fe/map_load?v=1.5"></script>
		
    </head>
    <body>
        <div class="top-div">
            <span class="top-div-span1">MapmyIndia Maps API: </span> 
            <span class="top-div-span2">Map Marker Example</span>
        </div>
        <div id="result">            

            <div class="btn-div"><button onclick="mapmyindia_draggable_marker()" >Make Marker Draggable</button></div>
            <div class="btn-div"><button onclick="mapmyindia_removeMarker()" >Remove Marker(s)</button></div>

            <div class="msg-cont">
                <ul class="msg-list">
                    <li>Click anywhere on the map to add a marker.</li>
                    <li>Click/drag marker to see events.</li>
                </ul>
            </div>
            <div class="event-header">Event Logs</div>
            <div id="event-log"></div>
        </div>
        <div id="map"></div>
        
        <script>
            var map = null;
            var marker = [];
            
            window.onload = function () {
                map = new MapmyIndia.Map('map', {center: [28.549948, 77.268241], zoomControl: true, hybrid: true});

                map.on("click", function (e) {
                    var title = "Text marker sample!";
                    marker.push(addMarker(e.latlng, "", title));
                });
            };
            
            function addMarker(position, icon, title, draggable) {
                /* position must be instance of L.LatLng that replaces current WGS position of this object. Will always return current WGS position.*/
                var event_div = document.getElementById("event-log");
                if (icon == '') {
                    var mk = new L.Marker(position, {draggable: draggable, title: title});/*marker with a default icon and optional param draggable, title */
                    mk.bindPopup(title);
                } else {
                    var mk = new L.Marker(position, {icon: icon, draggable: draggable, title: title});/*marker with a custom icon */
                    mk.bindPopup(title);
                }
                map.addLayer(mk);/*add the marker to the map*/
                /* marker events:*/
                mk.on("click", function (e) {
                    event_div.innerHTML = "Marker clicked<br>" + event_div.innerHTML;
                });

                return mk;
            }

      
            /*function to make  marker draggable*/
            function mapmyindia_draggable_marker() {

                var postion = new L.LatLng(28.5628, 77.6856);/*WGS location object*/
                var mk = addMarker(postion, '', "Draggable marker sample", true);/*call the add marker function*/
                var event_div = document.getElementById("event-log");
                event_div.innerHTML = "Draggable Marker created, drag the marker to the new position.";
                /* following events can be assigned handler (for every instance of draggable marker(s))*/
                mk.on("dragstart", function (e) {
                    event_div.innerHTML = "Marker drag start<br>" + event_div.innerHTML;
                });
                mk.on("dragend", function (e) {
                    var pt = e.target._latlng;/*event returns lat lng of dragged position*/
                    mk.setLatLng(pt);/*set marker position to dragged position*/
                    event_div.innerHTML = "Draggable:</br> lat:" + pt.lat + "</br>lng:" + pt.lng + "</br>";
                });
                marker.push(mk);
                map.setView(mk.getLatLng());/*get the wgs locaton from marker and set the location into center*/
            }

        </script>
        
    </body>
</html>
