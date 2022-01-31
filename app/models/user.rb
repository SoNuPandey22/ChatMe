class User < ApplicationRecord
	validates_uniqueness_of :username
	# protect user to chat with himeself
	scope :all_except, ->(user) { where.not(id: user) }
end
