class ReposController < ApplicationController

  def index
    response = HTTParty.get('https://api.github.com/repos/nasa/' + params[:repo_name] + '/languages?client_id=8e095b5598d3114163bb&client_secret=6e9182c238ef8dd639440302bacc7eb049c38d9e')
    @repo_data =  get_repo_data(response.parsed_response)
  end

  def get_repo_data(response)
    [ {repo_name: params[:repo_name] ,languages: response }]
  end

end
