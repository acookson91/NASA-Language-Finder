class ReposController < ApplicationController

  def index
    response = HTTParty.get('https://api.github.com/repos/nasa/' + params[:repo_name] + '/languages?client_id=8e095b5598d3114163bb&client_secret=6e9182c238ef8dd639440302bacc7eb049c38d9e')
    if response.parsed_response.empty?
      @repo_data =  get_repo_data(response.parsed_response)
      flash.now[:danger] = 'This Nasa Repo contains no code'
    else
      flash.now[:success] = 'This Nasa Repo contains:'
      @repo_data =  get_repo_data(response.parsed_response)
    end
  end

  private

  def get_repo_data(response)
    [ {repo_name: params[:repo_name] ,languages: format_data(response) }]
  end

  def format_data(lang_response)
    total = lang_total(lang_response)
    lang = []
    lang_response.each do |language,amount|
      lang << {name:language, percentage: lang_percentage(amount,total)}
    end
    lang
  end

  def lang_total(lang_response)
    lang_response.values.inject(&:+)
  end

  def lang_percentage(amount,total)
    (amount.to_f / total.to_f * 100).round(2)
  end

end
