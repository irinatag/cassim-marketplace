require "rails_helper"

RSpec.describe ModelMailer, :type => :mailer do
  describe "po_notification" do
    let(:mail) { ModelMailer.po_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Po notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
