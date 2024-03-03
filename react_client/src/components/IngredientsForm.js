import React, { useState } from 'react';

function IngredientsForm({ setRecipes }) {
  const [ingredients, setIngredients] = useState(['']);
  const [cookTime, setCookTime] = useState('');

  const handleIngredientChange = (index, event) => {
    const newIngredients = [...ingredients];
    newIngredients[index] = event.target.value;
    setIngredients(newIngredients);
  };

  const handleCookTimeChange = (event) => {
    const value = event.target.value;
    setCookTime(value);
  };

  const addIngredientField = () => {
    setIngredients([...ingredients, '']);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    if (!Number.isInteger(Number(cookTime)) || cookTime < 0) {
      alert("Cook time must be a positive integer.");
      return;
    }

    let queryParams = ingredients
      .filter(ingredient => ingredient.trim() !== '')
      .map(ingredient => `ingredients[]=${encodeURIComponent(ingredient)}`)
      .join('&');

    if (cookTime) {
      queryParams += `&cook_time=${encodeURIComponent(cookTime)}`;
    }

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

      setIngredients(['']);
      setCookTime('');
    } catch (error) {
      console.error('Request failed:', error);
    }
  };
  return (
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
      <button type="button" onClick={addIngredientField}>Add Another Ingredient</button>
      <div>
        <label>
          I don't want to cook more than (minutes):
          <input
            type="number"
            value={cookTime}
            onChange={handleCookTimeChange}
            min="0"
          />
        </label>
      </div>
      <button type="submit">Submit</button>
    </form>
  );
}

export default IngredientsForm;
