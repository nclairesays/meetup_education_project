class EventsController < ApplicationController

    before_action :define_current_event

    def create
        event = Event.create(event_params)
        
        event.organizers << current_user
        # event.attendees << current_user
        event.save
        render json: event
    end

    # redirect_to???

    def create_attendee
        
        current_event.attendees << current_user
        # event.attendees << current_user
        # event.save
        render json: current_event
    end

    
    def index
        render json: Event.all
    end

    def show 
        showevent = Event.all.find(params[:id])
            
        render json: showevent
    end

    def update
        current_event.update(event_params)
        render json: current_event
    end

    def destroy
        current_event.destroy
        render json: current_event
    end

    def define_current_event
        if params[:id]
            @current_event = Event.find(params[:id])
        else
            @current_event = Event.new
        end
    end

    def current_event
        @current_event
    end

    def event_params
        params.require(:event).permit(:date, :title, :description, :location, :type)
    end

end
