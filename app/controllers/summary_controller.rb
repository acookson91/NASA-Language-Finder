require 'httparty'

class SummaryController < ApplicationController

  def index
    response = HTTParty.get('https://api.github.com/users/nasa/repos?client_id=' + ENV['CLIENT_ID'] + '&client_secret=' + ENV['CLIENT_SECRET'])
    if response.empty?
      flash.now[:danger] = 'NASA Github returned nothing'
    else
      flash.now[:success] = 'Successfully connected to NASA Github'
      @repos_info = response.map{|repo| {name:repo['name'], description: repo['description']} }
    end
  end

end
