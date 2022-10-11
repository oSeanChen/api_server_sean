# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :lecturer, presence: true
  has_many :chapters, -> { order(position: :asc) }
end
