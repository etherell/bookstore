# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url '/'

  element :welcome_message, 'h2.h1'
end
