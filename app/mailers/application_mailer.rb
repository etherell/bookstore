# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'kostyatherell@gmail.com'
  layout 'mailer'
end
