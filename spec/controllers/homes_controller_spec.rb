# frozen_string_literal: true

RSpec.describe HomesController, type: :controller do
  describe '#index' do
    context 'when success request' do
      before { get :index }

      it 'returns successful status' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
