module Api
  module V1
    class HealthProgramsController < ApplicationController
      before_action :set_health_program, only: [:show, :update, :destroy]

      def index
        @health_programs = HealthProgram.all
        render json: @health_programs
      end

      def show
        render json: @health_program
      end

      def create
        @health_program = HealthProgram.new(health_program_params)

        if @health_program.save
          render json: @health_program, status: :created
        else
          render json: @health_program.errors, status: :unprocessable_entity
        end
      end

      def update
        if @health_program.update(health_program_params)
          render json: @health_program
        else
          render json: @health_program.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @health_program.destroy
        head :no_content
      end

      private

      def set_health_program
        @health_program = HealthProgram.find(params[:id])
      end

      def health_program_params
        params.require(:health_program).permit(:name, :description, :active)
      end
    end
  end
end 