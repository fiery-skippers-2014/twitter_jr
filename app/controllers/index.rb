get '/' do
  @current_user=User.find(session[:user_id])  if session[:user_id]
  # confused as to what this doing here.
  @user=User.first.id
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end


post '/signup' do
  @user_input = User.create(params)
  # no p's in production! this is a hanging offense at a lot of companies.
  p "$$$$$$$$$$$$$$$$$$$$$$"
  p params
  p "%%%%%%%%%%%%%%%%%%%%%%%%"
  @user = User.find_by_email(params[:email])
  session[:user_id] = @user.id
  redirect '/'
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password_hash]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/tweets"
  else
    @error = "Wrong Password!"
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/users/:id/tweets' do
  # .find automatically defaults to find_by_id.
  user = User.find_by_id(params[:id])
  # nice use of creation off a collection, very clean.
  user.tweets.create(tweet: params[:tweet])
 redirect "/users/#{params[:id]}/tweets"
end

get '/users/:id/tweets' do
  @user_all = User.all
  @user= User.find(params[:id])
  erb :user_tweets
end

get '/:id/follow' do
  @user=User.find(params[:id])
  erb :follow
end
