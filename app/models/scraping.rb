class Scraping
  def self.product_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://xn--4dkp5a8a4562a1c2fvhm.com/shoplist")
    elements = current_page.search(".article a")
    elements.each do |ele|
      links << ele[:href]
    end

    links.each do |link|
      get_product(link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at('//div[@id="main-contents"]/table/tr[1]/td[2]').inner_text.gsub(/\r\n|\r|\n|\s|\t|ラーメン二郎/, "")
    image = page.at('#main-contents img')[:src] if page.at('#main-contents img')
    adress = page.at('//div[@id="main-contents"]/table/tr[2]/td[2]').inner_text.gsub(/\r\n|\r|\n/, "") if page.at('//div[@id="main-contents"]/table/tr[2]/td[2]')
    product = Product.new(name: name, image: image, adress: adress)
    product.save
  end
end



