import { Application } from '@hotwired/stimulus'

import BugFormController from "./bug_form_controller"
const application = Application.start()

application.register("bugForm", BugFormController);