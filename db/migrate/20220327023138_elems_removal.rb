class ElemsRemoval < ActiveRecord::Migration[7.0]
  def up
    drop_table :elems
  end

  def down
    rails ActiveRecord::IrreversibleMigration
  end
end
