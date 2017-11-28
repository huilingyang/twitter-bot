require 'twitter'
#!/usr/bin/env ruby

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "rB3Fzq1RPZ8y2vQlhNsycdCap"
  config.consumer_secret     = "tUKymviDWAFPR2JK3qJVNI7bY4hPWLnwhzLYpBss87zTT0nN4y"
  config.access_token        = "930173331936079873-xM4GgcLAYWgPCgSWKkXTxKBw63AbQ35"
  config.access_token_secret = "swhN98JUdTkjRFe3lYp1fomw6WP7kdeBBudSsN9iduR9W"
end


	promotion = {
		"photo" => "promo.jpg",
  		"text" => "Code réduction Clarins : -20% pour un produit acheté et -25% dès 2 produits achetés ! Jetez vous dessus avec le code FETES2017 depuis le site ! #clarins #promo #blackfriday
http://www.clarins.fr/offres/specialoffers/"
  	}


client.search("#beauteprivee").take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.follow(users)
  		client.favorite(tweet)
  		client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end