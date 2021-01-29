class CreateSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :selects do |t|
      t.string :genre

      t.timestamps
    end
  end
end
