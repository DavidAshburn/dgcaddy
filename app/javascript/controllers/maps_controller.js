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

 	putLocation() {	
 		navigator.geolocation.getCurrentPosition(position => {
 			this.lat = position.coords.latitude;
			this.latitudeTarget.innerText = this.lat;
 			this.lon = position.coords.longitude;
 			this.longitudeTarget.innerText = this.lon;
 		});
 	}
}