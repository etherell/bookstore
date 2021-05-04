# frozen_string_literal: true

module Addresses
  class CreateForm < Reform::Form
    MAX_INFORMATION_LENGTH = 50
    ZIP_MAX_LENGTH = 10
    PHONE_MAX_LENGTH = 15
    INFORMATION_FORMAT = /\A[A-Za-z ]+\z/.freeze
    ADDRESS_FORMAT = /\A[A-Za-z0-9,\-. ]+\z/.freeze
    ZIP_FORMAT = /\A[0-9\-]+\z/.freeze
    PHONE_FORMAT = /\A\+[0-9 ]+\z/.freeze

    property :first_name
    property :last_name
    property :address
    property :city
    property :country_code
    property :zip
    property :phone
    property :type
    property :user_id

    validates :first_name, :last_name, length: { maximum: MAX_INFORMATION_LENGTH }
    validates :address, :city, :country_code, length: { maximum: MAX_INFORMATION_LENGTH }
    validates :zip, length: { maximum: ZIP_MAX_LENGTH }
    validates :phone, length: { maximum: PHONE_MAX_LENGTH }
    validates :first_name, :last_name, format: { with: INFORMATION_FORMAT, message: 'allows only letters' }
    validates :city, :country_code, format: { with: INFORMATION_FORMAT, message: 'allows only letters' }
    validates :address,
              format: { with: ADDRESS_FORMAT, message: 'allows only letters, numbers, hyphens, commas, spaces' }
    validates :zip, format: { with: ZIP_FORMAT, message: 'allows only numbers and hyphens' }
    validates :phone, format: { with: PHONE_FORMAT, message: 'should start with plus and contain only numbers' }
    validates :user_id, presence: true

    private

    def validate_pho; end
  end
end
