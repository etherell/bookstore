# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :find_categories, unless: :active_admin_controller?
  after_action :verify_authorized, except: :index, unless: %i[devise_controller? active_admin_controller?]
  after_action :verify_policy_scoped, only: :index, unless: %i[devise_controller? active_admin_controller?]
  before_action :set_js_flash, if: -> { flash.present? }

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveAdmin::AccessDenied, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = I18n.t('application.errors.not_authorized')
    redirect_to root_path
  end

  def find_categories
    @categories = policy_scope(Category).includes(:books)
  end

  def set_js_flash
    gon.flash = flash
  end

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end
end
