# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :find_categories
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :set_js_flash, if: -> { flash.present? }

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    nil
  end

  private

  def user_not_authorized
    flash[:error] = I18n.t('application.errors.not_authorized')
    redirect_to(request.referer || root_path)
  end

  def find_categories
    @categories = policy_scope(Category).includes(:books)
  end

  def set_js_flash
    gon.flash = flash
  end
end
