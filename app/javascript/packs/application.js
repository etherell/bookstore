import $ from 'jquery';
require("@rails/ujs").start()
global.Rails = Rails;

window.$ = $;
window.jQuery = $;
import 'bootstrap-sass/assets/javascripts/bootstrap';
require.context('../images', true)
