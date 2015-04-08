require "rails_helper"

describe Url do
  context "validations" do
    it {should validate_uniqueness_of :long}
    it { should allow_value("http://emailaddresse.com").for(:long) }
    it { should_not allow_value("foo gf").for(:long) }
  end





end
