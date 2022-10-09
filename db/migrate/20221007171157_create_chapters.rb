# frozen_string_literal: true

class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :order
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
