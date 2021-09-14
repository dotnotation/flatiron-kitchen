class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit]
    def index
        @ingredients = Ingredient.search(params[:query])
        render 'index'
    end

    def show
    end

    def new
        @ingredient = Ingredient.new 
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            redirect_to @ingredient
        else
            render 'new'
        end
    end

    def edit
    end

    private

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
