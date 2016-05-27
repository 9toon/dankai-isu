class ApplicationController < ActionController::Base
  before_action :record_pv

  private
  def record_pv
    PvCount::Client.new.increment(params[:controller], params[:action])
  end
end
