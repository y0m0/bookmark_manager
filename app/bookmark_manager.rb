require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  
  get '/' do
    'Bookmark Manager'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

end
