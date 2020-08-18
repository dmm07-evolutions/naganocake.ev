class ApplicationController < ActionController::Base
	befor_action :authenticate_adnim!
	def after_sign_in_path_for(resource)
		admin_homes_top_path   #sing_in後のパス
	end

	def after_sign_out_path_for(resource)
		new_admin_session_path  #sing_out後のパス
	end
end
