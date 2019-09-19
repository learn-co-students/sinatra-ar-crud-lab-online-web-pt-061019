
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
  # grab all of the articles and store them in an instance variable
    @articles = Article.all
    erb :"articles/index"
  end

  get '/articles/new' do
    erb :"articles/new"
  end

  get '/articles/:id' do
    # use Active Record to grab the article with the id that is in the params
    @article = Article.find(params[:id])
    erb :"articles/show"
  end

  post '/articles' do
    # controller action should use the Create CRUD action to create the article and save it to the database
    Article.create(params)

    # redirect to another action which will trigger a render of a show.erb file automatically
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"articles/edit"
  end

  patch '/articles/:id' do
    # controller action will find the instance of the model to update, using the id from params, update and save that instance.
    # binding.pry
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    # article.title = params[:title]
    # article.content = params[:content]
    # article.save

    redirect to "/articles/#{@article.id}" 
  end

  delete '/articles/:id' do
    Article.delete(Article.find(params[:id]))
    redirect to "/articles"
  end

end
