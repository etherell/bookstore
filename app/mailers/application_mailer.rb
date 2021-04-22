# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@etherell-bookstore.com'
  layout 'mailer'
end
