# frozen_string_literal: true

RSpec.describe Users::RegistrationsController do
  describe '#update_email' do
    login_user
    let(:user) { controller.current_user }
    let(:update_email_request) do
      put :update_email, params: { users_update_email_form: { id: user.id, email: new_email } }
    end

    context 'when update successful' do
      let(:new_email) { FFaker::Internet.free_email }

      before { update_email_request }

      it { is_expected.to respond_with(302) }
      it { is_expected.to redirect_to(action: :edit) }
      it { is_expected.to set_flash[:success].to(I18n.t('devise.registrations.email_updated')) }
      it { is_expected.to use_before_action(:setup_email_form) }

      it 'changes user email' do
        user.reload
        expect(user.email).to eq(new_email)
      end
    end

    context 'when update failed' do
      let(:new_email) { FFaker::Lorem.word }

      before { update_email_request }

      it { is_expected.to respond_with(422) }
      it { is_expected.to render_template(:edit) }
      it { is_expected.to use_before_action(:setup_email_form) }

      it 'does not change user email' do
        user.reload
        expect(user.email).not_to eq(new_email)
      end
    end
  end
end
