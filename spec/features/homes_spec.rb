# frozen_string_literal: true

RSpec.describe 'Homes', type: :feature do
  context 'when visit home page' do
    let(:homes_index_page) { Pages::Homes::Index.new }

    before { homes_index_page.load }

    it 'has all elements' do
      expect(homes_index_page).to be_all_there
    end
  end
end
