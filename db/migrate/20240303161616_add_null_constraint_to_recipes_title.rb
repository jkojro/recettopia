class AddNullConstraintToRecipesTitle < ActiveRecord::Migration[7.0]
  def change
    change_column_null :recipes, :title, false
  end
end
