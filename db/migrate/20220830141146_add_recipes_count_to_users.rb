class AddRecipesCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recipes_count, :integer
  end
end
