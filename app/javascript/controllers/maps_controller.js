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
   	if (typeof (google) !="undefined") {
   		this.initMap();
   	}
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

 	initMap() {
 		this.map();
 	}

 	map() {
 		if(this._map == undefined) {
 			this._map = new google.maps.Map(this.mapPaneTarget, {
 				center: new google.maps.LatLng(this.latitudeTarget.value, this.longitudeTarget.value),
 				zoom: 17
 			})
 		}
 		return this._map
 	}


}