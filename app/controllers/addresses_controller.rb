# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :setup_addresses, only: %i[new create]
  before_action :setup_forms, only: %i[new create]

  def new; end

  def create
    @address_form = select_form
    if @address_form.validate(address_params)
      @address_form.save
      flash[:success] = t('.success')
      redirect_to action: :new
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:addresses_create).permit(:first_name, :last_name, :address,
                                             :city, :country_code, :zip, :phone, :type, :user_id)
  end

  def setup_addresses
    @billing_address = BillingAddress.new
    @shipping_address = ShippingAddress.new
    authorize @billing_address
    authorize @shipping_address
  end

  def setup_forms
    @billing_form = Addresses::CreateForm.new(@billing_address)
    @shipping_form = Addresses::CreateForm.new(@shipping_address)
  end

  def select_form
    return @billing_form if address_params[:type] == @billing_form.type

    @shipping_form
  end
end
