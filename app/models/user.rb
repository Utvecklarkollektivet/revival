require 'digest/md5'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :articles
	belongs_to :role

	def gravatar
		hash = Digest::MD5.hexdigest(self.email.downcase)
		url = "http://www.gravatar.com/avatar/#{hash}"
	end
	
end
