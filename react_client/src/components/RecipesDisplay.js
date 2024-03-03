import React from 'react';

function RecipesDisplay({ recipes }) {
  return (
    <div>
      <h2>Recipes</h2>
      {recipes.map((recipe) => (
        <div key={recipe.id}>
          <h3>Name: {recipe.title}</h3>
          <h4>No instructions? Figure it out and have fun!</h4>
          <p>Cook time: {recipe.cook_time}</p>
          <p>Preparation time: {recipe.prep_time}</p>
          <p>Ratings: {recipe.ratings}</p>
          <p>Category: {recipe.category}</p>
          <p>Author: {recipe.author}</p>
          <div>
            <h4>Ingredients:</h4>
            <ul>
              {recipe.recipe_ingredients.map((ingredient) => (
                <li key={ingredient.id}>{ingredient.name}</li>
              ))}
            </ul>
          </div>
          <img src={recipe.image} alt={recipe.title} style={{ maxWidth: '100%' }} />
        </div>
      ))}
    </div>
  );
}

export default RecipesDisplay;
