require 'nokogiri'
require 'open-uri'

class Cryptomonnaies 
	
	def initialize
		page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))   
		find = page.css('a[class = "price"]') #scrapp la classe des prix
		find.each do |type| 
		  value = type["data-usd"] 
		  name = type["href"].gsub!("/currencies/","").gsub!("/#markets","")
		  @crypto = Crypto.create(name: name,value: value)
		  @crypto.save
		
		end
	end

	def search_crypto(crypto)
		@monet = Crypto.all
		@monet = Crypto.where(name: crypto)
		return @monet
	end
	
end