module Api
  module V1
    class EventsController < ApplicationController
      before_action :authorize_request, except: [:index, :show]
      before_action :set_event, only: [:show, :update, :destroy]
      before_action :authenticate_user!, except: [:index, :show]
      before_action :authorize_user!, only: [:update, :destroy]

      # GET /api/v1/events
      def index
        @events = Event.page(params[:page]).per(10)
        render json: {
          events: @events,
          meta: {
            current_page: @events.current_page,
            total_pages: @events.total_pages,
            total_count: @events.total_count
          }
        }
      end

      # GET /api/v1/events/:id
      def show
        render json: @event
      end

      # POST /api/v1/events
      def create
        @event = @current_user.events.new(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/events/:id
      def update
        if @event.update(event_params)
          render json: @event
        else
          render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/events/:id
      def destroy
        @event.destroy
        head :no_content
      end


      private

      def set_event
        @event = Event.find_by(id: params[:id])
        render json: { error: "Event not found" }, status: :not_found unless @event
      end

      def authorize_user!
        unless @event.user == current_user
          render json: { error: "Unauthorized" }, status: :unauthorized
        end
      end

      def event_params
        params.require(:event).permit(:title, :description, :date, :location)
      end
    end
  end
end
