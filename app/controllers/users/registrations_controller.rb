# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :find_user, only: %i[update_email edit update]
    before_action :setup_email_form, only: %i[edit update]

    def update_email
      @update_email_form = Users::UpdateEmailForm.new(update_email_form_params)
      if @update_email_form.update
        bypass_sign_in(@user)
        flash[:success] = I18n.t('devise.registrations.email_updated')
        redirect_to edit_user_registration_path
      else
        render :edit
      end
    end

    private

    def update_email_form_params
      params.require(:users_update_email_form).permit(:email, :id)
    end

    def after_update_path_for(_resource)
      edit_user_registration_path
    end

    def setup_email_form
      @update_email_form = Users::UpdateEmailForm.new(id: @user.id)
    end

    def find_user
      @user = current_user
    end
  end
end
