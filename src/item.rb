class Item
    attr_accessor :shop, :url, :notified, :name

    def initialize(shop, url)
        @shop = shop
        @url = url
        @name = nil
        @notified = false
     end
end