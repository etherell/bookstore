# frozen_string_literal: true

RSpec.describe 'Addresses' do
  describe '#new' do
    let(:new_address_page) { Pages::Addresses::New.new }
    let(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
      new_address_page.load
    end

    context 'when all elements on billing form present' do
      let(:form) { new_address_page.billing_form }

      it_behaves_like 'an address form with all inputs'
    end

    context 'when all elements on shipping form present' do
      let(:form) { new_address_page.shipping_form }

      it_behaves_like 'an address form with all inputs'
    end

    context 'when all page elements present' do
      it { expect(new_address_page).to have_page_title }
      it { expect(new_address_page).to have_address_tab }
      it { expect(new_address_page).to have_privacy_tab }
      it { expect(new_address_page).to have_billing_title }
      it { expect(new_address_page).to have_shipping_title }
    end

    context 'when billing form successfully submitted' do
      let(:form) { new_address_page.billing_form }
      let(:address_type) { BillingAddress }

      it_behaves_like 'a submitted form with success result'
    end

    context 'when shipping form successfully submitted' do
      let(:form) { new_address_page.shipping_form }
      let(:address_type) { ShippingAddress }

      it_behaves_like 'a submitted form with success result'
    end

    context 'when billing form submitted with invalid first name' do
      let(:form) { new_address_page.billing_form }
      let(:params) { attributes_for(:address, :with_invalid_first_name) }
      let(:error_message) { 'First name allows only letters' }

      it_behaves_like 'a submitted form with error'
    end

    context 'when billing form submitted with invalid zip' do
      let(:form) { new_address_page.billing_form }
      let(:params) { attributes_for(:address, :with_long_zip) }
      let(:error_message) { 'Zip is too long (maximum is 10 characters)' }

      it_behaves_like 'a submitted form with error'
    end

    context 'when shipping form submitted with invalid first name' do
      let(:form) { new_address_page.shipping_form }
      let(:params) { attributes_for(:address, :with_invalid_first_name) }
      let(:error_message) { 'First name allows only letters' }

      it_behaves_like 'a submitted form with error'
    end

    context 'when shipping form submitted with invalid zip' do
      let(:form) { new_address_page.shipping_form }
      let(:params) { attributes_for(:address, :with_long_zip) }
      let(:error_message) { 'Zip is too long (maximum is 10 characters)' }

      it_behaves_like 'a submitted form with error'
    end
  end
end
