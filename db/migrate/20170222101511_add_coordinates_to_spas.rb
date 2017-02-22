class AddCoordinatesToSpas < ActiveRecord::Migration[5.0]
  def change
    add_column :spas, :latitude, :float
    add_column :spas, :longitude, :float
  end
end
