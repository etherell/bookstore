# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :find_categories

  private

  def find_categories
    @categories = Category.all
  end
end
