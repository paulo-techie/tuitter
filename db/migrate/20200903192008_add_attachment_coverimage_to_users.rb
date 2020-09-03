class AddAttachmentCoverimageToUsers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :users do |t|
      t.attachment :coverimage
    end
  end

  def self.down
    remove_attachment :users, :coverimage
  end
end
