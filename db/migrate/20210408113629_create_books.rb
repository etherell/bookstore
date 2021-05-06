class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 50
      t.text :description
      t.references :category, null: false, foreign_key: true, on_delete: :cascade
      t.monetize :price
      t.integer :publication_year
      t.float :height
      t.float :width
      t.float :depth
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
