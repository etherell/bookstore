# frozen_string_literal: true

RSpec.describe Users::OmniauthCallbacksController do
  let(:user) { create(:user) }
  let(:auth) { OmniAuth::AuthHash.new({ provider: :facebook, uid: '12345', info: info }) }
  let(:info) { { email: 'email@gmail.com' } }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user] # rubocop:disable RSpec/InstanceVariable
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = auth
  end

  describe '#facebook' do
    context 'when login successful' do
      before do
        allow(User).to receive(:from_omniauth).and_return(user)
        get :facebook
      end

      it 'authenticate user' do
        expect(warden).to be_authenticated(:user)
      end

      it 'set current_user' do
        expect(controller.current_user).not_to be_nil
      end

      it 'redirect to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
