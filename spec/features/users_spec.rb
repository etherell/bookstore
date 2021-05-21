# frozen_string_literal: true

RSpec.describe 'Users', type: :feature do
  describe 'registrations#new' do
    let(:new_registrations_page) { Pages::Devise::Registrations::New.new }
    let(:email) { 'valera@gmail.com' }
    let(:password) { 'Supersecret1' }

    before { new_registrations_page.load }

    context 'when checks page elements' do
      it { expect(new_registrations_page).to have_log_in_link }
      it { expect(new_registrations_page).to have_account_question }
      it { expect(new_registrations_page).to have_page_title }
    end

    context 'when checks form elements' do
      let(:sign_up_form) { new_registrations_page.form }

      it { expect(sign_up_form).to have_email_label }
      it { expect(sign_up_form).to have_email_input }
      it { expect(sign_up_form).to have_password_label }
      it { expect(sign_up_form).to have_password_input }
      it { expect(sign_up_form).to have_confirmation_label }
      it { expect(sign_up_form).to have_confirmation_input }
      it { expect(sign_up_form).to have_remember_me_checkbox }
      it { expect(sign_up_form).to have_submit_button }
    end

    context 'when user registers successfuly' do
      let(:sign_up_user) { new_registrations_page.sign_up_user(email, password) }
      let(:success_flash_message) { 'Welcome! You have signed up successfully.' }

      it 'creates new user' do
        expect { sign_up_user }.to change(User, :count).by(1)
      end

      it 'creates user with apropriate email' do
        sign_up_user
        created_user = User.last
        expect(created_user.email).to eq(email)
      end

      it 'redirects to root path' do
        sign_up_user
        expect(page).to have_current_path(root_path)
      end

      it 'show success toaster', js: true do
        sign_up_user
        expect(new_registrations_page.toaster.text).to eq(success_flash_message)
      end
    end

    context 'when not valid confirmation' do
      let(:sign_up_form) { new_registrations_page.form }
      let(:error_message) { "Password confirmation doesn't match Password" }

      it 'shows error message' do
        new_registrations_page.sign_up_user(email, password, "#{password}1")
        expect(sign_up_form.error_message.text).to eq(error_message)
      end
    end

    context 'when email exists' do
      let(:sign_up_form) { new_registrations_page.form }
      let(:error_message) { 'Email has already been taken' }

      it 'shows error message' do
        create(:user, email: email)
        new_registrations_page.sign_up_user(email, password)
        expect(sign_up_form.error_message.text).to eq(error_message)
      end
    end
  end

  describe 'registrations#edit' do
    let(:edit_registrations_page) { Pages::Devise::Registrations::Edit.new }

    before do
      login_as(user, scope: :user)
      edit_registrations_page.load
    end

    context 'with all email form elements' do
      let(:user) { create(:user) }
      let(:email_update_form) { edit_registrations_page.email_form }

      it { expect(email_update_form).to have_email_label }
      it { expect(email_update_form).to have_email_input }
      it { expect(email_update_form).to have_submit_btn }
    end

    context 'with all password form elements' do
      let(:user) { create(:user) }
      let(:password_form) { edit_registrations_page.password_form }

      it { expect(password_form).to have_current_password_label }
      it { expect(password_form).to have_current_password_input }
      it { expect(password_form).to have_new_password_label }
      it { expect(password_form).to have_new_password_input }
      it { expect(password_form).to have_password_confirmation_label }
      it { expect(password_form).to have_password_confirmation_input }
      it { expect(password_form).to have_submit_btn }
    end

    context 'with all remove account form elements' do
      let(:user) { create(:user) }
      let(:remove_account_form) { edit_registrations_page.remove_account_form }

      it { expect(remove_account_form).to have_form_title }
      it { expect(remove_account_form).to have_remove_account_button }
      it { expect(remove_account_form).to have_confirmation_checkbox }
    end

    context 'when email successfully changed' do
      let(:email) { 'valera@gmail.com' }
      let(:user) { create(:user, email: email) }
      let(:new_email) { FFaker::Internet.free_email }
      let(:success_flash_message) { I18n.t('devise.registrations.email_updated') }

      before { edit_registrations_page.update_user_email(new_email) }

      it 'updates user email' do
        user.reload
        expect(user.email).to eq(new_email)
      end

      it 'changes old user email' do
        user.reload
        expect(user.email).not_to eq(email)
      end

      it 'shows success flash', js: true do
        expect(edit_registrations_page.toaster.text).to eq(success_flash_message)
      end
    end

    context 'when invalid email submitted' do
      let(:email) { 'valera@gmail.com' }
      let(:user) { create(:user, email: email) }
      let(:new_email) { 'not_valid_email@gmail' }
      let(:error_message) { 'Email is invalid' }

      before { edit_registrations_page.update_user_email(new_email) }

      it 'does not updates user email' do
        user.reload
        expect(user.email).not_to eq(new_email)
      end

      it 'does not changes old user email' do
        user.reload
        expect(user.email).to eq(email)
      end

      it 'shows error message' do
        expect(edit_registrations_page.email_form.error_message.text).to eq(error_message)
      end
    end

    context 'when password successfully changed' do
      let(:password) { 'Supersecret1' }
      let(:user) { create(:user, password: password) }
      let(:new_password) { 'NewValidPassword1' }
      let(:success_flash_message) { I18n.t('devise.registrations.updated') }

      before { edit_registrations_page.update_user_password(password, new_password) }

      it 'updates user email' do
        user.reload
        expect(user).to be_valid_password(new_password)
      end

      it 'changes old user email' do
        user.reload
        expect(user).not_to be_valid_password(password)
      end

      it 'shows success flash', js: true do
        expect(edit_registrations_page.toaster.text).to eq(success_flash_message)
      end
    end

    context 'when password does not changed' do
      let(:password) { 'Supersecret1' }
      let(:user) { create(:user, password: password) }
      let(:new_password) { 'notvalidpassword' }
      let(:error_message) { 'Password not met requirements. Please use: 1 uppercase, 1 lowercase and 1 digit' }

      before { edit_registrations_page.update_user_password(password, new_password) }

      it 'does not updates user email' do
        user.reload
        expect(user).not_to be_valid_password(new_password)
      end

      it 'does not changes old user email' do
        user.reload
        expect(user).to be_valid_password(password)
      end

      it 'shows error message' do
        expect(edit_registrations_page.password_form.error_message.text).to eq(error_message)
      end
    end

    context 'when user deleted' do
      let(:user) { create(:user) }
      let(:delete_user) { edit_registrations_page.remove_account }
      let(:success_flash_message) { I18n.t('devise.registrations.destroyed') }
      let(:remove_user_form) { edit_registrations_page.remove_account_form }

      it 'does deletes user' do
        expect { delete_user }.to change(User, :count).by(-1)
      end

      it 'shows success flash', js: true do
        delete_user
        expect(edit_registrations_page.toaster.text).to eq(success_flash_message)
      end
    end
  end

  describe 'sessions#new' do
    let(:new_sessions_page) { Pages::Devise::Sessions::New.new }

    before { new_sessions_page.load }

    context 'when checks page elements' do
      it { expect(new_sessions_page).to have_page_title }
      it { expect(new_sessions_page).to have_facebook_login_button }
      it { expect(new_sessions_page).to have_account_question }
      it { expect(new_sessions_page).to have_sign_up_link }
    end

    context 'when checks form elements' do
      let(:log_in_form) { new_sessions_page.form }

      it { expect(log_in_form).to have_email_label }
      it { expect(log_in_form).to have_email_input }
      it { expect(log_in_form).to have_password_label }
      it { expect(log_in_form).to have_password_input }
      it { expect(log_in_form).to have_forgot_password }
      it { expect(log_in_form).to have_remember_me_checkbox }
      it { expect(log_in_form).to have_submit_button }
    end

    context 'when user signs in successfuly' do
      let(:user) { create(:user) }
      let(:log_in_user) { new_sessions_page.log_in_user(user.email, user.password) }
      let(:success_flash_message) { 'Signed in successfully.' }

      it 'redirects logged in uset to root' do
        log_in_user
        expect(page).to have_current_path(root_path)
      end

      it 'show success toaster', js: true do
        log_in_user
        expect(new_sessions_page.toaster.text).to eq(success_flash_message)
      end
    end

    context 'when now valid email or password' do
      let(:user) { create(:user) }
      let(:random_email) { 'hello@gmail.com' }
      let(:log_in_user) { new_sessions_page.log_in_user(random_email, user.password) }
      let(:error_message) { 'Invalid Email or password.' }

      it 'shows error flash', js: true do
        log_in_user
        expect(new_sessions_page.toaster.text).to eq(error_message)
      end
    end
  end
end
