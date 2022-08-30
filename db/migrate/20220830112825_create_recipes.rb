class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, default: "", index: true
      t.time :preparation_time
      t.time :cooking_time
      t.text :description
      t.boolean :public, default: true
      t.belongs_to :user, index: true, foreign_key: true, counter_cache: true

      t.timestamps
    end
  end
end
