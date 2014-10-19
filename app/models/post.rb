class Post < ActiveRecord::Base

  def human_readable_created_at
    self.created_at.strftime("%B %d, %Y") 
  end

end
