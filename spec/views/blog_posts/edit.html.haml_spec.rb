require 'spec_helper'

describe "blog_posts/edit.html.haml" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "MyString",
      :post => "MyString",
      :published => false
    ))
  end

  it "renders the edit blog_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_posts_path(@blog_post), :method => "post" do
      assert_select "input#blog_post_title", :name => "blog_post[title]"
      assert_select "input#blog_post_post", :name => "blog_post[post]"
      assert_select "input#blog_post_published", :name => "blog_post[published]"
    end
  end
end
