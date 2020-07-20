class UsersController < ApplicationController

    def show
        @user = User.find_by(id :params[:id])
        @worlds = @user.worlds.reverse
        @characters = @user.characters.reverse
    end

end 