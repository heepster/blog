class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories

  def human_readable_created_at
    self.created_at.strftime("%B %d, %Y") 
  end

  def category_names
    self.categories.map { |c| c.name }
  end

end
