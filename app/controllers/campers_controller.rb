class CampersController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # GET /campers
    def index
        campers = Camper.all
        render json: campers
      end
    #   GET /campers/:id
    def show
        camper = Camper.find_by(id: params[:id])
        if camper
          render json: camper , include: :activities
        else
          render json: { error: "Camper not found" }, status: :not_found
        end
      end
    #   POST /campers
    def create
        camper = Camper.create(params.permit(:name, :age))
        if camper
        render json: camper, status: :created
        else
            render json: { error: "validation errors" }
        end
      end

    #   private
    #   def camper_params

end
