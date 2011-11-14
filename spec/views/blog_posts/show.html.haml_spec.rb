require 'spec_helper'

describe "blog_posts/show.html.haml" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "Title",
      :post => "Post",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Post/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
