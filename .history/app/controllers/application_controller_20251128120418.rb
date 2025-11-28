class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path        # 管理者用TOPへ
    else
      home_index_path
    end
  end 

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  before_action :authenticate_user!
end
