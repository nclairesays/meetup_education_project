class EventsController < ApplicationController
    before_action :define_current_event

    skip_before_action :authenticate, only: [ :create ]

    def create
        event = Event.create(event_params)
        render json: event, methods: [ :token ]
    end

    def index
        render json: Event.all
    end

    def show 
        render json: current_event
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
        params.permit(:date, :title, :description, :location, :type)
    end

end