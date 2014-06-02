class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  paginates_per 1
end
