class RecipeIngredient < ApplicationController 
    belongs_to :recipe 
    belongs_to :ingredient
end