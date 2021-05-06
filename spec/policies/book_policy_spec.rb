# frozen_string_literal: true

RSpec.describe BookPolicy, type: :policy do
  subject { described_class.new(user, book) }

  let(:resolved_scope) { described_class::Scope.new(user, Book.all).resolve }
  let(:book) { create(:book) }

  context 'with a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:index) }

    it 'includes book in resolved scope' do
      expect(resolved_scope).to include(book)
    end
  end
end
