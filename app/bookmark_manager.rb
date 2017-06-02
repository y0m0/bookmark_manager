ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    'Bookmark Manager'
  end

  get '/links' do
    @user = User.get(session[:user_id])
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end
  
  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])

    params[:tags].split(', ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end

    link.save
    redirect '/links'
  end
  
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                      email: params[:email],
                      password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

end
