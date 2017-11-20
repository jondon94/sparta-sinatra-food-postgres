class FoodController < Sinatra::Base

  set :root,
  File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = 'Homepage'
    @food = Food.all
    erb :'foodpages/index'
  end

  get "/veggies" do
    @title = 'Veggies'
    erb :'foodpages/new'
  end

  get "/veggies/:id" do
    id = params[:id].to_i
    erb :'foodpages/index'
  end

  get '/new' do
    @food = Food.new
    erb :'foodpages/new'
  end

  get '/zones' do
    erb :'foodpages/zones'
  end

  get '/:id' do
    id = params[:id].to_i
    @food = Food.find(id)
    erb :'foodpages/show'
  end

  post '/' do
    food = Food.new
    food.title = params[:title]
    food.body = params[:body]
    food.image = params[:image]
    food.save
    redirect '/'
  end

  put '/:id' do
    id = params[:id].to_i
    food = Food.find(id)
    food.title = params[:title]
    food.body = params[:body]
    food.image = params[:image]
    food.save
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    Food.destroy(id)
    redirect '/'
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @food = Food.find(id)
    erb :'foodpages/edit'
  end

end
