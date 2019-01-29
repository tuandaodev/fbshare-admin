import platform
import pickle
import re

from flask import Flask
from flask import request, jsonify
from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from bs4 import BeautifulSoup

app = Flask(__name__)

def save_cookies(driver, location):
    pickle.dump(driver.get_cookies(), open(location, "wb"))

def load_cookies(driver, location, url=None):
    cookies = pickle.load(open(location, "rb"))
    driver.delete_all_cookies()
    # have to be on a page before you can add any cookies, any page - does not matter which
    driver.get("https://mobile.facebook.com" if url is None else url)
    for cookie in cookies:
        driver.add_cookie(cookie)

@app.route('/')
def home():
    return 'Hello World!'

@app.route('/api/crawl', methods=['GET'])
def simple_crawl():
    url = request.args.get('url')
    results = [{'result':url}]
    return jsonify(results)

@app.route('/api/login', methods=['GET'])
def login():
    global driver

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')


    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)
    capabilities = DesiredCapabilities.CHROME.copy()

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    driver.get("https://mobile.facebook.com")

    email = "tuandaohcmdev@gmail.com"
    password = "Minhtuan123@"
    
    driver.find_element_by_name('email').send_keys(email)
    driver.find_element_by_name('pass').send_keys(password)

    #clicking on login button
    driver.find_element_by_name('login').click()

    save_cookies(driver, cookies_location)
    
    # filling the form
    message = driver.page_source

    driver.quit()
    #results = [{'result':message}]
    #return jsonify(results)
    return message

@app.route('/api/login2', methods=['GET'])
def re_login():
    global driver

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)


    driver.get("https://mobile.facebook.com/100030348953422?v=timeline")

    # filling the form
    message = driver.page_source

    driver.quit()

    #results = [{'result':message}]
    #return jsonify(results)
    return message

@app.route('/api/go_url', methods=['GET'])
def go_url():
    global driver

    url = request.args.get('url')

    if (url is None):
        results = {'result':-1}
        return jsonify(results)

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()

    #not support on chrome, will test on firefox later
    #capabilities['pageLoadStrategy'] = "none"

    cookies_location = "cookies.txt"

    driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    #driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)
    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source

    # filling the form

    driver.quit()

    return source_html

@app.route('/api/get_redirect', methods=['GET'])
def get_redirect():
    global driver

    url = request.args.get('url')

    if (url is None):
        results = {'result':-1}
        return jsonify(results)

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()

    #not support on chrome, will test on firefox later
    #capabilities['pageLoadStrategy'] = "none"

    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)
    
    load_cookies(driver, cookies_location)

    driver.get(url)

    result = driver.current_url

    driver.quit()

    results = {'result':1, 'url_redirected': result}
    print results
    return jsonify(results)

@app.route('/api/check_share_url', methods=['GET'])
def check_share_url():
    global driver

    url = request.args.get('url')
    post_id = request.args.get('post_id')

    if (url is None) or (post_id is None):
        results = {'result':-1}
        return jsonify(results)


    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()
    #capabilities['pageLoadStrategy'] = "none"

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source

    # filling the form

    driver.quit()

    if re.search(post_id, source_html):
        results = {'result':1}
        return jsonify(results)
    else:
        results = {'result':0}
        return jsonify(results)

@app.route('/api/go_user_profile', methods=['GET'])
def go_user_profile():
    global driver

    user_id = request.args.get('user_id')

    if (user_id is None):
        results = {'result':-1}
        return jsonify(results)

    url = "https://mobile.facebook.com/" + user_id + "?v=timeline"

    #return url

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()
    #capabilities['pageLoadStrategy'] = "none"

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source

    return source_html

    # filling the form

@app.route('/api/check_share', methods=['GET'])
def check_share():
    global driver

    user_id = request.args.get('user_id')
    post_id = request.args.get('post_id')

    if (user_id is None) or (post_id is None):
        results = {'result':-1}
        return jsonify(results)

    url = "https://mobile.facebook.com/" + user_id + "?v=timeline"

    #return url

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')
    capabilities = DesiredCapabilities.CHROME.copy()
    #capabilities['pageLoadStrategy'] = "none"

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source
    driver.quit()
    #return source_html
    # filling the form

    

    if re.search(post_id, source_html):
        results = {"set_attributes":{"has_shared": "1"}}
        return jsonify(results)
    else:
        results = {"set_attributes":{"has_shared": "0"}}
        return jsonify(results)

@app.route('/api/check_share_tag', methods=['GET'])
def check_share_tag():
    global driver

    user_id = request.args.get('user_id')
    post_id = request.args.get('post_id')

    if (user_id is None) or (post_id is None):
        results = {'result':-1}
        return jsonify(results)

    url = "https://mobile.facebook.com/" + user_id + "?v=timeline"

    #return url

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')
    capabilities = DesiredCapabilities.CHROME.copy()
    #capabilities['pageLoadStrategy'] = "none"

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source
    driver.quit()
    #return source_html
    # filling the form

    soup = BeautifulSoup(source_html)

    results = soup.select_one("a[href*=story.php]")

    print results

    return results
		

@app.route('/api/get_fb_uid', methods=['GET'])
def get_fb_uid():
    global driver


    user_id = request.args.get('user_app_id')
    post_id = request.args.get('post_id')

    if (user_id is None) or (post_id is None):
        results = {'result':-1}
        return jsonify(results)

    url = "https://mobile.facebook.com/" + user_id + "?v=timeline"

    #return url

    options = Options()
    options.add_argument("--disable-notifications")
    options.add_argument("--disable-infobars")
    options.add_argument("--mute-audio")
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"')

    capabilities = DesiredCapabilities.CHROME.copy()
    #capabilities['pageLoadStrategy'] = "none"

    # Path where you want to save/load cookies to/from aka C:\my\fav\directory\cookies.txt
    cookies_location = "cookies.txt"

    #driver = webdriver.Chrome(executable_path="/usr/bin/chromedriver", options=options)

    driver = webdriver.Remote(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=capabilities, options=options)

    
    load_cookies(driver, cookies_location)

    driver.get(url)

    source_html = driver.page_source
    driver.quit()
    #return source_html
    # filling the form

    

    if re.search(post_id, source_html):
        results = {"set_attributes":{"has_shared": "1"}}
        return jsonify(results)
    else:
        results = {"set_attributes":{"has_shared": "0"}}
        return jsonify(results)

if __name__ == '__main__':
    # This is used when running locally. Gunicorn is used to run the
    # application on Google App Engine. See entrypoint in app.yaml.
    app.run(host='0.0.0.0', port=8080, debug=True)
