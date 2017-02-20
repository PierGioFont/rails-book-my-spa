class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :time_in
      t.datetime :time_out
      t.references :user, foreign_key: true
      t.references :massage, foreign_key: true

      t.timestamps
    end
  end
end
