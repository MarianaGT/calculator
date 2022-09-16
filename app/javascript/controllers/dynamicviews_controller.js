import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamicviews"
export default class extends Controller {
  static targets = ["fishfrequency", "fishgroup","eggfrequency", "eggoutput","eggamount","vegfrequency", "vegoutput", "vegamount"]
  static values = {hideelement: Number}
  connect() {
    this.toggle()
    this.showEggAmountControl()
    this.showVeggies()
  }
  toggle(e) {
      if(e!==undefined) {
      if(e.target.value == this.hideelementValue ) {
        this.fishgroupTarget.hidden = true
      } else {
        this.fishgroupTarget.hidden = false
      }
    }  else {
      this.fishgroupTarget.hidden = true
    }
  }
  showEggAmountControl(e){
    if(e !== undefined) {
      if(e.target.value == this.hideelementValue) {
        this.eggoutputTarget.hidden = true
        this.eggamountTarget.value = 0
      } else {
        this.eggoutputTarget.hidden = false
      }
    } else {
      this.eggoutputTarget.hidden = true
      this.eggamountTarget.value = 0
    }
  }
  showVeggies(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.vegoutputTarget.hidden = true
        this.vegamountTarget.value = 0
      } else {
        this.vegoutputTarget.hidden = false
      }
    } else {
      this.vegoutputTarget.hidden = true
      this.vegamountTarget.value = 0
    }
  }
  checkForHidingElement(el, ref) {
    return el == ref
  }
}
