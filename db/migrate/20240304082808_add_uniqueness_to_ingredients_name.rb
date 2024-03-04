class AddUniquenessToIngredientsName < ActiveRecord::Migration[7.0]
  def change
    def change
    remove_index :ingredients, :name
    add_index :ingredients, :name, unique: true
  end
  end
end
