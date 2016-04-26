#!/usr/bin/env python

# pre-requisites : `pip install selenium`

from selenium import webdriver

driver = webdriver.Remote(
    desired_capabilities=webdriver.DesiredCapabilities.FIREFOX,
    command_executor='http://chromedriver:4444'
)

driver.get('http://www.google.com/xhtml');
search_box = driver.find_element_by_name('q')
search_box.send_keys('ChromeDriver')
search_box.submit()
print driver.get_cookies()
driver.quit()

