class ProjectsController < ApplicationController


  get '/projects' do
    erb :'projects/index'
  end
end
