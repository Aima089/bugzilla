import { Application } from '@hotwired/stimulus'
const application = Application.start()

application.register("bugform", BugFormController);