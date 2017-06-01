ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

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
    link = Link.new(url: params[:url],
             title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

end
