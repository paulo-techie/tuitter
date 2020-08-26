class AddFollowingIdToFollows < ActiveRecord::Migration[6.0]
  def change
    add_column :follows, :following_id, :integer
  end
end
