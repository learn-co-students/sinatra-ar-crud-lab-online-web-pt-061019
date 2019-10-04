
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

   get '/' do 
      redirect "articles/new"
   end 

   get '/articles/new' do 
      erb :"articles/new"
   end 

   post '/articles' do
      @article = Article.create(params)
      redirect "/articles/#{@article.id}"
   end 

   get '/articles/:id' do
      @article = Article.find(params[:id])
      erb :"articles/show"
   end 

   get '/articles' do
      @articles = Article.all 
      erb :"articles/index"
   end 

   get '/articles/:id/edit' do 
        @article = Article.find(params[:id])
        erb :"articles/edit" 
   end 

   patch '/articles/:id' do
      @article = Article.find(params[:id])
      @article.update(params[:article])
      redirect "/articles/#{@article.id}"
   end 
end
