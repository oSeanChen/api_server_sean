# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :course
  has_many :units, -> { order(position: :asc) }
  # act as list set the scope of position under course.
  acts_as_list scope: :course

  validates :title, presence: true
end
