module StoreHelper

	def show_store_counter
		if session[:counter] > 5
			return "You visit the catalog: #{pluralize(session[:counter],"Time")}" 
		end
	end

end
