class AddDescriptionToDose < ActiveRecord::Migration[5.0]
  def change
    add_column :doses, :description, :text
  end
end
