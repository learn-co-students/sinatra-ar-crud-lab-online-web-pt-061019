
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # index
  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles=Article.all

    erb :index
  end

  # new
  get '/articles/new' do
    erb :new
  end

  # show
  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  # create
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])

    redirect to "/articles/#{@article.id}"
  end

  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)

    erb :edit
  end

  # update
  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.update(title: params[:title], content: params[:content])
    @article.save

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    article = Article.find(params[:id].to_i)
    @name = article.title
    article.destroy

    erb :delete
  end
end
