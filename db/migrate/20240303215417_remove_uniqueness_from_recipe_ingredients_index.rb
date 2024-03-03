class RemoveUniquenessFromRecipeIngredientsIndex < ActiveRecord::Migration[7.0]
  def up
    remove_index :recipe_ingredients, name: 'index_recipe_ingredients_on_recipe_id_and_ingredient_id'
    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], name: 'index_recipe_ingredients_on_recipe_id_and_ingredient_id'
  end

  def down
    remove_index :recipe_ingredients, name: 'index_recipe_ingredients_on_recipe_id_and_ingredient_id'
    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], unique: true, name: 'index_recipe_ingredients_on_recipe_id_and_ingredient_id'
  end
end
