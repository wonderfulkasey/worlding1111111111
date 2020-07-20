class UsersController < ApplicationController

    def show
    @user = User.find_by(id: params[:id])
    @worlds = @user.worlds
    @characters = @user.characters
    end

end