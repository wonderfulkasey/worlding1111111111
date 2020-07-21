class CharactersController < ApplicationController


    before_action :authenticate_user!
    #before_action :set_character, except: [:index, :new, :create]
    #skip_before_action :verify_authenticity_token, only: [:destroy]
   
    def index
      @characters = Character.all 
     end
  
    def show
        @character = Character.find(params[:id])
    end
  
    def new
      
        if params[:world_id] && !World.exists?(params[:world_id])
            redirect_to worlds_path, alert: "World Not Existing!"
        else  
            @character = Character.new(world_id: params[:world_id])
        end
    end

    def edit
        if params[:world_id]
            w = World.find_by(id: params[:world_id])
            if w.nil?
                redirect_to worlds_path, alert: "World Not Existing!"
            else  
                @character = w.characters.find_by(id: params[:id])
                redirect_to world_characters_path(w), alert: "Character Not Existing!" if @character.nil?
            end
            end
    end
  
    def create
      @character = Character.new(character_params)
      @character.user_id = current_user.id
  
      
        if @character.valid?
            @character.save
            redirect_to character_path(@character)
        
        else
          flash[:errors] = @character.errors.full_messages
          render :new
         end
      end
  
    def update
      @character.update(character_params)
       if @character.save  
        redirect_to @character
      else
         flash[:errors] = @character.errors.full_messages
         render :edit
    end
      end
  
   
    def destroy
      @character.destroy
      redirect_to characters_path 
  end
  
    private
     
  
     def character_params
        params.require(:character).permit(:name, :character_class, :alignment, :species, :world_id)
      end

end
