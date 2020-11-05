require 'telegram/bot'

class Notifier

    def initilize()
    end

    def format_message(name, shop, url, price)
        name + "\nAvailable at: " + shop + "\nPrice: " + price + "\nURL: " + url
    end

    def send_message(text)
        Telegram::Bot::Client.run(ENV['tel_token']) do |bot|
            bot.api.send_message(chat_id: '@zen_alert', text: text)  
        end
    end
end