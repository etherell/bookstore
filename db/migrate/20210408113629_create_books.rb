class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, unique: true
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.monetize :price

      t.timestamps
    end
  end
end
