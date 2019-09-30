
require_relative "../../config/environment"
require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end
  get "/articles/new" do
    erb :new
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  patch "/articles/:id" do
    article = Article.find(params[:id])
    article.update(:title => params[:article][:title], :content => params[:article][:content])

    erb :edit
  end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    erb :delete
  end
end
