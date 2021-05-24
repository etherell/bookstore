# frozen_string_literal: true

RSpec.describe BillingAddressPolicy, type: :policy do
  subject { described_class.new(user, billig_address) }

  let(:resolved_scope) { described_class::Scope.new(user, BillingAddress.all).resolve }
  let(:rand_billing_address) { create(:billing_address) }

  context 'with a user' do
    let(:user) { create(:user) }
    let(:billig_address) { create(:billing_address, user: user) }

    before do
      billig_address
      rand_billing_address
    end

    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }

    it 'includes book in resolved scope' do
      expect(resolved_scope).to include(billig_address)
    end

    it 'not includes book in resolved scope' do
      expect(resolved_scope).not_to include(rand_billing_address)
    end
  end

  context 'with a visitor' do
    let(:user) { nil }
    let(:billig_address) { create(:billing_address) }

    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
  end
end
