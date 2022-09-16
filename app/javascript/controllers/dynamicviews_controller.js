import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamicviews"
export default class extends Controller {
  static targets = [
      "fishfrequency",
    "fishgroup",
    "eggfrequency",
    "eggoutput",
    "eggamount",
    "vegfrequency",
    "vegoutput",
    "vegamount",
    "fruitfrequency",
    "fruitoutput",
    "fruitamount",
    "tortillafrequency",
    "tortillaoutput",
    "tortillaamount",
    "tacofrequency",
    "tacooutput",
    "bolillofrequency",
    "bolillooutput",
    "bolilloamount",
    "panfrequency",
    "panoutput",
    "panamount",
    "embutidosfrequency",
    "embutidosoutput"
  ]
  static values = {hideelement: Number}
  connect() {
    this.toggle()
    this.showEggAmountControl()
    this.showVeggies()
    this.showFruit()
    this.showTortillas()
    this.showBolillos()
    this.showPan()
    this.showEmbutidos(),
    this.showTaco()
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
  showFruit(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.fruitoutputTarget.hidden = true
        this.fruitamountTarget.value = 0
      } else {
        this.fruitoutputTarget.hidden = false
      }
    } else {
      this.fruitoutputTarget.hidden = true
      this.fruitamountTarget.value = 0
    }
  }
  showTortillas(e){
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.tortillaoutputTarget.hidden = true
        this.tortillaamountTarget.value = 0
      } else {
        this.tortillaoutputTarget.hidden = false
      }
    } else {
      this.tortillaoutputTarget.hidden = true
      this.tortillaamountTarget.value = 0
    }

  }
  checkForHidingElement(el, ref) {
    return el == ref
  }

  showBolillos(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.bolillooutputTarget.hidden = true
        this.bolilloamountTarget.value = 0
      } else {
        this.bolillooutputTarget.hidden = false
      }
    } else {
      this.bolillooutputTarget.hidden = true
      this.bolilloamountTarget.value = 0
    }

  }

  showPan(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.panoutputTarget.hidden = true
        this.panamountTarget.value = 0
      } else {
        this.panoutputTarget.hidden = false
      }
    } else {
      this.panoutputTarget.hidden = true
      this.panamountTarget.value = 0
    }
  }

  showEmbutidos(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.embutidosoutputTarget.hidden = true
      } else {
        this.embutidosoutputTarget.hidden = false
      }
    } else {
      this.embutidosoutputTarget.hidden = true
    }
  }

  showTaco(e) {
    if(e !== undefined) {
      if(this.checkForHidingElement(e.target.value, this.hideelementValue)) {
        this.tacooutputTarget.hidden = true
      } else {
        this.tacooutputTarget.hidden = false
      }
    } else {
      this.tacooutputTarget.hidden = true
    }

  }
}
