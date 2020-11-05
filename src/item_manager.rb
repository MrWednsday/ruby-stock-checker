require_relative 'item'

class ItemManager
    def initialize()
        data = self.load_data()
        @items = creat_items(data)
        @nextItemIndex = 0
    end

    def load_data()
        file = File.read('./json/items.json')
        JSON.parse(file)
    end

    def creat_items(data)
        items = Array.new
        for object in data
            items.append(Item.new(object['shop'], object['url']))
        end
        items
    end

    def get_next()
        itemIndex = @nextItemIndex
        @nextItemIndex += 1

        if @nextItemIndex == self.get_no_of_items()
            @nextItemIndex = 0
        end

        @items[itemIndex]
    end

    def get_no_of_items()
        @items.count
    end
end

    
