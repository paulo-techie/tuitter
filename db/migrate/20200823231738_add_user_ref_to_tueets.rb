class AddUserRefToTueets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tueets, :user, null: false, foreign_key: true
  end
end
