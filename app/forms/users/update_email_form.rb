# frozen_string_literal: true

module Users
  class UpdateEmailForm
    include ActiveModel::Model
    include Virtus.model

    EMAIL_FORMAT = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/.freeze

    attribute :email, String

    validates :email, format: { with: EMAIL_FORMAT }
    validates :email, presence: true

    def initialize(params = {})
      @user = User.find(params[:id])
      self[:email] = params[:email].nil? ? @user.email : params[:email]
    end

    def update
      return false if invalid?

      persist!
      true
    end

    private

    def persist!
      @user.update_without_password(email: email)
      @user.save!(validate: false)
    end
  end
end
