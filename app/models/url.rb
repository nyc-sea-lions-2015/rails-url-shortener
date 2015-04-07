class Url < ActiveRecord::Base

  before_save :convert

  private

  def convert
     range = [*'0'..'9', *'a'..'z', *'A'..'Z']
     short_url = Array.new(8){range.sample}.join
    self.short = short_url
  end



end
