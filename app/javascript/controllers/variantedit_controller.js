import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 
	"parformout",
	"lengthformout",
	"lengthformin", 
	"backnine", 
	"holepar"
	]
  connect() {
  	if(this.lengthformoutTarget.value == 18)
  		this.lengthforminTarget.value = 18;
  	else
  		this.lengthforminTarget.value = 9;
  	
  	let pars = this.parformoutTarget.value.split('');
  	let holes = this.holeparTargets;
  	pars.map((element, index) => holes[index].value = element );
  }

  changeLength() {
	if(this.lengthforminTarget.value == 9) {
	  this.backnineTarget.classList.toggle("hidden", true);
	  this.lengthformoutTarget.value = 9;
	} else {
	  this.backnineTarget.classList.toggle("hidden", false);
	  this.lengthformoutTarget.value = 18;
	}
  }

  updateParString() {
	let list = this.holeparTargets.map(x => x.value);

	if(this.lengthforminTarget.value == 9) {
	  for(let i = 0; i < 9; i++) {
	  list.pop();
	  }
	}

	this.parformoutTarget.value = list.join('');
  }


}