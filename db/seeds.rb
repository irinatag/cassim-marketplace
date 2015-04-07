# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# OrderStatus.delete_all
# OrderStatus.create! id: 1, name: "In Progress"
# OrderStatus.create! id: 2, name: "Placed"
# OrderStatus.create! id: 3, name: "Shipped"
# OrderStatus.create! id: 4, name: "Cancelled"

def get_trending_urls(url)
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

def get_vendor_store_links(links)
  shop_urls = []
  links.each do |link|
    response = RestClient.get(link).body
    noko = Nokogiri::HTML(response)
    shop_url = noko.css('.shop-name a[itemprop="url"]').attr('href').value rescue nil
    shop_urls << shop_url
  end
  shop_urls
end

def create_vendor_pages(ary)
  ary.each do |a|
    response = RestClient.get(a).body
    noko = Nokogiri::HTML(response)

    banner = noko.css('div#shop_banner img').attr('src').value rescue nil
    vendor_name = noko.css('h1.shop-name a span.shopname').text.strip rescue nil
    tagline = noko.css('h2.shop-title').text.strip rescue nil
    owner_name = noko.css('div[itemprop="itemreviewed"] .username').text.strip rescue nil
    avatar = noko.css('div.user img').attr('src').value rescue nil
    city = noko.css('div.shop-info div.location').text.split(' ')[0].gsub(",","").strip rescue nil
    country = noko.css('div.shop-info div.location').text.split(' ')[1] rescue nil
    desc = noko.css('a#shop-announcement-clickable').text.strip rescue nil

    vendor = Vendor.find_or_create_by!(name: vendor_name)
    vendor.etsy_profile_image_url = banner
    vendor.tagline = tagline
    vendor.owner_name = owner_name
    vendor.etsy_avatar_image_url = avatar
    vendor.city = city
    vendor.country = country
    vendor.description = desc
    vendor.save
  end
end

def create_trending_products(links)
  links.each do |link|
    response = RestClient.get(link).body
    noko = Nokogiri::HTML(response)

    name = noko.css('div#listing-right-column span[itemprop="name"]').text rescue nil
    price = noko.css('span#listing-price .currency-value').text rescue nil
    desc = noko.css('div#description-text').text.strip rescue nil
    vendor = noko.css('span[itemprop="title"]').text rescue nil
    properties = noko.css('ul.properties li').text rescue nil
    image_url = noko.css('ul#image-carousel li:nth-child(1)').attr('data-full-image-href').value rescue nil

    Product.create!(
      name: name,
      description: desc,
      price: price,
      vendor: Vendor.find_or_create_by!(name: vendor),
      properties: properties,
      etsy_image_url: image_url
    )
  end
end

def get_vendor_product_links(ary)
  all_store_urls = []
  ary.each do |a|
    response = RestClient.get(a).body
    noko = Nokogiri::HTML(response)

    listings = noko.css('ul.listings li')
    @listing_urls = []
    listings.each do |listing|
      product_url = listing.css('div.listing-detail div.listing-title a').attr('href').value rescue nil
      @listing_urls << product_url
    end
    @listing_urls
    all_store_urls.concat(@listing_urls)
  end
  all_store_urls.flatten
  all_store_urls rescue nil
end


etsy_trending_links = get_trending_urls("https://www.etsy.com/trending")
vendor_links = get_vendor_store_links(etsy_trending_links)
create_vendor_pages(vendor_links)
etsy_store_products_links = get_vendor_product_links(vendor_links)
create_trending_products(etsy_store_products_links)
