class WorldsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_world, except: [:index, :new, :create, :show]

    def index
        @worlds = World.all
      end

      
        def show
          @world = World.find(params[:id])
        end


        def character
            @character = Character.find(params[:character_id])
            render template: 'characters/show'
        end
      
        
        def new
          @world = World.new
        end
      
      
        def create
          @world = World.new(world_params)
          @world.user_id = current_user.id
          if @world.valid?
            @world.save
            redirect_to world_path(@world)
          else  
            flash[:errors] = @world.errors.full_messages
            render :new
        end
        end

       
          def edit
            @user = current_user
            @world = World.find(params[:id])
          end
      
       
        def update
          @user = current_user
          @world.update(world_params)
          if @world.save
            redirect_to @world
          else 
            flash[:errors] = @world.errors.full_messages
            render :edit
          end
        end
      
      
        def destroy
          @world.destroy
          redirect_to worlds_path
        end
      
      
        private
         
        
          def world_params
            params.require(:world).permit(:name, :description, :aesthetic, :big_bad)
          end
      end


