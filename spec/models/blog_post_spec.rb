require 'spec_helper'

# describe sets the context for your examples.
# context and describe are aliases for readability.
describe BlogPost do
  # "it" finishes the thought of the describe method
  it "should not be published" do
    blog_post = BlogPost.new :title => 'Hello' #, :published =>true
    blog_post.should_not be_published
  end
end

# pending
# this is the auto-generated pending example
describe BlogPost do
  pending "add some examples to (or delete) #{__FILE__}"
end

# if you leave the block off, an example ("it") will be reported as pending
# also works for it
describe BlogPost do
  it "should not be published (pending example)"
end


# pending with a block will not fail your tests, only if the test passes
describe BlogPost do
  pending "should be successful (try out what happens if the block passes!)" do
    false.should be true
  end
#or calling it explicitely within a block passed to it
  it "should be successful" do
    pending("not implemented yet")
  end
end
# you can make all examples in a block pending
describe "something that's not implemented" do
  before { pending }
  it "pending example for a whole block" do
    false.should be_true
  end
end

# before and after
# you can specify things that should be done
# before and after each example
# that can be narrowed down to a context
describe BlogPost do
  context "newly created BlogPosts" do
    before do
      @blog_post = BlogPost.new :title => 'Hello' #,:published =>true
    end
    after do
      #rarely needed in rails applications
    end
    it "should not be published" do
      @blog_post.should_not be_published
    end
  end
end


# let gets rid of instance variables
# readability
# shows you who the players are
describe BlogPost do
  let (:blog_post) {BlogPost.new :title => 'Hello'}
  it "should not be published" do
    blog_post.should_not be_published
  end
end


#specify

describe BlogPost do
  before { @blog_post = BlogPost.new :title =>"foo" }
  #instead of
  it "should not be published" do
    @blog_post.should_not be_published
  end
  #write specify
  specify { @blog_post.should_not be_published }
  # the ruby block reads like english, and rspec generates an english output.
end


# expect 
# expect is an alias for lambda!
describe BlogPost do
  let (:blog_post) {BlogPost.new :title => 'Hello'}
  describe "create" do
    it "should add an BlogPost" do
      expect { BlogPost.create :title => 'Hello' }.to change { BlogPost.count }.by(1)
    end
  end
  #from.to
  it "should set a published_on date while publishing" do
    expect { blog_post.publish! }.to change { blog_post.published_on }.from(nil).to(Date.today)
  end
  it "raises an exception" do
    expect {
      blog_post.unpublish!
    }.to raise_exception(NotPublishedError, /not yet published/)
  end
end


# should and should not
describe "should and should not" do
#  receiver.should(matcher)
#  passes if matcher.matches?(receiver)
#  receiver.should ==expected #passes if (receiver == expected)
#  same for === and =~
  it "use a matcher" do
    true.should be_true
  end
end

#subject
#implicit subject
describe BlogPost do
end
#explicit subject
describe BlogPost do
  subject { BlogPost.new :title =>'foo', :post => 'bar' }
  it "can be talked to explicitely" do
    subject.publish!
    subject.published?.should == true
  end
end

#Predicate Matchers
# matchers (be_)
#  be
#  be_true
#  be_false
#  be_nil

describe BlogPost do
  before { @blog_post = BlogPost.new :title =>"foo" }
  specify { @blog_post.should_not be_published }
 end

# also indefinite article versions be_a and be_an
# be_a_kind_of
# be_an_instance_of

# expectation matchers for classes that implement Enumerable
# should have_key

