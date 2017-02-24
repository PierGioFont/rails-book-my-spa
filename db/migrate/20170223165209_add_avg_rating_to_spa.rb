class AddAvgRatingToSpa < ActiveRecord::Migration[5.0]
  def change
    add_column :spas, :avg_rating, :float
  end
end
