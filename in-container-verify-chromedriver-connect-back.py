#!/usr/bin/env python

# pre-requisites : `pip install selenium`

from selenium import webdriver

driver = webdriver.Remote(
    desired_capabilities=webdriver.DesiredCapabilities.FIREFOX,
    command_executor='http://chromedriver:4444'
)

driver.get('http://phoenix_commerce_dev:4000/products');
print driver.get_cookies()
driver.quit()
