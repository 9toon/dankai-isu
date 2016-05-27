class AddIndexToPvs < ActiveRecord::Migration
  def change
    add_index :pvs, [:controller, :action]
  end
end
