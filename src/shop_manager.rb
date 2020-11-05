require_relative "./shops/ccl"

class ShopManager

    def initialize()
        @ccl = CCL.new
    end

    def get_shop(name)
        case name.downcase
        when 'ccl'
            return @ccl
        end
    end
end