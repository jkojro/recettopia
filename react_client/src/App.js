import React, { useState } from 'react';
import IngredientsForm from './components/IngredientsForm';
import RecipesDisplay from './components/RecipesDisplay';

function App() {
  const [recipes, setRecipes] = useState([]);

  return (
    <div>
      <h1>This is the one and only no-css recipe browser</h1>
      <IngredientsForm setRecipes={setRecipes} />
      <RecipesDisplay recipes={recipes} />
    </div>
  );
}

export default App;
