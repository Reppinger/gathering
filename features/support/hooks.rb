require 'watir-webdriver'

Before do
  DatabaseCleaner.clean
  @browser = Watir::Browser.new :firefox
end

After do
  @browser.close
end
