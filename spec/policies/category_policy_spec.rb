# frozen_string_literal: true

RSpec.describe CategoryPolicy, type: :policy do
  subject { described_class.new(user, category) }

  let(:resolved_scope) { described_class::Scope.new(user, Category.all).resolve }
  let(:category) { create(:category) }

  context 'with a visitor' do
    let(:user) { nil }

    it 'includes book in resolved scope' do
      expect(resolved_scope).to include(category)
    end
  end
end
