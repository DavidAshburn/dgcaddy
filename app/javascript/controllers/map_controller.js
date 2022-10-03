import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 	static targets = [ 
 		"mapPane",
 		"latitude",
 		"longitude"
 	]

 	connect() {
   	this.checkGeolocation();
   	this.putLocation();
   	
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