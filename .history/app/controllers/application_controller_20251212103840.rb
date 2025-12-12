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
    home_index_path   # ← 遷移させたいパスを指定
  end

  private

  def store_referrer
    if request.referrer.present? && request.referrer != request.url
      session[:previous_url] = request.referrer
    end
  end

end
