class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 has_many :posts
	 validates_presence_of :handle
	 validates_uniqueness_of :handle

	has_many :relationship, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",
									class_name: "Relationships", 
									dependent: destroy
	has_many :followers, through: :reverse_relationships, source: :follower 


end
