class ApplicationController < ActionController::Base

    helper_method :set_character, :set_world

    def home
        if params[:query]
            @characters = Character.search(params[:query])
            @worlds = World.search(params[:query])
        end
    end

    def set_character
        @character = Character.find(params[:id])
    end

    def set_world
        @world = World.find(params[:id])

    end
end
