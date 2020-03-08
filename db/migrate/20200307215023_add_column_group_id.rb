class AddColumnGroupId < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :group_id
    end
  end
end
