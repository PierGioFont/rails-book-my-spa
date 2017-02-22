class ChangeTimeInFromBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :time_in, :time
  end
end
