class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name, null: false, limit: 50

      t.timestamps
    end
  end
end
