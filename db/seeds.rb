# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def get_urls(url)
  driver = Selenium::WebDriver.for :firefox
  driver.get(url)
  driver.switch_to.default_content
  css_selector2 = ".image-wrap"
  ary = driver.find_elements(:css, css_selector2)
  trending_item_urls = []
  ary.each do |a|
    trending_item_urls << a.attribute('href')
  end
  driver.quit
  trending_item_urls
end



def create_products(links)
  links.each do |link|
    response = RestClient.get(link).body
    noko = Nokogiri::HTML(response)


    name = noko.css('div#listing-right-column span[itemprop="name"]').text
    price = noko.css('span#listing-price .currency-value').text
    desc = noko.css('div#description-text').text.strip
    vendor = noko.css('span[itemprop="title"]').text
    properties = noko.css('ul.properties li').text
    image_url = noko.css('ul#image-carousel li:nth-child(1)').attr('data-full-image-href').value

    Product.create(
      name: name,
      description: desc,
      price: price,
      vendor: Vendor.create(name: vendor),
      properties: properties,
      etsy_image_url: image_url
    )
  end

end

etsy_trending_links = get_urls("http://etsy.com/trending")
create_products(etsy_trending_links)
