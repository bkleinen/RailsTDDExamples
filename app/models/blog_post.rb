class BlogPost < ActiveRecord::Base
  def publish!
    self.published_on=Date.today
    self.published=true
    self.save
  end
  def unpublish!
    raise NotPublishedError, "not yet published" unless published
 end
end

class NotPublishedError < ArgumentError
end