class AddPostTypeIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_type_id, :integer
  end
end
