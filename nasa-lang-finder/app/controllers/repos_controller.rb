class ReposController < ApplicationController

  def index
    response = HTTParty.get('https://api.github.com/repos/nasa/' + params[:repo_name] + '/languages?client_id=8e095b5598d3114163bb&client_secret=6e9182c238ef8dd639440302bacc7eb049c38d9e')
    @repo_data =  get_repo_data(response.parsed_response)
  end

  def get_repo_data(response)
    [ {repo_name: params[:repo_name] ,languages: format_data(response) }]
  end

  def format_data(lang_response)
    total = lang_response.values.inject(&:+)
    lang = []
    lang_response.each do |language,amount|
      lang_percentage = (amount.to_f / total.to_f * 100).round(2)
      lang << {name:language, percentage: lang_percentage}
    end
    return lang
  end

end
