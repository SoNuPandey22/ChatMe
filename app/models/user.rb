class User < ApplicationRecord
	validates_uniqueness_of :username
	# protect user to chat with himeself
	has_many :messages
	scope :all_except, ->(user) { where.not(id: user) }
	after_create_commit { broadcast_append_to "users" } #done by actionCable
end
