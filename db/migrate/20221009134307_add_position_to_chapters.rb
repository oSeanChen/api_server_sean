# frozen_string_literal: true

class AddPositionToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :position, :integer
  end
end
