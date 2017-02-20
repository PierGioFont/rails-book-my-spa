class CreateSpas < ActiveRecord::Migration[5.0]
  def change
    enable_extension "hstore"
    create_table :spas do |t|
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :description
      t.string :name
      t.references :user, foreign_key: true
      t.hstore :amenities, default: '', null: false

      t.timestamps
    end
  end
end
