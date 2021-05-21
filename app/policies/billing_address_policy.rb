# frozen_string_literal: true

class BillingAddressPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.billing_addresses
    end
  end

  def create?
    user
  end

  def new?
    create?
  end
end
