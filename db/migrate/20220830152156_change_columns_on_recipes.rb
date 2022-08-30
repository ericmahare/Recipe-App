class ChangeColumnsOnRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :recipes do |t|
      t.remove :preparation_time, :cooking_time
      t.integer :preparation_time
      t.integer :cooking_time
    end
  end
end
