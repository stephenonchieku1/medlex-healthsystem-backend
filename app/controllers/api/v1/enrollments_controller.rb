module Api
  module V1
    class EnrollmentsController < ApplicationController
      before_action :set_enrollment, only: [:show, :update, :destroy]

      def index
        @enrollments = Enrollment.all.includes(:client, :health_program)
        render json: @enrollments, include: [:client, :health_program]
      end

      def create
        @enrollment = Enrollment.new(enrollment_params)

        if @enrollment.save
          render json: @enrollment, status: :created
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @enrollment, include: [:client, :health_program]
      end

      def update
        if @enrollment.update(enrollment_params)
          render json: @enrollment, include: [:client, :health_program]
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @enrollment.destroy
        head :no_content
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
end 