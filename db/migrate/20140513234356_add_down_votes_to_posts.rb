class AddDownVotesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :downvotes, :integer, default: 0
  end
end
