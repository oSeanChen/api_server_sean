# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApplicationController
      before_action :find_couse, only: %w[show create destroy]
      def index
        @courses = Course.all
      end

      def show; end

      def create
        @course = Course.new(course_params)
      end

      def destroy; end

      private

      def course_params
        params.require(:course).permit(:title, :lecturer, :description)
      end

      def find_course
        @course = Course.find(params[:id])
      end
    end
  end
end
