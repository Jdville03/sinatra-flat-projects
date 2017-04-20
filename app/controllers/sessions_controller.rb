class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/new'
  end

  post '/login' do

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/projects'
    else
      redirect '/login'
    end

  end

end
