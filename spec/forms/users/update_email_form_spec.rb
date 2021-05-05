# frozen_string_literal: true

RSpec.describe Users::UpdateEmailForm, type: :model do
  describe 'validations' do
    subject { described_class.new(id: user.id) }

    let(:valid_email) { FFaker::Internet.free_email }
    let(:user) { create(:user) }

    it { is_expected.to allow_value(valid_email).for(:email) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
