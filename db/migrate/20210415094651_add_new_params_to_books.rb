class AddNewParamsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :publication_year, :integer
    add_column :books, :height, :float
    add_column :books, :width, :float
    add_column :books, :depth, :float
  end
end
