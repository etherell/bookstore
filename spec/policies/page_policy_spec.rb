# frozen_string_literal: true

RSpec.describe PagePolicy, type: :policy do
  subject { described_class.new(user) }

  context 'with a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }
  end
end
