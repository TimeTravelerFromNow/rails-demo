class DropElements < ActiveRecord::Migration[7.0]
  def up 
    drop_table :elements
  end

  def down
    rails ActiveRecord::IrreversibleMigration
  end
end
