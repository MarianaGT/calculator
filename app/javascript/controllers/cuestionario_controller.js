import Rails from "@rails/ujs";
import {Controller} from "stimulus";

export default class extends Controller {
    static  targets = ['form']
    submitForm(event) {
        console.log("symon")
        let isValid = this.validateForm(this.formTarget);

        // If our form is invalid, prevent default on the event
        // so that the form is not submitted
        if (!isValid) {
            event.preventDefault();
        }
    }

    validateForm() {
        let isValid = true;

        // Tell the browser to find any required fields
        let requiredFieldSelectors = 'input:required';
        let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);

        requiredFields.forEach((field) => {
            // For each required field, check to see if the value is empty
            // if so, we focus the field and set our value to false
            if (!field.disabled && !field.value.trim()) {
                field.focus();

                isValid = false;
            }
        });

        return isValid;
    }
    handleChange(event) {
        console.log("alv conchita")
        Rails.ajax({
            url: this.urlValue,
            type: "POST",
            data: new FormData(this.formTarget),
            success: (data) => {
                this.outputTarget.innerHTML = data;
            },
        })
    }
}