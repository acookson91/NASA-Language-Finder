require 'httparty'

class SummaryController < ApplicationController

  def index
    response = HTTParty.get('https://api.github.com/users/nasa/repos?client_id=8e095b5598d3114163bb&client_secret=6e9182c238ef8dd639440302bacc7eb049c38d9e')
    @repos_info = response.map{|repo| {name:repo['name'], description: repo['description']} }
  end

end
