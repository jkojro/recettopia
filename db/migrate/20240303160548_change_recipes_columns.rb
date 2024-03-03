class ChangeRecipesColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :cook_time, :integer
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :ratings, :float
    add_column :recipes, :cuisine, :string
    add_column :recipes, :category, :string
    add_column :recipes, :author, :string
    add_column :recipes, :image, :string

    remove_column :recipes, :instructions, :text
    remove_column :recipes, :vegan, :boolean
    remove_column :recipes, :gluten_free, :boolean

    add_index :recipes, :ratings
    add_index :recipes, :cook_time
  end
end
