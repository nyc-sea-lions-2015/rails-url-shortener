class UrlsController < ApplicationController

  def index #('/')
    @url = Url.new
    @urls = Url.all.order(:created_at)
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
     @url.click_count += 1
     @url.save!
     redirect_to "#{@url.long}"
  end
end
