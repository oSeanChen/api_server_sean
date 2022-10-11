# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :chapter
  acts_as_list scope: :chapter

  validates :title, presence: true
  validates :content, presence: true
end
