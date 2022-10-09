class Api::V1::ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
    render json: @chapters, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end
end
