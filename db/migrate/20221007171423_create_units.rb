# frozen_string_literal: true

class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :order
      t.belongs_to :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
