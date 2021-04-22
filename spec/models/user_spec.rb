# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_length_of(:password).is_at_most(128) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth::AuthHash.new({ provider: :facebook, uid: '12345', info: info }) }
    let(:info) { { email: 'email@gmail.com' } }
    let(:created_user) { described_class.last }

    it 'creates new user' do
      expect { described_class.from_omniauth(auth) }.to change(described_class, :count).by(1)
    end

    it 'creates user with apropriate email', user_params_specs: true do
      described_class.from_omniauth(auth)
      expect(created_user.email).to eq(info[:email])
    end
  end
end
