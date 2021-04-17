# frozen_string_literal: true

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:books).class_name('Book') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
