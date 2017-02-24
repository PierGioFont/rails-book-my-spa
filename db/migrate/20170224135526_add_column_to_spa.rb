class AddColumnToSpa < ActiveRecord::Migration[5.0]
  def change
    add_column :spas, :booking_number, :integer, default: 0
  end
end
