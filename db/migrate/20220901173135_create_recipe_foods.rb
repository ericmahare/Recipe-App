class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.belongs_to :recipe, index: true, foreign_key: true, null: false
      t.belongs_to :food, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
