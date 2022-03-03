class ApplicationController < ActionController::Base
	private
	def after_sign_up_path_for(resource_or_scope)
		home_index_path
	end
end
