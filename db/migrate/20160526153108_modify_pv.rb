class ModifyPv < ActiveRecord::Migration
  def change
    remove_column :pvs, :path
    add_column :pvs, :controller, :string
    add_column :pvs, :action, :string
  end
end
