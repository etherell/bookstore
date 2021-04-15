class CreateBooksMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :books_materials do |t|
      t.references :book, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
    end
  end
end
