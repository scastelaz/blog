class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :body, :entry_id, :user_id, :commentable_id, :commentable_type
  validates :body, presence: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable
end
