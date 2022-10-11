# frozen_string_literal: true

module Api
  module V1
    class ChaptersController < ApplicationController
      before_action :find_chapter, only: %w[show update destroy]

      def index
        @chapters = Chapter.all
        render json: @chapters, status: 200
      end

      def create
        @chapter = Chapter.new(params_chapter)
        if @chapter.save
          render json: @chapter, status: 200
        else
          render json: { error: '章節建立失敗' }, status: 404
        end
      end

      def show
        render json: @chapter, status: 200
      rescue StandardError
        render json: { error: '找不到章節' }, status: 404
      end

      def update
        if @chapter.update(chapter_params)
          render json: @chapter, status: 200
        else
          render json: { error: '章節更新失敗' }, status: 404
        end
      end

      def destroy
        @chapter.destroy
      end

      private

      def params_chapter
        params.require(:chapter).permit(:title, :position).merge(course_id: Chapter.course.id)
      end

      def find_chapter
        @chapter = Chapter.find(params[:id])
      end
    end
  end
end
