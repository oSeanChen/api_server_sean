# frozen_string_literal: true

module Api
  module V1
    class UnitsController < ApplicationController
      before_action :find_unit, only: %w[show update destroy]

      def index
        @units = Unit.all
        render json: @units, status: 200
      end

      def create
        @unit = Unit.new(unit_params)
        if @unit.save
          render json: @unit, status: 200
        else
          render json: { error: '單元建立失敗' }, status: 404
        end
      end

      def show
        render json: @unit, status: 200
      rescue StandardError
        render json: { error: '找不到單元' }, status: 404
      end

      def update
        if @unit.update(unit_params)
          render json: @unit, status: 200
        else
          render json: { error: '單元更新失敗' }, status: 404
        end
      end

      def destroy
        @unit.destroy
      end

      private

      def unit_params
        params.require(:unit).permit(:title, :description, :content, :position).merge(chapter_id: unit.chapter.id)
      end

      def find_unit
        @unit = Unit.find(params[:id])
      end
    end
  end
end
