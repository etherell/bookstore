# frozen_string_literal: true

class ShippingAddressPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.shipping_addresses
    end
  end

  def create?
    user
  end

  def new?
    create?
  end
end
