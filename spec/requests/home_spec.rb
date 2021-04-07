# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe '#index' do
    subject(:get_index) { get root_path }

    context 'when success request' do
      before { get_index }

      it 'returns successful status' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
