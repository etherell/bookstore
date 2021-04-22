# frozen_string_literal: true

RSpec.describe 'Pages' do
  describe '#index' do
    let(:pages_index_page) { Pages::Pages::Index.new }
    let(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
      pages_index_page.load
    end

    context 'when header elements present' do
      let(:header) { pages_index_page.header }

      it { expect(header).to have_brand }
      it { expect(header).to have_home_link }
      it { expect(header).to have_shop_link }
      it { expect(header).to have_my_account_link }
      it { expect(header).to have_log_out_link }
    end

    context 'when footer elements present' do
      let(:footer) { pages_index_page.footer }

      it { expect(footer).to have_home_link }
      it { expect(footer).to have_shop_link }
      it { expect(footer).to have_orders_link }
      it { expect(footer).to have_settings_link }
    end

    context 'when page elements present' do
      it { expect(pages_index_page).to have_welcome_message }
      it { expect(pages_index_page).to have_description }
      it { expect(pages_index_page).to have_get_started_button }
      it { expect(pages_index_page).to have_best_sellers }
    end
  end
end
