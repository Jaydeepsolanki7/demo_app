// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

// app/javascript/packs/cocoon_init.js

// import 'cocoon-js';

// document.addEventListener('DOMContentLoaded', function() {
//   // Initialize Cocoon
//   $('form').on('cocoon:after-insert', function() {
//     // Additional initialization or behavior if needed
//   });
// });
