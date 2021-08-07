class AddDescriptionToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :description, :text
  end
end
