class Room < ApplicationRecord
	validates_uniqueness_of :name
	scope :public_rooms, -> { where(is_private: false)}
	#boradcast to a channel named roooms after each new instance got created
	after_create_commit { broadcast_append_to "rooms"}
	has_many :messages

end
