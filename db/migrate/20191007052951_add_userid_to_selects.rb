class AddUseridToSelects < ActiveRecord::Migration[5.2]
  def change
    add_column :selects, :userid, :integer
  end
end
