class WorldsController < ApplicationController

    skip_before_action :authenticate_user!, :only => [:index, :show]

    def index
        @worlds = World.all
      end


      def abc
        @worlds = World.all.sort_by{ |w| w.name }
      end

      def home
      end

      
        def show
          @characters = @world.characters
        end

        def character
            @character = Character.find(params[:character_id])
            render template: 'characters/show'
        end
      
        # GET /worlds/new
        def new
          @world = World.new
        end
      
        # GET /worlds/1/edit
        def edit
        end
      
        # POST /worlds
        # POST /worlds.json
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
      
        # PATCH/PUT /worlds/1
        # PATCH/PUT /worlds/1.json
        def update
          @world.update(world_params)

          if @world.save
            redirect_to @world
          else 
            flash[:errors] = @world.errors.full_messages
            render :edit
          end
        end
      
        # DELETE /worlds/1
        # DELETE /worlds/1.json
        def destroy
          @world.destroy
          redirect_to worlds_path
        end
      
      
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_world
            @world = World.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def world_params
            params.require(:world).permit(:name, :description, :aesthetic, :big_bad, :description)
          end
      end

