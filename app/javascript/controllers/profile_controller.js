import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [
	"outOne"
	]

	initialize() {
		this.sum = 1;
	}

	connect() {
		this.outOneTarget.innerText = this.sum;
	}

	output() {
		this.outOneTarget.innerText = this.sum;
	}

	add() {
		this.sum += 1;
		this.outOneTarget.innerText = this.sum;
	}
}