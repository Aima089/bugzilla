import { Application } from '@hotwired/stimulus'
import RailsNestedFormController from "./rails_nested_form_controller";
import Modal from "./modal_controller"
import ProductSearchController from "./product_search_controller"
import PosController from "./pos_controller"
const application = Application.start()
application.register('nested-form', RailsNestedFormController);
application.register('modal', Modal);
application.register("productSearch", ProductSearchController);
application.register("pos", PosController);
application.register("bugform", BugFormController);