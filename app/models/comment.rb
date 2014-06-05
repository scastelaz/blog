class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :body, :entry_id, :user_id, :commentable_id, 
  				  :commentable_type, :postable_id, :postable_type
  validates :body, presence: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable
  paginates_per 3
end
