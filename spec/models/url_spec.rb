require "rails_helper"

describe Url do
  context "validations" do
    it {should validate_uniqueness_of :long}
    it { should allow_value("http://emailaddresse.com").for(:long) }
    it { should_not allow_value("foo gf").for(:long) }
  end

  context "#convert" do
    let(:url) {Url.new(long: "http://apidock.com/")}
    it "creates short attribute before saving url object to database" do |variable|
      url.save
      expect(Url.where(short: url.short)).to exist
    end
  end
end
