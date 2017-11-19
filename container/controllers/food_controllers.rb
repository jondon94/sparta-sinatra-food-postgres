class FoodController < Sinatra::Base

  set :root,
  File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # $veg = [{
	#  id: 0,
	#  title: "Courgette",
	#  body: "Corgettes are easy to grow, placholder text goes here",
  #  image: 'https://i2-prod.manchestereveningnews.co.uk/incoming/article12478695.ece/ALTERNATES/s615/Fresh-zucchini-courgette.jpg',
  # },
  # {
  #   id: 1,
  #   title: "Tomato",
  #   body: "Tomatos are easy to grow, placholder text goes here",
  #   image: 'https://www.rodalesorganiclife.com/sites/rodalesorganiclife.com/files/styles/listicle_slide_custom_user_phone_1x/public/airyspot_ahmad_faizal_yahya_102522.jpg?itok=Xnuv04tf',
  # },
  # {
  #   id: 2,
  #   title: "Rhubarb",
  #   body: "Rhubarb is easy to grow, placholder text goes here",
  #   image: 'https://www.pomonafruits.co.uk/images/Rhubarb-Thompsons-Terrifically-Tasty.jpg',
  # }];

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

  get '/:id' do
    id = params[:id].to_i
    @food = Food.find(id)
    erb :'foodpages/show'
  end

  post '/' do
    food = Food.new
    food.title = params[:title]
    food.body = params[:body]
    food.save
    redirect '/'

  end

  put '/:id' do
    id = params[:id].to_i
    food = Food.find(id)
    food.title = params[:title]
    food.body = params[:body]
    food.img = params[:img]
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
