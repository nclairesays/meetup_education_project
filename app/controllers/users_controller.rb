class UsersController < ApplicationController
    before_action :define_selected_user

    skip_before_action :authenticate, only: [ :create ]

    def organizers
        # organizerUser = UserEvent.select {
        #      |x| x.user_id === params[:id]
        #  }
        #  arrayOfEventsId = organizerUser.map{|e| e.event_id}
        #  list = arrayOfEventsId.map{|e| Event.all.select{|s| s.id === e}}
        render json: [UserEvent.all, Event.all]
        
     end

     def attending
        render json: [UserArrangement.all, Event.all]

     end
     
    def create
        user = User.create(user_params)
        render json: user, methods: [ :token ]
    end
    
    def index
        render json: User.all
    end
    
    def show
        render json: selected_user
    end
    
    def update
        selected_user.update(user_params)
        render json: selected_user
    end
    
    def destroy
        selected_user.destroy
        render json: selected_user
    end
    
    def user_params
        params.permit(:username, :email, :password, :name, :school)
    end
    
    def define_selected_user
        if params[:id]
            @selected_user = User.find(params[:id])
        else
            @selected_user = User.new
        end
    end
    
    def selected_user
        @selected_user
    end
end