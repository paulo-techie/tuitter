class CreateTueets < ActiveRecord::Migration[6.0]
  def change
    create_table :tueets do |t|
      t.text :tueet

      t.timestamps
    end
  end
end
