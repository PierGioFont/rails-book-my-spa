class ChangeContentToTextFromBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :content, :text
  end
end
