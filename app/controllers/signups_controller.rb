class SignupsController < ApplicationController
    # POST /signups
    def create
        signup = Signup.create!(signup_params)
        if signup
        render json: signup.activity, status: :created
        else
            render json: { errors: "validation errors"} 
        end
      end

      private

      def signup_params
        params.permit(:time, :camper_id, :activity_id)
      end
end
