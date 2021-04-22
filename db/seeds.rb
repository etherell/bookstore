require 'factory_bot_rails'

ActiveRecord::Base.transaction do
  categories = FactoryBot.create_list(:category, 4)
  25.times { FactoryBot.create(:book, :with_materials, category_id: categories.sample.id) }
end
