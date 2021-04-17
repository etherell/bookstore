# frozen_string_literal: true

RSpec.describe Author, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:books).class_name('Book') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
