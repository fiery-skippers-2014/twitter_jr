get '/' do
  erb :index
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user
    redirect '/welcome_back'
else
  @user= User.create(name: params[:name], password: params[:password], email: params[:email])
  redirect '/welcome_new_user'
  end
end

get '/welcome_back' do
  @user = User.find_by_email(params[:email])
  erb :welcome_back
end

get '/welcome_new_user' do
  erb :welcome_new_user
end








# enable :sessions

# before do
# @user = User.find(params[:id])
# session[:id] = @user.id
# end

# get '/' do
#   # Look in app/views/index.erb
#   erb :index
# end

# post '/users/create_user' do
# @user=User.create(name: params[:name], password: params[:password], email: params[:email])
# redirect '/users/'
# end

get '/users/:id' do
  erb :user_profile
end

