get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/users/:id/profiles' do
redirect '/users/:id/profiles'
end

get '/users/:id/profiles' do
  erb :user_profile
end

