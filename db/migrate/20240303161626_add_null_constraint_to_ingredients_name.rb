class AddNullConstraintToIngredientsName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :ingredients, :name, false
  end
end
