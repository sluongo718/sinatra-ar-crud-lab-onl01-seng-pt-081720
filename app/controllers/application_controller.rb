
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post "/articles" do 
    art = Article.create(params)
    redirect to :"/articles/#{art.id}"
  end

  get "/articles" do 

    @articles = Article.all
    erb :index

  end

  get "/articles/:id" do 

    @articles = Article.find(params[:id])

    erb :show

  end

  get '/articles/:id/edit' do 
    @articles = Article.find(params[:id])
   
      erb :edit
  end

  patch '/articles/:id' do 

    @articles = Article.find(params[:id])
    @articles.update(params[:article])
    @articles.save
    redirect to :"/articles/#{art.id}"



  end

  delete '/articles/:id' do 
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect to :index


  end



end
