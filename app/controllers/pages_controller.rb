# frozen_string_literal: true

class PagesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    authorize :page, :index?
  end
end
