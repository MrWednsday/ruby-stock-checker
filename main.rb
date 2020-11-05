require 'dotenv/load'

require_relative './src/web_driver'
require_relative './src/item_manager'
require_relative './src/notifier'
require_relative './src/shop_manager'

require_relative './src/shops/ccl'
WebDr = WebDriver.new  
ItemMan = ItemManager.new
ShopMan = ShopManager.new
Not = Notifier.new 

while true
    item = ItemMan.get_next()
    shop = ShopMan.get_shop(item.shop)

    WebDr.get_url(item.url)
    if item.name.nil?
        nameElement = WebDr.find_xpath(shop.product_name)
        item.name = shop.get_name(nameElement)
    end

    availableElement = WebDr.find_xpath(shop.available)

    if shop.check_availability(availableElement)
        if not item.notified
            priceElement = WebDr.find_xpath(shop.price)
            price = shop.get_price(priceElement)
            message = Not.format_message(item.name, item.shop, item.url, price)
            Not.send_message(message)
            item.notified = true
        end
    else
        item.notified = false
    end
end

WebDr.shutdown
