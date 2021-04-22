# frozen_string_literal: true

module Pages
  module Books
    class Index < SitePrism::Page
      set_url '/books{?query*}'

      section :book, '.book-container' do
        element :show_link, '.show-link'
        element :buy_link, '.buy-link'
        element :section_title, '.general-thumb-info .title'
        element :price, '.general-thumb-info .price'
        element :authors, '.general-thumb-info .price'
      end

      element :page_title, 'h1.general-title-margin', text: I18n.t('books.index.title')
      element :load_more_button, '.load-more'
      elements :filters, '.filter-link.custom-filter'
      elements :books, '.book-container'
      elements :sorting_dropdowns, '.sorting-dropdown'
      elements :sorting_options, '.sorting-menu a'
    end
  end
end
