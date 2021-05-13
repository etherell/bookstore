# frozen_string_literal: true

RSpec.describe ShippingAddressPolicy, type: :policy do
  subject { described_class.new(user, shipping_address) }

  let(:resolved_scope) { described_class::Scope.new(user, ShippingAddress.all).resolve }
  let(:rand_shipping_address) { create(:shipping_address) }

  context 'with a user' do
    let(:user) { create(:user) }
    let(:shipping_address) { create(:shipping_address, user: user) }

    before do
      shipping_address
      rand_shipping_address
    end

    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }

    it 'includes book in resolved scope' do
      expect(resolved_scope).to include(shipping_address)
    end

    it 'not includes book in resolved scope' do
      expect(resolved_scope).not_to include(rand_shipping_address)
    end
  end

  context 'with a visitor' do
    let(:user) { nil }
    let(:shipping_address) { create(:shipping_address) }

    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
  end
end
