import $ from 'jquery';
import toastr from 'toastr/toastr';
require("@rails/ujs").start()
global.Rails = Rails;

window.toastr = toastr;
window.$ = $;
window.jQuery = $;
import 'bootstrap-sass/assets/javascripts/bootstrap';
require.context('../images', true)
require('./shared/toastr-shower')
