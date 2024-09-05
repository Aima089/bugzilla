import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    super.connect();
    console.log("bug form is connected!!!")
  }
}