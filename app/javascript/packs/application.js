// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
//= require jquery
import '@client-side-validations/client-side-validations/src'
import '@client-side-validations/simple-form/src'
import "channels"



Rails.start()
Turbolinks.start()
require('@client-side-validations/client-side-validations')
require('@client-side-validations/simple-form/src')
//= require rails.validations
//= require rails.validations.simple_form.bootstrap4
ActiveStorage.start()

import "controllers"
import "bootstrap"

