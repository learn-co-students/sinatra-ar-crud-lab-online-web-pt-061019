
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
    # redirect to "/"
  end

  get '/articles/new' do
    # @article = Article.new
    erb :new
  end

  post '/articles' do
    # puts params {"title"=>"ffff", "content"=>"rrrr", "submit"=>"Submit"}

    @article = Article.create(params)

    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end


  get '/show' do
    params
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    # puts params {"_method"=>"patch", "article"=>{"title"=>"Smelly cat. An exposè.", "content"=>"What are they feeding you?"}, "id"=>":id"}
    @article = Article.find(params["id"])
    @article.update(params["article"])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    # params
    # @article = Article.find(params["article"]["id"])
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
