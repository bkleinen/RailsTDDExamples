class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :post
      t.boolean :published
      t.date :published_on

      t.timestamps
    end
  end
end
