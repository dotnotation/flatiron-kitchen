class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit]
    before_action :get_ingredients, only: [:new, :edit]

    def index
        @recipe = Recipe.search(params[:query])
        render :index
    end

    def show
    end

    def new
        @recipe = Recipe.new 
    end

    def create
        recipe = Recipe.new(recipe_params)

        if recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @recipe = Recipe.update(recipe_params)

        if @recipe.save
            redirect_to recipes_path
        else
            render :edit
        end
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def get_ingredients
        @ingredients = Ingredient.all
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredients_ids: [])
    end
end
