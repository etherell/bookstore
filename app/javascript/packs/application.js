import $ from 'jquery';
require("@rails/ujs").start()
global.Rails = Rails;
global.toastr = require("toastr")

window.toastr = toastr;
window.$ = $;
window.jQuery = $;
import 'bootstrap-sass/assets/javascripts/bootstrap';
require.context('../images', true)
require('./shared/toastr-shower')
