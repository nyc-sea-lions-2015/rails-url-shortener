class UrlsController < ApplicationController

  def index #('/')
    @url = Url.new
    @urls = Url.all
  end

  def create #(post '/urls')
    @new_url = Url.new(long: params[:url][:long])

      if @new_url.save!
        redirect_to '/'
      else
        [400, "Url not Converted"]
      end
  end

  def find_long #('/:short' redirects)
     @url = Url.find_by(short: params[:short_url])
     redirect_to "#{@url.long}"
  end
end
