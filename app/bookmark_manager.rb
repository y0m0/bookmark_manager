require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  set :session_secret, "Supa Secret!"

  get '/' do
    'Bookmark Manager'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end
  
  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

end
