class HomeController < ApplicationController
  def index
  end

  def load_content
    render plain: "Content loaded at #{Time.now}"
  end

  def submit_data
    render html: "Data received: #{params[:user_data]}"
  end

end
