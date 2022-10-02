import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 
	"parformout",
	"lengthformout",
	"lengthformin", 
	"backnine", 
	"holepar"
	]
  connect() { //sets display up for the card length and fills table data
  	if(this.lengthformoutTarget.value == 18)
  		this.lengthforminTarget.value = 18;
  	else
  		this.lengthforminTarget.value = 9;
  	
  	let pars = this.parformoutTarget.value.split('');
  	let holes = this.holeparTargets;
  	pars.map((element, index) => holes[index].value = element );
  }

  changeLength() { //hides/shows holes 10-18 on length select box change event
	if(this.lengthforminTarget.value == 9) {
	  this.backnineTarget.classList.toggle("hidden", true);
	  this.lengthformoutTarget.value = 9;
	} else {
	  this.backnineTarget.classList.toggle("hidden", false);
	  this.lengthformoutTarget.value = 18;
	}
  }

  updateParString() { //triggered on select boxes change event, sets hidden form field string
	let list = this.holeparTargets.map(x => x.value);

	if(this.lengthforminTarget.value == 9) {
	  for(let i = 0; i < 9; i++) {
	  list.pop();
	  }
	}

	this.parformoutTarget.value = list.join('');
  }


}