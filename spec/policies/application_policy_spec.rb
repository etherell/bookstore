# frozen_string_literal: true

RSpec.describe ApplicationPolicy, type: :policy do
  subject { described_class.new(user, record) }

  let(:resolved_scope) { described_class::Scope.new(user, Book.all).resolve }
  let(:record) { create(:book) }

  context 'with a visitor' do
    let(:user) { nil }

    it { is_expected.not_to permit_action(:index) }
    it { is_expected.not_to permit_action(:show) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
    it { is_expected.not_to permit_action(:update) }
    it { is_expected.not_to permit_action(:edit) }
    it { is_expected.not_to permit_action(:destroy) }

    it 'includes book in resolved scope' do
      expect(resolved_scope).to include(record)
    end
  end
end
