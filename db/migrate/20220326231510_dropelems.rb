class Dropelems < ActiveRecord::Migration[7.0]
  def up
    drop_table :elems
  end
  def down
    rais ActiveRecord::IrreversibleMigration
  end
end
