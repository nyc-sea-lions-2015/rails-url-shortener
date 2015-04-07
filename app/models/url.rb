require "uri"
class Url < ActiveRecord::Base
  validates :long, :uniqueness => true, format: { with: /\A#{URI::regexp}\z/}
  before_save :convert

  private

  def convert
     range = [*'0'..'9', *'a'..'z', *'A'..'Z']
     unless self.short
        short_url = Array.new(8){range.sample}.join
         convert if Url.where(short: short_url).length > 0
        self.short = short_url
     end
  end



end


