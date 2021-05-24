# frozen_string_literal: true

FactoryBot.define do
  factory :billing_address do
    first_name { FFaker::Lorem.word.capitalize }
    last_name { FFaker::Lorem.word.capitalize }
    address { FFaker::Lorem.word.capitalize }
    country_code { FFaker::Address.country_code }
    city { FFaker::Lorem.word.capitalize }
    zip { FFaker::AddressUS.zip_code }
    phone { FFaker::PhoneNumberAU.international_mobile_phone_number }
    user_id { create(:user).id }

    trait :with_invalid_first_name do
      first_name { FFaker::PhoneNumberAU.international_mobile_phone_number }
    end

    trait :with_long_zip do
      zip { FFaker::Lorem.characters }
    end
  end
end
