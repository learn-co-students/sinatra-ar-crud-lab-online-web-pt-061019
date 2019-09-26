
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/article' do
    @article = Article.new(params[:article])
    params[:article][:magazines].each do |details|
      Magazine.new(details)
    end
    @magazines = Magazine.all
    erb :article
  end
end
