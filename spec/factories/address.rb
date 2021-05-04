# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { FFaker::Lorem.word.capitalize }
    last_name { FFaker::Lorem.word.capitalize }
    address { FFaker::Address.street_address }
    country_code { FFaker::Address.country_code }
    city { FFaker::Lorem.word.capitalize }
    zip { FFaker::AddressUS.zip_code }
    phone { FFaker::PhoneNumberAU.international_mobile_phone_number }
    type { Address::TYPES.values.sample }
    user_id { create(:user).id }

    trait :billing do
      type { Address::TYPES[:billing] }
    end

    trait :shipping do
      type { Address::TYPES[:shipping] }
    end
  end
end
