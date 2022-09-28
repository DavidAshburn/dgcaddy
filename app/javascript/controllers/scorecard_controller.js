import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
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
  	this.hole = 1;
  	this.length = this.hiddenLengthTarget.innerText;
  	this.score = 0;
  	this.shots = [];
  }

  undoShot() {
  	this.score--;
  	this.shots.pop();
  }

  addShot() {
  	this.score++;
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
  }

  offFairwayShot() {
  	this.closeShotModal();
  	this.shots.push('3');
  }

  circleTwoShot() {
  	this.closeShotModal();
  	this.shots.push('2');
  }

  circleOneShot() {
  	this.closeShotModal();
  	this.shots.push('1');
  }

  basketShot() {
  	this.closeShotModal();
  	this.shots.push('0');
  	this.openBasketModal();
  }

  openShotModal() {
  	this.shotModalTarget.classList.toggle("hidden", false);
  }

  closeShotModal() {
  	this.shotModalTarget.classList.toggle("hidden", true);
  }

  openBasketModal() {
  	this.basketModalTarget.classList.toggle("hidden", false);
  }

  closeBasketModal() {
  	this.basketModalTarget.classList.toggle("hidden", true);
  }

  updatePHS() {
  	this.holeparTarget.innerText = this.par;
  	this.holeScoreTarget.innerText = this.score;
  	this.holeNumberTarget.innerText = this.hole;
  }

}