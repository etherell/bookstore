# frozen_string_literal: true

RSpec.describe Addresses::CreateForm, type: :model do
  describe 'validations' do
    subject { described_class.new(BillingAddress.new) }

    let(:max_info_length) { Addresses::CreateForm::MAX_INFORMATION_LENGTH }
    let(:only_letters) { FFaker::Lorem.word }
    let(:valid_address) { FFaker::Address.street_address }
    let(:valid_zip) { FFaker::AddressUS.zip_code }
    let(:valid_number) { FFaker::PhoneNumberAU.international_mobile_phone_number }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country_code) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(max_info_length) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(max_info_length) }
    it { is_expected.to validate_length_of(:city).is_at_most(max_info_length) }
    it { is_expected.to validate_length_of(:country_code).is_at_most(max_info_length) }
    it { is_expected.to validate_length_of(:address).is_at_most(max_info_length) }
    it { is_expected.to validate_length_of(:zip).is_at_most(Addresses::CreateForm::MAX_ZIP_LENGTH) }
    it { is_expected.to validate_length_of(:phone).is_at_most(Addresses::CreateForm::PHONE_MAX_LENGTH) }
    it { is_expected.to allow_value(only_letters).for(:first_name) }
    it { is_expected.to allow_value(only_letters).for(:last_name) }
    it { is_expected.to allow_value(only_letters).for(:city) }
    it { is_expected.to allow_value(only_letters).for(:country_code) }
    it { is_expected.to allow_value(valid_zip).for(:zip) }
    it { is_expected.to allow_value(valid_number).for(:phone) }
    it { is_expected.to allow_value(valid_address).for(:address) }
  end
end
