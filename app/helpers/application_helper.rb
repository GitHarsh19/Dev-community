module ApplicationHelper
	def get_connection_status(user)
		return nil if current_user == user
		
		current_user.my_connection(user).last.status
	end
	def get_receiver(user_id)
		User.find(user_id)
	end
	def get_requester(user_id)
		User.find(user_id)
	end
end
