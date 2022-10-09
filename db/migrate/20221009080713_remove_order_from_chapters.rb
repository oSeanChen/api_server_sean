class RemoveOrderFromChapters < ActiveRecord::Migration[6.1]
  def change
    remove_column :chapters, :order, :integer
  end
end
