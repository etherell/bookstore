# frozen_string_literal: true

module Callable
  extend ActiveSupport::Concern

  def call(*args, &block)
    new(*args, &block).call
  end
end
