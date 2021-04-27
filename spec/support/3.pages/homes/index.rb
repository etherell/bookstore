# frozen_string_literal: true

module Pages
  module Homes
    class Index < SitePrism::Page
      set_url '/'

      section :header, Sections::Header, 'header'
      section :footer, Sections::Footer, 'footer'

      element :welcome_message, '.text-center .welcome-text', text: I18n.t('homes.index.welcome')
      element :description, '.text-center .description-text', text: I18n.t('homes.index.description')
      element :get_started_button, '.text-center .get-started-btn', text: I18n.t('homes.index.get_started')
      element :best_sellets, '.best-sellers-title', text: I18n.t('homes.index.best_sellers')
    end
  end
end
