import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 	static targets = [ 
 		"mapPane",
 		"latitude",
 		"longitude"
 	]

 	connect() {
   	this.checkGeolocation();
   	this.getGeolocation();
 	}

 	checkGeolocation() {
   	if ('geolocation' in navigator) {
   		console.log("geolocation available");
   	} else {
   		console.log("geolocation is not available");
   	}
 	}

 	getGeolocation() {	
 		navigator.geolocation.getCurrentPosition(position => {
 			let lat = position.coords.latitude;
		this.latitudeTarget.innerText = lat;
 			let lon = position.coords.longitude;
 			this.longitudeTarget.innerText = lon;
 		});
 	}

}