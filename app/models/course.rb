# frozen_string_literal: true

class Course < ApplicationRecord
  # act as list order chapter by position.
  has_many :chapters, -> { order(position: :asc) }

  validates :title, presence: true
  validates :lecturer, presence: true
end
