class ModelMailer < ActionMailer::Base
  default from: "team@distribu.td"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.po_notification.subject
  #
  def po_notification(product, quantity, email)
    @greeting = "Hi"
    @product = product
    @quant = quantity
    pdf = ProductPdf.new(@product)
    attachments["PO.pdf"] = pdf.render
    mail to: email, subject: "Success!"
  end

  private
  def add_pdf!(pdf)
    attachments["PO.pdf"] = pdf.read
  end
end
