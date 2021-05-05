# frozen_string_literal: true

module Pages
  module Addresses
    class New < SitePrism::Page
      set_url '/addresses/new'

      element :page_title, 'h1.general-title-margin', text: I18n.t('partials.settings_menu.title')
      element :address_tab, 'a.address-tab', text: I18n.t('partials.settings_menu.address')
      element :privacy_tab, 'a.privacy-tab', text: I18n.t('partials.settings_menu.privacy')
      element :billing_title, 'h3.billing-title', text: I18n.t('addresses.new.billing_title')
      element :shipping_title, 'h3.shipping-title', text: I18n.t('addresses.new.shipping_title')
      element :toaster, '.toast-message'

      section :shipping_form, '.shipping-form' do
        element :first_name_label, 'label.first-name-label', text: I18n.t('addresses.form.first_name')
        element :first_name_input, 'input#firstName'
        element :last_name_label, 'label.last-name-label', text: I18n.t('addresses.form.last_name')
        element :last_name_input, 'input#lastName'
        element :address_label, 'label.address-label', text: I18n.t('addresses.form.address')
        element :address_input, 'input#address'
        element :city_label, 'label.city-label', text: I18n.t('addresses.form.city')
        element :city_input, 'input#city'
        element :zip_label, 'label.zip-label', text: I18n.t('addresses.form.zip')
        element :zip_input, 'input#zip'
        element :country_label, 'label.country-label', text: I18n.t('addresses.form.country')
        element :country_input, 'select#country'
        element :phone_label, 'label.phone-label', text: I18n.t('addresses.form.phone')
        element :phone_input, 'input#phone'
        element :submit_button, 'input.submit-btn'
        element :error_message, '.error.text-danger'
      end

      section :billing_form, '.billing-form' do
        element :first_name_label, 'label.first-name-label', text: I18n.t('addresses.form.first_name')
        element :first_name_input, 'input#firstName'
        element :last_name_label, 'label.last-name-label', text: I18n.t('addresses.form.last_name')
        element :last_name_input, 'input#lastName'
        element :address_label, 'label.address-label', text: I18n.t('addresses.form.address')
        element :address_input, 'input#address'
        element :city_label, 'label.city-label', text: I18n.t('addresses.form.city')
        element :city_input, 'input#city'
        element :zip_label, 'label.zip-label', text: I18n.t('addresses.form.zip')
        element :zip_input, 'input#zip'
        element :country_label, 'label.country-label', text: I18n.t('addresses.form.country')
        element :country_input, 'select#country'
        element :phone_label, 'label.phone-label', text: I18n.t('addresses.form.phone')
        element :phone_input, 'input#phone'
        element :submit_button, 'input.submit-btn'
        element :error_message, '.error.text-danger'
      end

      def create_new_address(form, params)
        set_private_information(form, params)
        set_location_information(form, params)
        form.submit_button.click
      end

      private

      def set_private_information(form, params)
        form.first_name_input.set(params[:first_name])
        form.last_name_input.set(params[:last_name])
        form.phone_input.set(params[:phone])
      end

      def set_location_information(form, params)
        form.city_input.set(params[:city])
        form.address_input.set(params[:address])
        form.zip_input.set(params[:zip])
        form.country_input.select(country_name(params[:country_code]))
      end

      def country_name(country_code)
        country = ISO3166::Country[country_code]
        country.translations[I18n.locale.to_s] || country.name
      end
    end
  end
end
