class AddNameToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :name, :string, null: false
  end
end
