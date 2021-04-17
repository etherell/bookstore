# frozen_string_literal: true

RSpec.shared_context 'with random and category books' do
  let(:random_books_amount) { 5 }
  let(:category_books_amount) { 3 }
  let(:category) { create(:category) }
  let(:random_books) { create_list(:book, random_books_amount) }
  let(:category_books) { create_list(:book, category_books_amount, category: category) }

  before do
    category
    random_books
    category_books
  end
end

RSpec.shared_context 'with second page books' do
  let(:second_page_books_amount) { 6 }
  let(:total_books_amount) { category_books_amount + random_books_amount + second_page_books_amount }
  let(:second_page_books) { create_list(:book, second_page_books_amount) }
end
