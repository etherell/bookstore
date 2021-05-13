import $ from 'jquery';
import toastr from 'toastr'
require("@rails/ujs").start()
global.Rails = Rails;

window.toastr = toastr;
window.$ = $;
window.jQuery = $;
window.toastr = toastr
import 'bootstrap-sass/assets/javascripts/bootstrap';
require.context('../images', true)
require('./shared/toastr-shower')
