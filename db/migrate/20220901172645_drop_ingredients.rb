class DropIngredients < ActiveRecord::Migration[6.1]
  def change
    drop_table :ingredients
  end
end
