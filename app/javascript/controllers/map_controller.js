import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 	static targets = [ 
 		"mapPane",
 		"latitude",
 		"longitude"
 	]

 	connect() {

 		let script = document.createElement('script');
 		script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyCmO7h4B2Unq_S5houcwM9OsL7nAx_oHYE&callback=initMap&v=weekly";
 		script.async = true;
 		this.map;

 		window.initMap = function() {
 			this.map = new google.maps.Map(document.getElementById("map"), {
    	center: { lat: -34.397, lng: 150.644 },
    	zoom: 8,
    	});
  	}

  	document.head.appendChild(script);

   	this.checkGeolocation();
 	}

 	checkGeolocation() {
   	if ('geolocation' in navigator) {
   		console.log("geolocation available");
   	} else {
   		console.log("geolocation is not available");
   	}
 	}

 	putLocation() {	 //initMap here to make sure lat and lon are populated before calling
 		navigator.geolocation.getCurrentPosition(position => {
 			this.lat = position.coords.latitude;
			this.latitudeTarget.value = this.lat;
 			this.lon = position.coords.longitude;
 			this.longitudeTarget.value = this.lon;
 		});
   	}
}