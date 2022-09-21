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
            <span class="top-div-span1">MapMyDesign: </span> 
            <span class="top-div-span2">Map Example</span>
        </div>
        <div id="result">          
          
			 <div class="btn-div"><button onclick="simplePly()" >Edit Line</button></div>
			
            <div id="event-log"></div>
        </div>

	<div id="map"></div>
	
	<script type="text/javascript">
	 var map,polyline;
     function simplePly() {
         map = new mappls.Map('map', {
             center: [28.544, 77.5454],
             zoomControl: true,
             location: true
         });
         map.addListener('load', function(e) {
             var pts = [
            	 {lat: 28.55108,lng: 77.26913},
                 {lat: 28.55106,lng: 77.26906},
                 {lat: 28.55105,lng: 77.26897},
                 {lat: 28.55101,lng: 77.26872},
                 {lat: 28.55099,lng: 77.26849},
                 {lat: 28.55097,lng: 77.26831},
                 {lat: 28.55093,lng: 77.26794},
                 {lat: 28.55089,lng: 77.26764},
                 {lat: 28.55123,lng: 77.26756},
                 {lat: 28.55145,lng: 77.26758},
                 {lat: 28.55168,lng: 77.26758},
                 {lat: 28.55175,lng: 77.26759},
                 {lat: 28.55177,lng: 77.26755},
                 {lat: 28.55179,lng: 77.26753},
                 {lat: 28.55179,lng: 77.27753},       
             ];
             polyline = new mappls.Polyline({
                 map: map,
                 paths: pts,
                 strokeColor: 'red',
                 strokeOpacity: 1.0,
                 strokeWeight: 10,
                 fitbounds: true,
                 editable: true,
                 animate: {
                   speed: 50,
                   icon_width: 20,
                   icon_height: 50,
                   icon_url: "http://www.mapmyindia.com/api/advanced-maps/doc/sample/map_sdk/car.png",
                   repeat: true,
                 },
               });
   
             polygon=new mappls.Polygon({
                 map: map,
                 paths: pts,
                 fillColor: "blue",
                 fitbounds:true
             });
             polygon.setEditable(true);
             })
           }
	</script>

</body>
</html>