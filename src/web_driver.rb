require 'selenium-webdriver'

class WebDriver
    def initialize()
        options = Selenium::WebDriver::Chrome::Options.new()
        options.headless!
        options.add_argument("--disable-web-security");
        @driver = Selenium::WebDriver.for(:chrome, options: options)

        @driver.manage.timeouts.page_load = 300

        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    end

    def get_url(url)
        print('Loading URL: ' + url)
        @wait.until { @driver.get(url)}
    end

    def shutdown()
        @driver.quit()
    end

    def find_xpath(xpath)
        @wait.until { @driver.find_elements(:xpath, xpath) }
    end
end 