# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  let(:home_page) { HomePage.new }

  context 'when visit page' do
    before { home_page.load }

    it 'has weleome message' do
      expect(home_page.welcome_message.text).to eq(I18n.t('home.index.welcome'))
    end
  end
end
