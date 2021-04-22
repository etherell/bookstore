class CreateBookMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :book_materials do |t|
      t.references :material, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
