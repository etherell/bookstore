# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :setup_forms, only: %i[new create]

  def new; end

  def create
    @address_form = select_form
    if @address_form.validate(address_params)
      @address_form.save
      flash[:success] = t('.success')
      redirect_to action: :new
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:addresses_create).permit(:first_name, :last_name, :address,
                                             :city, :country_code, :zip, :phone, :type, :user_id)
  end

  def setup_forms
    @billing_form = Addresses::CreateForm.new(BillingAddress.new)
    @shipping_form = Addresses::CreateForm.new(ShippingAddress.new)
  end

  def select_form
    return @billing_form if address_params[:type] == @billing_form.type

    @shipping_form
  end
end
