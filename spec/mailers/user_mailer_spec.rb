# frozen_string_literal: true

RSpec.describe UserMailer do
  describe '#welcome_message' do
    let(:user) { create(:user) }
    let(:send_welcome_email) { described_class.welcome_message(user) }

    it 'sends email with apropriate subject' do
      expect(send_welcome_email.subject).to eq(I18n.t('user_mailer.welcome_message.subject'))
    end

    it 'sends email to apropriate user' do
      expect(send_welcome_email.to).to eq([user.email])
    end

    it 'renders the apropriate email view' do
      expect(send_welcome_email.body.encoded).to match(I18n.t('user_mailer.welcome_message.message'))
    end
  end
end
