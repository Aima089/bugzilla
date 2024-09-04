import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs";

// Start Stimulus application
const application = Application.start()
export { application }

// Start Rails UJS
Rails.start()
