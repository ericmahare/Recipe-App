class AddUserRefToFoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :foods, :user, null: false, foreign_key: true
  end
end
