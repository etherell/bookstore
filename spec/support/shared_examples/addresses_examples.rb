# frozen_string_literal: true

RSpec.shared_examples 'an address form with all inputs' do
  it { expect(form).to have_first_name_label }
  it { expect(form).to have_first_name_input }
  it { expect(form).to have_last_name_label }
  it { expect(form).to have_last_name_input }
  it { expect(form).to have_address_label }
  it { expect(form).to have_address_input }
  it { expect(form).to have_city_label }
  it { expect(form).to have_city_input }
  it { expect(form).to have_zip_label }
  it { expect(form).to have_zip_input }
  it { expect(form).to have_country_label }
  it { expect(form).to have_country_input }
  it { expect(form).to have_phone_label }
  it { expect(form).to have_phone_input }
  it { expect(form).to have_submit_button }
end

RSpec.shared_examples 'a submitted form with success result' do
  let(:params) { attributes_for(:shipping_address) }
  let(:address) { Address.last }

  before do |test|
    new_address_page.create_new_address(form, params) unless test.metadata[:skip_before]
  end

  it 'creates new address', skip_before: true do
    expect { new_address_page.create_new_address(form, params) }.to change(Address, :count).by(1)
  end

  it 'creates billing address' do
    expect(address).to be_a(address_type)
  end

  it 'creates address with apropriate first name' do
    expect(address.first_name).to eq(params[:first_name])
  end

  it 'creates address with apropriate last name' do
    expect(address.last_name).to eq(params[:last_name])
  end

  it 'creates address with apropriate address' do
    expect(address.address).to eq(params[:address])
  end

  it 'creates address with apropriate city' do
    expect(address.city).to eq(params[:city])
  end

  it 'creates address with apropriate city' do
    expect(address.zip).to eq(params[:zip])
  end

  it 'creates address with apropriate country' do
    expect(address.country_code).to eq(params[:country_code])
  end

  it 'creates address with apropriate phone' do
    expect(address.phone).to eq(params[:phone])
  end
end

RSpec.shared_examples 'a submitted form with error' do
  it 'does not creates new address', skip_before: true do
    expect { new_address_page.create_new_address(form, params) }.not_to change(Address, :count)
  end

  it 'shows error message' do
    new_address_page.create_new_address(form, params)
    expect(form.error_message.text).to eq(error_message)
  end
end
