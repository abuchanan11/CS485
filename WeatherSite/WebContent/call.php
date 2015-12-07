<?php
	
	// latitutde and longitude
	$lat = -91;
	$lon = 44;

	// key
	$key = "546f5b587c1c07b8c59dad683fe4bf52";

	// call the api
	$api = "api.openweathermap.org/data/2.5/weather?lat={$lat}&lon={$lon}&APPID=$key";
	$returned = fopen($api, "r");

	echo $returned;

?>