import React, { useState } from 'react';

function IngredientsForm() {
  const [ingredients, setIngredients] = useState(['']);
  const [recipes, setRecipes] = useState([]);

  const handleIngredientChange = (index, event) => {
    const newIngredients = [...ingredients];
    newIngredients[index] = event.target.value;
    setIngredients(newIngredients);
  };

  const addIngredientField = () => {
    setIngredients([...ingredients, '']);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    let queryParams = ingredients
      .filter(ingredient => ingredient.trim() !== '')
      .map(ingredient => `ingredients[]=${encodeURIComponent(ingredient)}`)
      .join('&');

    const apiUrl = `api/v1/recipes/search?${queryParams}`;

    try {
      const response = await fetch(apiUrl, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      setRecipes(data);
    } catch (error) {
      console.error('Request failed:', error);
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <h2>Add Ingredients</h2>
        {ingredients.map((ingredient, index) => (
          <div key={index}>
            <label>
              Ingredient {index + 1}
              <input
                type="text"
                value={ingredient}
                onChange={(event) => handleIngredientChange(index, event)}
              />
            </label>
          </div>
        ))}
        <button type="button" onClick={addIngredientField}>
          Add Another Ingredient
        </button>
        <button type="submit">Submit</button>
      </form>
      <div>
        <h2>Recipes</h2>
        {recipes.map((recipe) => (
          <div key={recipe.id}>
            <h3>Name: {recipe.title}</h3>
            <p>Vegan: {recipe.vegan ? 'Yes' : 'No'}</p>
            <p>Gluten Free: {recipe.gluten_free ? 'Yes' : 'No'}</p>
            <p>Instructions: {recipe.instructions}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default IngredientsForm;
