#!/usr/bin/env python

# pre-requisites : `pip install selenium`

from selenium import webdriver
import subprocess
import re

p = subprocess.Popen(['docker-machine', 'ip', 'local'], stdout=subprocess.PIPE,stderr=subprocess.PIPE)
out, err = p.communicate()
host=out.rstrip('\n')

driver = webdriver.Remote(
    desired_capabilities=webdriver.DesiredCapabilities.FIREFOX,
    command_executor='http://%s:4444' % (host)
)

driver.get('http://www.google.com/xhtml');
search_box = driver.find_element_by_name('q')
search_box.send_keys('ChromeDriver')
search_box.submit()
print driver.get_cookies()
driver.quit()

