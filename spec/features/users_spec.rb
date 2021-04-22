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
