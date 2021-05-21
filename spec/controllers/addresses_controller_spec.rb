# frozen_string_literal: true

RSpec.describe AddressesController do
  login_user
  let(:user) { controller.current_user }

  describe '#new' do
    context 'when success request' do
      before { get :new }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:new) }
    end
  end

  describe '#create' do
    let(:create_request) { post :create, params: { addresses_create: address_params } }

    before do |test|
      create_request unless test.metadata[:skip_before]
    end

    context 'when address created' do
      let(:address_params) { attributes_for(:shipping_address, user_id: user.id) }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(action: :new) }
      it { is_expected.to set_flash[:success].to(I18n.t('addresses.create.success')) }

      it 'creates new address', skip_before: true do
        expect { create_request }.to change(Address, :count).by(1)
      end
    end

    context 'when params not valid' do
      let(:address_params) { attributes_for(:shipping_address, user_id: nil) }

      it { is_expected.to respond_with(422) }
      it { is_expected.to render_template(:new) }

      it 'creates new address', skip_before: true do
        expect { create_request }.not_to change(Address, :count)
      end
    end
  end
end
