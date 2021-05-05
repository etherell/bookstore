# frozen_string_literal: true

module Pages
  module Devise
    module Registrations
      class Edit < SitePrism::Page
        set_url '/users/edit'

        element :title, 'h1.general-title-margin', text: I18n.t('partials.settings_menu.title')
        element :address_tab, 'a.address-tab', text: I18n.t('partials.settings_menu.address')
        element :privacy_tab, 'a.privacy-tab', text: I18n.t('partials.settings_menu.privacy')
        element :toaster, '.toast-message'

        section :email_form, '.email-form' do
          element :email_label, 'label.email-label', text: I18n.t('devise.registrations.edit.email_title')
          element :email_input, 'input#email'
          element :error_message, '.error.text-danger'
          element :submit_btn, 'input.btn-default'
        end

        section :password_form, '.password-form' do
          element :current_password_label, 'label.old-password-label',
                  text: I18n.t('devise.registrations.edit.old_password')
          element :current_password_input, 'input#oldPassword'
          element :new_password_label, 'label.password-label', text: I18n.t('devise.registrations.edit.new_password')
          element :new_password_input, 'input#password'
          element :password_confirmation_label, 'label.confirmation-label',
                  text: I18n.t('devise.registrations.edit.confirm_password')
          element :password_confirmation_input, 'input#confirmPassword'
          element :error_message, '.error.text-danger'
          element :submit_btn, 'input.btn-default'
        end

        section :remove_account_form, '.remove-account-form' do
          element :form_title, 'p.in-gold-500', text: I18n.t('devise.registrations.edit.remove_account')
          element :remove_account_button, 'input.remove-account-btn'
          element :confirmation_checkbox, '.form-group.checkbox'
        end

        def update_user_email(email)
          email_form.email_input.set(email)
          email_form.submit_btn.click
        end

        def update_user_password(old_password, new_password)
          password_form.current_password_input.set(old_password)
          password_form.new_password_input.set(new_password)
          password_form.password_confirmation_input.set(new_password)
          password_form.submit_btn.click
        end

        def remove_account
          remove_account_form.confirmation_checkbox.click
          remove_account_form.remove_account_button.click
        end
      end
    end
  end
end
