class RecipesController < ApplicationController

    def index
        render json: Recipe.all
      end
    
      def create
        user = user = User.find(session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
      end
    
      private
    
      def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
      end
end
