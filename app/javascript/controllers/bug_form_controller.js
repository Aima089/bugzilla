import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Status Controller connected!")
  }
  
  static targets = ["bugType", "status"]
  
  initialize() {
    this.statusOptions = {
      feature: [
        { value: 'firstpoint', text: 'First Point' },
        { value: 'started', text: 'Started' },
        { value: 'resolved', text: 'Resolved' }
      ],
      bug: [
        { value: 'completed', text: 'Completed' },
        { value: 'started', text: 'Started' },
        { value: 'resolved', text: 'Resolved' }
      ]
    }
    this.updateStatusOptions()
  }

  updateStatusOptions() {
    const selectedBugType = this.bugTypeTarget.value
    const statusSelect = this.statusTarget

    statusSelect.innerHTML = '' // Clear existing options
    const options = this.statusOptions[selectedBugType] || []

    options.forEach(option => {
      const newOption = document.createElement("option")
      newOption.value = option.value
      newOption.text = option.text
      statusSelect.add(newOption)
    })
  }
}
