require_relative "../lib/passvalidator.rb"

RSpec.describe PassValidator do 
  before :each do 
    @pass = PassValidator.new
  end
  describe "#long" do
    it "Check if long is more than 8 char." do
      expect(@pass.long("ffeefrgewrgeh")).to eq(true)
    end
  end

  describe "#string_downcase" do
    it "Check if password contains 1 lowercase letter" do
      expect(@pass.string_downcase("FIEWHdEFHW")).to eq(true)
    end
  end

  describe "#string_upcase" do
    it "Check if password contains 1 upcase letter" do
      expect(@pass.string_upcase("kfjhekuAfhwke")).to eq(true)
    end
  end

  describe "#string_number" do
    it "Check if password contains 1 number" do
      expect(@pass.string_number("kfjheku9Afhwke")).to eq(true)
    end
  end

  describe "#string_spec_char" do
    it "Check if password contains 1 special char" do
      expect(@pass.string_spec_char("kfjhek*uAfhwke")).to eq(true)
    end
  end

  describe "#pass_cont_emailvalue" do
    it "Check if password contains email name or domain" do
      expect(@pass.pass_cont_emailvalue("pau@iron.es", "uewpiron.erhgjfwbe")).to eq(true)
    end
  end
end