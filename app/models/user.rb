class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :first_name, :last_name, :email, 
                  :password, :password_confirmation, :remember_me
  def fullname
  	"#{self.first_name} #{self.last_name}"
  end
	
end
