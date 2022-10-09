# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :lecturer, presence: true
  # after_create :method

  private
  def 建立後建立章節
  end
end
