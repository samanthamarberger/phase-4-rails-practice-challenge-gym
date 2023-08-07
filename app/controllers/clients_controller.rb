class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        clients = Client.all 
        render json: clients, status: :ok
    end

    def show
        client = Client.find(param[:id])
        render json: client, status: :ok
    end

    private 

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end
