class AddUpVotesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :upvotes, :integer, default: 0
  end
end
