class CreateMassages < ActiveRecord::Migration[5.0]
  def change
    create_table :massages do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :spa, foreign_key: true

      t.timestamps
    end
  end
end
