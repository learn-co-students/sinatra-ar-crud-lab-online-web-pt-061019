
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # @articles = Articles.all
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
    # redirect to "/"
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    # redirect to "/articles/#{@article.id}"

    # params[":title"]
    # params[":content"]

# {":title"=>"My Title", ":content"=>"My Content", "submit"=>"Submit"}
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end


  get '/show' do
    # params
    erb :show
  end

  get '/articles/:id/edit' do
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params["id"])
    @article.destroy

    redirect to '/articles'
  end


end
