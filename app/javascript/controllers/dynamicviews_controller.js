import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamicviews"
export default class extends Controller {
  static targets = ["fishfrequency", "fishgroup"]
  static values = {hidefish: Number}
  connect() {
    this.toggle()
  }
  toggle(e) {
      if(e!==undefined) {
      if(e.target.value == this.hidefishValue ) {
        this.fishgroupTarget.hidden = true
      } else {
        this.fishgroupTarget.hidden = false
      }
    }  else {
      this.fishgroupTarget.hidden = true
    }
  }
}
