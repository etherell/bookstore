# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[^\s]*\z/.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  validates :email, :password, presence: true
  validates :password, format: { with: PASSWORD_FORMAT, message: I18n.t('errors.messages.password_complexity') }

  after_create :send_welcome_email

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data']) && session['devise.facebook_data']['extra']['raw_info'] && user.email?
        user.email = data['email']
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = SecureRandom.base58(20)
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome_message(self).deliver_now
  end
end
