# frozen_string_literal: true

module Sections
  class Footer < SitePrism::Section
    element :home_link, 'list-inline a.home-link', text:  I18n.t('partials.footer.home')
    element :shop_link, 'list-inline a.footer-shop-link', text: I18n.t('partials.footer.shop')
    element :orders_link, 'list-inline a.orders-link', text: I18n.t('partials.footer.orders')
    element :settings_link, 'list-inline a.settings-link', text: I18n.t('partials.footer.settings')
  end
end
