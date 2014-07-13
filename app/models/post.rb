class Post < ActiveRecord::Base
	belongs_to :user #foreign user_id
	validates_presence_of :content
end
