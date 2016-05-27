class CreatePvs < ActiveRecord::Migration
  def change
    create_table :pvs do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
