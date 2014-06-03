class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :body, :entry_id
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
