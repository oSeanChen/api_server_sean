class RemoveOrderFromUnits < ActiveRecord::Migration[6.1]
  def change
    remove_column :units, :order, :integer
  end
end
