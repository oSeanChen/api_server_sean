# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApplicationController
      before_action :find_course, only: %w[show create destroy]
      def index
        @courses = Course.all
        render json:@courses, status: 200
      end

      def create
        @course = Course.new(course_params)
        if @couse.save
          render json: @course, status: 200
        else
          rnder json: {error: "課程建立失敗"}
        end

      end
      
      def show
        begin @course
          render json: @course, status: 200
        rescue
          render json: {error: "找不到課程"}
        end
      end

      def update
        if @course.update(course_params)
          render json: @course, status: 200
        else
          render json: {error: "課程更新失敗"}
        end
      end


      def destroy
        @course.destroy
      end

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
