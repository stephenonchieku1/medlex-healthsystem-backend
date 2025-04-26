module Api
  class EnrollmentsController < ApplicationController
    before_action :set_enrollment, only: [:show, :update]

    def create
      @enrollment = Enrollment.new(enrollment_params)

      if @enrollment.save
        render json: @enrollment, status: :created
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @enrollment
    end

    def update
      if @enrollment.update(enrollment_params)
        render json: @enrollment
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
    end

    private

    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(
        :client_id,
        :health_program_id,
        :enrollment_date,
        :status
      )
    end
  end
end 