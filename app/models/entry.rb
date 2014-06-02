class Entry < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "rails.png"
  attr_accessible :title, :description, :image
  validates :title, :description, presence: true
  validates :image, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :image
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  paginates_per 3
end
