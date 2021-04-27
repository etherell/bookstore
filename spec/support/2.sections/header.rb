# frozen_string_literal: true

module Sections
  class Header < SitePrism::Section
    element :brand, 'a.navbar-brand', text: I18n.t('partials.header.bookstore')
    element :home_link, 'ul.navbar-nav a.home-link', text: I18n.t('partials.header.home')
    element :shop_link, 'ul.navbar-nav  a.shop-header-link', text: I18n.t('partials.header.shop')
    element :my_account_link, 'ul.navbar-nav a.my-account-link', text: I18n.t('partials.header.my_account')
    element :log_out_link, 'ul.navbar-nav a.log-out-link', text: I18n.t('partials.header.log_out')
  end
end
