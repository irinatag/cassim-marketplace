def get_trending_urls(url)
  driver = Selenium::WebDriver.for :firefox
  driver.get(url)
  driver.switch_to.default_content
  css_selector2 = ".buyer-card"
  ary = driver.find_elements(:css, css_selector2)
  trending_item_urls = []
  ary.each do |a|
    trending_item_urls << a.attribute('href')
  end
  driver.quit
  trending_item_urls
end

def create_trending_products(links)
  links.each do |link|
    puts "Fetching #{link}..."
    response = RestClient.get(link).body
    noko = Nokogiri::HTML(response)

    name = noko.css('div#listing-right-column span[itemprop="name"]').text rescue nil
    price = noko.css('span#listing-price').text.strip.split(' ')[1] rescue nil
    desc = noko.css('div#description-text').text.strip rescue nil
    vendor = noko.css('span[itemprop="title"]').text rescue nil
    properties = noko.css('ul.properties li').text rescue nil
    image_url = noko.css('ul#image-carousel li:nth-child(1)').attr('data-full-image-href').value rescue nil

    Product.create!(
      name: name,
      description: desc,
      price: price,
      vendor: Vendor.create!(name: vendor),
      properties: properties,
      etsy_image_url: image_url
    )
  end
end

namespace :etsy do

  desc "rake -T"
  task scrape: :environment do
    Product.delete_all
    Vendor.delete_all
    
    etsy_trending_links = get_trending_urls("https://www.etsy.com/market/trending_now")
    create_trending_products(etsy_trending_links)
  end
end
