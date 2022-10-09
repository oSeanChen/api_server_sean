class Api::V1::ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
    render json: @chapters, status: 200
  end

  def create
    @chapter = Chapter.new(params_chapter)
  end

  def update
  end

  def destroy
  end

  private
  def params_chapter
    params.require(:chapter).permit(:title)
  end
end
