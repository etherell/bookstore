# frozen_string_literal: true

module Pages
  module Books
    class Show < SitePrism::Page
      set_url '/books{/id}'

      section :book, '.book-container' do
        element :title, '.title-value'
        element :authors, '.authors-value'
        element :price, '.price-value'
        element :description, '.description-value'
        element :publication_year, '.publication-year-value'
        element :dimensions, '.dimesions-value'
        element :materials, '.materials-value'
        element :cart_button, '.cart-btn'
        element :plus_button, '.plus-quantity'
        element :minus_button, '.minus-quantity'
        element :quantity_input, '.quantity-input'
        element :read_more, '.read-more'
      end

      def book_price
        book.price.text.tr('€', '').to_f
      end

      def book_description
        book.description.text
      end

      def books_quantity
        book.quantity_input.value
      end

      def add_book
        book.plus_button.click
      end
    end
  end
end
