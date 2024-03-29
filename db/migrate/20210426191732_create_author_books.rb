class CreateAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :author_books do |t|
      t.references :author, null: false, foreign_key: true, on_delete: :cascade
      t.references :book, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
