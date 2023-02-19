class ActivitiesController < ApplicationController
    # GET /activities
    def index
        activities = Activity.all
        render json: activities
      end
    #   DELETE /activities/:id
    def destroy
        activity = Activity.find(params[:id])
        if activity
            activity.destroy
            head :no_content 
        else
            render json: { error: "Activity not found" }, status: :not_found
        end
    end

end
