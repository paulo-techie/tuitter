class AddFollowerIdToFollows < ActiveRecord::Migration[6.0]
  def change
    add_column :follows, :follower_id, :integer
  end
end
