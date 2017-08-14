class User < ApplicationRecord
	has_many :ads, dependent: :destroy

	has_many :comments, dependent: :destroy
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates_presence_of :login, :full_name, :birthday, :country, :state, :city, :zip, :address
  
	validates_uniqueness_of :login  

	validates_length_of :login, :minimum => 3

	default_scope { order(created_at: :asc) }
end
