# frozen_string_literal: true

class Course < ApplicationRecord
  # after_create :create_chapter
  validates :title, presence: true
  validates :lecturer, presence: true

  has_many :chapters, -> { order(position: :asc) }

  private

  def create_chapter; end
end
