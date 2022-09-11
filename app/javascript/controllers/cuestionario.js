import {Controller} from "@hotwired/stimulus";
export default class extends Controller {
    static targets = ['questions','form', 'submitbutton']
    connect() {

    }
    submitForm(event) {
        let isValid = this.validateForm(this.formTarget);

        // If our form is invalid, prevent default on the event
        // so that the form is not submitted
        if (!isValid) {
            event.preventDefault();
        }
    }
    validateForm(event) {
        console.log("conchini")
        let isValid = true;

        let requiredFieldSelectors = 'textarea:required, input:required';
        let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);

        requiredFields.forEach((field) => {
            if (!field.disabled && !field.value.trim()) {
                field.focus();

                isValid = false;

                return false;
            }
        });

        // If we already know we're invalid, just return false
        if (!isValid) {
            return false;
        }

        // Search for any browser invalidated input fields and focus them
        let invalidFields = this.formTarget.querySelectorAll('input:invalid');

        invalidFields.forEach((field) => {
            if (!field.disabled) {
                field.focus();

                isValid = false;
            }
        });

        return isValid;
    }

}