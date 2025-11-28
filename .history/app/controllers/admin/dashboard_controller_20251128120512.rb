class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!   # 管理者以外アクセス禁止

  def index
  end
end
