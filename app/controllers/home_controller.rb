class HomeController < ApplicationController
  before_action :redirect_to_costumes_page, :only => :index

  def index; end

  private

    def redirect_to_costumes_page
      redirect_to(costumes_path) if user_signed_in?
    end

end
