require "rails_helper"

RSpec.describe ModelMailer, :type => :mailer do
  before(:each) do
    vendor = Vendor.new(:name => 'ACME', :email_biz => 'fake@fake.com', :email_finance => 'anon@anon.com', :address => '123 4th St', :city => 'Springfield', :state => 'East Dakota', :zipcode => '98765', :phone => '123-456-7890')
    @product = Product.new(:name => 'A Product', :description => 'a thing', :quantity => 400, :vendor => vendor, :price => 55.5, :moq => 500)
  end

  describe "po_notification" do
    let(:mail) { ModelMailer.po_notification(@product) }

    it "renders the headers" do
      expect(mail.subject).to eq("Success!")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
