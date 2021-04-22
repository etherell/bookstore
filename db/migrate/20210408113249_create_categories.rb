class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, unique: true, limit: 50
      t.integer :books_count, default: 0

      t.timestamps
    end
  end
end
