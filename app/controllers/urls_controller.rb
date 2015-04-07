class UrlsController < ApplicationController

  def index #('/')
    @url = Url.new
    @urls = Url.all
  end

  def create #(post '/urls')
  end

  def convert #('/:short' redirects)
  end
end
