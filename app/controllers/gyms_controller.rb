class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        gyms = Gym.all 
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find(param[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(param[:id])
        gym.destroy
        head :no_content
    end

    private 

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
