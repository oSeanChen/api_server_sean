# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course
end
