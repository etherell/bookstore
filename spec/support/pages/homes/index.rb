# frozen_string_literal: true

module Pages
  module Homes
    class Index < SitePrism::Page
      set_url '/'

      section :header, 'header' do
        element :brand, 'a.navbar-brand', text: I18n.t('partials.header.bookstore')
        element :home_link, 'ul.navbar-nav a.home-link', text: I18n.t('partials.header.home')
        element :shop_link, 'ul.navbar-nav  a.shop-header-link', text: I18n.t('partials.header.shop')
        element :my_account_link, 'ul.navbar-nav a.my-account-link', text: I18n.t('partials.header.my_account')
        element :log_out_link, 'ul.navbar-nav a.log-out-link', text: I18n.t('partials.header.log_out')
      end

      section :footer, 'footer' do
        element :home_link, 'list-inline a.home-link', text:  I18n.t('partials.footer.home')
        element :shop_link, 'list-inline a.footer-shop-link', text: I18n.t('partials.footer.shop')
        element :orders_link, 'list-inline a.orders-link', text: I18n.t('partials.footer.orders')
        element :settings_link, 'list-inline a.settings-link', text: I18n.t('partials.footer.settings')
      end

      element :welcome_message, '.text-center .welcome-text', text: I18n.t('homes.index.welcome')
      element :description, '.text-center .description-text', text: I18n.t('homes.index.description')
      element :get_started_button, '.text-center .get-started-btn', text: I18n.t('homes.index.get_started')
      element :best_sellets, '.best-sellers-title', text: I18n.t('homes.index.best_sellers')
    end
  end
end