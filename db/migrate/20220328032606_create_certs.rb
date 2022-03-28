class CreateCerts < ActiveRecord::Migration[7.0]
  def change
    create_table :certs do |t|
      t.string :title
      t.datetime :date_awarded

      t.timestamps
    end
  end
end
