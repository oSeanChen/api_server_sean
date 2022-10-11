class AddPositionToUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :position, :integer
  end
end
