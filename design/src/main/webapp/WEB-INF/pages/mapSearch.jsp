<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
         <link rel="icon" href="http://mapmyindia.com/images/favicon.ico" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <style type="text/css">
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
<div style="border-bottom: 1px solid #e9e9e9;padding:10px 12px;background:#fff;"><span style="font-size: 20px">MapmyIndia Maps API:</span> <span style="font-size:16px;color:#777">Circle Example</span></div>
            <div id="menu">
                <div style="padding: 0 12px 0 12px"> <div style="padding: 5px 0;font-size:13px;color:#222">Enter Latitude</div>
                    <input type="text" style="width: 254px; margin-right: 10px;padding:5px;border:1px solid #ddd;color:#555" id="lat" placeholder="Latitude" autocomplete="off" onkeypress="if (event.which == 13 || event.keyCode == 13)
                                showCircle();
                            return isNumberKeyDecimals(event);"><br/>
                        <div style="padding: 5px 0;font-size:13px;color:#222">Enter Longitude</div>
                        <input type="text" style="width: 254px; margin-right: 10px;padding:5px;border:1px solid #ddd;color:#555" id="lon" placeholder="longitude" autocomplete="off" onkeypress="if (event.which == 13 || event.keyCode == 13)
                                    showCircle();
                                return isNumberKeyDecimals(event);"/>
                        <div style="padding: 5px 0;font-size:13px;color:#222">Enter Radius (in m)</div>
                        <input type="number" style="width: 254px; margin-right: 10px;padding:5px;border:1px solid #ddd;color:#555" id="radius" placeholder="radius" autocomplete="off" onkeypress="if (event.which == 13 || event.keyCode == 13)
                                    showCircle();
                                return isNumberKeyDecimals(event);"/>
                        <br/><br/><button onclick="showCircle();">Search</button>
                </div>
                <div style="margin-top: 20px">
                    <ul style=" line-height: 20px; font-size: 12px;">
                        <li>Drag marker to geofence at your desired location</li>
                    </ul>
                </div>
                <div style="border-top: 1px solid #e9e9e9;margin-top: 20px;padding: 10px 10px 5px 17px;font-size: 13px;" id="result">loading..</div>
            </div>
            <!--put your map container here-->
            <div id="map"></div>
 <script type="text/javascript">
 var map;
 
 function showCircle() {
 	/* 	defaultMap; */
     map = new mappls.Map('map', {center:[28.638698386592438,77.27604556863412]});
 }
 
	</script>
 
</body>
</html>