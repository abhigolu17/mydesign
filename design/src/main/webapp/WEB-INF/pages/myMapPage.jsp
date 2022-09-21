<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

          html,
          body,
          #map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100vh;
          }
          </style>
<script src="https://apis.mappls.com/advancedmaps/api/8205fd4cd5e6c4401b8b63a2b483c1fe/map_sdk?layer=vector&v=3.0&callback=initMap1" defer async></script>
            
<title>My Map</title>
</head>
<body>

<div class="top-div">
            <span class="top-div-span1">MapmyIndia Maps API: </span> 
            <span class="top-div-span2">Map Marker Example</span>
        </div>
        <div id="result">          
          
			<div class="btn-div"><button onclick="defaultMap()" >Default Map</button></div>
            <div class="btn-div"><button onclick="setMapTilt()" >Set Map Tilt</button></div>
            <div class="btn-div"><button onclick="model3D()" >3D Model</button></div>
			<div class="btn-div"><button onclick="mark()" >Mark</button></div>
			
			<div class="msg-cont">
                <ul class="msg-list">
                    <li>Click/drag marker to see events.</li>
                </ul>
            </div>
			<div class="event-header">Event Logs</div>
            <div id="event-log"></div>
        </div>

	<div id="map"></div>
	
	 <script>
        var map, Marker1;
            
        
        function defaultMap() {
        	/* 	defaultMap; */
            map = new mappls.Map('map', {center:[28.638698386592438,77.27604556863412]});
        }
        
        function setMapTilt() {
        /* 	defaultMap; */
            map = new mappls.Map('map', {
                center: [28.61, 77.23],
                zoomControl: true,
                tilt: 60
            });
        }
        
        function model3D() {
            map = new mappls.Map('map', {center:[28.56374856726235,77.23955807542086]});
            mappls.setStyle('standard-hybrid',map);
	    map.addListener('load',function(){
                threeOBJ=mappls.add3DModel({map:map,pitchChanged:0,callback:function(d){
                    data=d;
                  
                }});
                
            })
        }
       
        
		function mark() {
		debugger;
			 map = new mappls.Map('map', {center:[28.638698386592438,77.27604556863412],zoomControl: true,tilt: 60});
			 var event_div = document.getElementById("event-log");
             event_div.innerHTML = "Draggable Marker created, drag the marker to the new position.";
			 map.addListener('click', function (e) { 
				 console.log(e);
				 /* alert(e.lngLat); */
				 
				 mappls.remove({map: map, layer: Marker1});
				 
				   Marker1 = new mappls.Marker({
		              map: map,
		              position: e.lngLat,
		              fitbounds: true,
		              popupHtml: e.lngLat,
		              draggable: true,
		              
		            });					   
				   event_div.innerHTML = "Draggable:</br>" + e.lngLat + "</br>";
				 });
		}
       
    </script>
</body>
</html>