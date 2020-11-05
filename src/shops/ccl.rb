class CCL
    attr_accessor :product_name, :available, :not_available, :price

    def initialize
        @product_name = ".//div[@class='title']"
        @available = ".//a[@class='btnButton btnBrightGreen btnAddToBasket']"
        @not_available = ".//input[@class='btnButton btnBlue btnNotifyMe cboxElement']"
        @price = ".//div[@class='price']"
    end
    
    def get_name(element)
        element[0].text
    end

    def get_price(element)
        element[0].text
    end

    def check_availability(element)
        element.count != 0 
    end
end 