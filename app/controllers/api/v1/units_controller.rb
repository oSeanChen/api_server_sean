class Api::V1::UnitsController < ApplicationController
   before_action :find_unit, only: %w[show update destroy]

      def index
        @units = Unit.all
        render json: @units, status: 200
      end

      def create
        @unit = Unit.new(params_unit)
        if @unit.save
          render json: @unit, status: 200
        else
          render json: { error: '章節建立失敗' }
        end
      end

      def show
        render json: @unit, status: 200
      rescue StandardError
        render json: { error: '找不到章節' }
      end

      def update
        if @unit.update(unit_params)
          render json: @unit, status: 200
        else
          render json: { error: '章節更新失敗' }
        end
      end

      def destroy
        @unit.destroy
      end

      private

      def params_unit
        params.require(:unit).permit(:title, :description, :content, :position).merge(course_id: unit.course.id)
      end

      def find_unit
        @unit = Unit.find(params[:id])
      end
    end
  end
end


end
