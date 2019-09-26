
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all

    if @articles.empty?
      redirect '/articles/new'
    else
      erb :'articles/index' 
    end
  end

  get '/articles/new' do 
    @articles = Article.all
    erb :'/articles/new'
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :'/articles/show'
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :'/articles/edit'
  end

  post '/articles' do 
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  delete '/articles/:id' do
    Article.delete(Article.find(params[:id]))    
    redirect "/articles"
  end

end
