# frozen_string_literal: true

module Pages
  module Pages
    class Index < SitePrism::Page
      set_url '/'

      section :header, 'header' do
        element :brand, 'a.navbar-brand', text: I18n.t('partials.header.bookstore')
        element :home_link, 'a.home-link', text: I18n.t('partials.header.home')
        element :shop_link, 'a.shop-header-link', text: I18n.t('partials.header.shop')
        element :my_account_link, 'a.my-account-link', text: I18n.t('partials.header.my_account')
        element :log_out_link, 'a.log-out-link', text: I18n.t('partials.header.log_out')
      end

      section :footer, 'footer' do
        element :home_link, 'a.home-link', text: I18n.t('partials.footer.home')
        element :shop_link, 'a.shop-footer-link', text: I18n.t('partials.footer.shop')
        element :orders_link, 'a.orders-link', text: I18n.t('partials.footer.orders')
        element :settings_link, 'a.settings-link', text: I18n.t('partials.footer.settings')
      end

      element :welcome_message, '.text-center .welcome-text', text: I18n.t('pages.index.welcome')
      element :description, '.text-center .description-text', text: I18n.t('pages.index.description')
      element :get_started_button, '.text-center .get-started-btn', text: I18n.t('pages.index.get_started')
      element :best_sellers, '.best-sellers-title', text: I18n.t('pages.index.best_sellers')
    end
  end
end
