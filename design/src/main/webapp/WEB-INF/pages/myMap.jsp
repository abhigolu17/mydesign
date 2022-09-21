<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
          html,
          body,
          #map {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100vh;
          }
          </style>

 <script src="https://apis.mapmyindia.com/advancedmaps/v1/8205fd4cd5e6c4401b8b63a2b483c1fe/map_load?v=1.5"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="map"></div>

	
	<script type="text/javascript">
		  
	var map=new MapmyIndia.Map("map",{ center:[28.61, 77.23],zoomControl: true,hybrid:true });
	L.marker([28.61, 77.23]).addTo(map);
	
	map.on("click", function (e) 
			{ 
			L.marker([e.latlng.lat, e.latlng.lng]).addTo(map);
			});
	</script>


</body>
</html>