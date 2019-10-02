
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index 
  end 

  get '/articles/new' do
    erb :new 
  end

  post '/articles' do 
  end 

  get 'articles' do
  end 

  get 'articles/:id' do 
  end 

  get 'articles/:id/edit' do 
  end 
end
