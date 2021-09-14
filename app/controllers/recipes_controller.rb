class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit]
    def index
        @recipe = Recipe.search(params[:query])
        render 'index'
    end

    def show
    end

    def new
        @recipe = Recipe.new 
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end
    end

    def edit
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name)
    end
end
