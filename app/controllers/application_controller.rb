class ApplicationController < ActionController::Base
  before_action :record_pv

  private
  def record_pv
    Pv.create!(controller: params['controller'], action: params['action'])
  end
end
