class AddColumnToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :booking_number, :integer, default: 0
  end
end
