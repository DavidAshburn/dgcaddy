import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "parformout", "lengthformin" ]
	connect() {
		console.log("variant_cont connect");
	}

	changeLength() {
		let length = this.lengthforminTarget.value;
		console.log(length);
		console.log("changeLength");
	}


}