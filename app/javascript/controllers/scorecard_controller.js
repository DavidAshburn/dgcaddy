import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
  	"parsIn",
    "holePar",
    "holeScore",
    "holeNumber",
    "cardHole",
    "shotIcons",
    "hiddenLength",
    "hiddenShots",
    "hiddenScore",
    "shotModal",
    "basketModal"
  ]

  connect() {
  	this.hole = 0;
  	this.length = parseInt(this.hiddenLengthTarget.innerText);
  	this.scores = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  	this.shots = [];
  	this.parray = this.parsInTarget.innerText.split('');
  }

  undoShot() {
  	if(this.scores[this.hole] != 0) {
	  this.scores[this.hole]--;
	  this.shots.pop();
	  this.updatePHS();
	}
  }

  addShot() {
  	this.scores[this.hole]++;
  	this.updatePHS();
  }

  lastHole() {
  	this.hole--;
  	updatePHS();
  }
  nextHole() {
  	this.hole++;
  	updatePHS();
  }

  fairwayShot() {
  	this.closeShotModal();
  	this.shots.push('4');
  	this.addShot();
  }

  offFairwayShot() {
  	this.closeShotModal();
  	this.shots.push('3');
  	this.addShot();
  }

  circleTwoShot() {
  	this.closeShotModal();
  	this.shots.push('2');
  	this.addShot();
  }

  circleOneShot() {
  	this.closeShotModal();
  	this.shots.push('1');
  	this.addShot();
  }
  openBasketModal() {
  	while (this.basketModalTarget.hasChildNodes()){
        this.basketModalTarget.removeChild(this.basketModalTarget.firstElementChild);
      }

  	let close_range = document.createElement("button");
    let mid_range = document.createElement("button");
    let long_range = document.createElement("button");
    let close_modal = document.createElement("button");

    let last_shot = this.shots.at(-1);

    switch(last_shot) {
      case '2':
        let close = "33 - 44ft";
        let mid = "44 - 55ft";
        let long = "55 - 66ft";
        break;
      case '1';
        let close = "0 - 11ft";
        let mid = "11 - 22ft";
        let long = "22 - 33ft";
        break;
      default:
        let close = "66 - 80ft";
        let mid = "80 - 100ft";
        let long = "100ft+";
       	break;
    }

    close_range.classList.add("btn-green");
    close_range.innerText = close;
    close_range.setAttribute("data-action", "scorecard#nearBasket");

    mid_range.classList.add("btn-blue");
    mid_range.innerText = mid;
    mid_range.setAttribute("data-action", "scorecard#midBasket");

    long_range.classList.add("btn-yellow");
    long_range.innerText = long;
    long_range.setAttribute("data-action", "scorecard#longBasket");

    close_modal.classList.add("btn-grey", "w-1/2");
    close_modal.innerText = "Close";
    close_modal.setAttribut("data-action", "scorecard#closeBasketModal");
	
	this.basketModalTarget.appendChild(close_range);
    this.basketModalTarget.appendChild(mid_range);
    this.basketModalTarget.appendChild(long_range);
    this.basketModalTarget.appendChild(close_modal);

    this.basketModalTarget.classList.toggle("hidden", false);
  }

  nearBasket() {
  	this.shots.push('A');
  	this.shots.push('0');
  	this.scores[this.hole]++;
  	this.closeBasketModal();
  	this.nextHole();
  }

  midBasket() {
  	this.shots.push('B');
  	this.shots.push('0');
  	this.scores[this.hole]++;
  	this.closeBasketModal();
  	this.nextHole();
  }

  longBasket() {
  	this.shots.push('C');
  	this.shots.push('0');
  	this.scores[this.hole]++;
  	this.closeBasketModal();
  	this.nextHole();
  }
  

  openShotModal() {
  	this.shotModalTarget.classList.toggle("hidden", false);
  }

  closeShotModal() {
  	this.shotModalTarget.classList.toggle("hidden", true);
  }

  closeBasketModal() {
  	this.basketModalTarget.classList.toggle("hidden", true);
  }

  updatePHS() {
  	//update main counters
  	this.holeScoreTarget.innerText = this.score;
  	this.holeNumberTarget.innerText = this.hole + 1;
  	this.holeparTarget.innerText = this.parray[this.hole];

  	//style score numbers for bogey, par, and birdie(skip 0s)
  	let scorecard = this.cardHoleTargets;
  	for(let i = 0; i < this.length; i++) {
  	  let score = parseInt(scorecard[i].innerText);
  	  if(score > parseInt(this.parray[i])) {
  	    scorecard[i].classList.toggle("bg-amber-400", false);
  	    scorecard[i].classList.toggle("bg-green-400", true);
  	    scorecard[i].classList.toggle("bg-sky-400", true);
  	  } else if(score == parseInt(this.parray[i])) {
  	    scorecard[i].classList.toggle("bg-amber-400", true);
  	    scorecard[i].classList.toggle("bg-green-400", false);
  	    scorecard[i].classList.toggle("bg-sky-400", true);
  	  } else if(score != 0) {
  	    scorecard[i].classList.toggle("bg-amber-400", true);
  	    scorecard[i].classList.toggle("bg-green-400", true);
  	    scorecard[i].classList.toggle("bg-sky-400", false);
  	  }

  	  scorecard[i].innerText = this.scores[i]; 
  	}

  }

}