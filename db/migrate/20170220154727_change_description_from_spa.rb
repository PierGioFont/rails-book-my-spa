class ChangeDescriptionFromSpa < ActiveRecord::Migration[5.0]
  def change
    change_column :spas, :description, :text
  end
end
