# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START app]
import logging

# [START imports]
from flask import Flask, render_template, request, jsonify
# [END imports]
# 
from bs4 import BeautifulSoup
import urllib
import re 

# [START create_app]
app = Flask(__name__)
# [END create_app]
# 
def shop(query):
    address = "http://www.bing.com/shop?q=%s" % (urllib.parse.quote_plus(query))

    getRequest = urllib.request.Request(address, None, {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0'})

    urlfile = urllib.request.urlopen(getRequest)
    htmlResult = urlfile.read(20000000)
    urlfile.close()

    soup = BeautifulSoup(htmlResult)

    results = soup.findAll('div', class_='br-wholeCardClickable br-card br-small br-ocCiteHvrItm')

    return results

@app.route('/get_shop_data', methods=['GET'])
def get_shop_data():
    args = request.args
    item = args['item']
    links = shop("Buy eco-friendly "+item)
    shopdata = []
    for l in links:
        data = {}
        try:
            data['image']='https://www.bing.com/'+l.findAll('img')[0]['src']
            data['seller'] = l.findAll('span', class_='br-sellersCite')[0].text
            data['price'] = l.findAll('div', class_='pd-price br-standardPrice promoted')[0].text
            try:
                data['item'] = l.findAll('span')[-1]['title']
            except:
                data['item'] = "shoes"
            data['url'] = l.findAll('a', class_='br-adClickOut')[0]['href']

            shopdata.append(data)
        except:
            print('DIDNT WORK')
            break
    result = {}
    result['result'] = shopdata
    return result

def search(query):
    address = "http://www.bing.com/search?q=%s" % (urllib.parse.quote_plus(query))

    getRequest = urllib.request.Request(address, None, {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0'})

    urlfile = urllib.request.urlopen(getRequest)
    htmlResult = urlfile.read(20000000)
    urlfile.close()

    soup = BeautifulSoup(htmlResult)

    [s.extract() for s in soup('span')]
    unwantedTags = ['strong', 'cite']
    
    for tag in unwantedTags:
        for match in soup.findAll(tag):
            match.replaceWithChildren()

    results = soup.findAll('li', { "class" : "b_algo" })

    return results

def get_item_info(item):
    links = search("green alternatives to "+item)
    titles = []
    urls = []
    for link in links :
        urls.append(str(link.find('h2').find('a')['href']).replace(" ", " "))
        titles.append(str(link.find('h2').text).replace(" ", " "))
    ts =[]
    us =[]
    i = 0
    for t in titles:
        if any(char.isdigit() for char in t):
            ts.append(t)
            us.append(urls[i])
        i=i+1
    return ts, us

def isrelevant(title, item):
    b = False
    greenwords = ['green', 'eco-friendly', 'sustainable']
    for g in greenwords:
        if g in str.lower(title):
            b = True
    i = ""
    '''
    if item[len(item)-1] =='s':
        i =item[:len(item)-1]
    if i in str.lower(title):
        if b:
            return True
    return False
    '''
    return b
  
def get_relevants(titles, urls, item):
    ind = 0
    us = []
    ts = []
    for t in titles:
        if isrelevant(t, item):
            us.append(urls[ind])
            ts.append(titles[ind])
        ind = ind + 1
    return ts, us

def get_items_from_urls(urls):
    items = []
    for u in urls:
        getRequest = urllib.request.Request(u, None, {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0'})

        urlfile = urllib.request.urlopen(getRequest)
        htmlResult = urlfile.read(2000000)
        urlfile.close()

        soup = BeautifulSoup(htmlResult)
        for h in soup.findAll('h2'):
            b = True
            elem = h
            while(b):
                temp = elem.findChild()
                if(temp==None):
                    b= False
                else:
                    elem = temp
                    
            if len(elem.text)<50:
                items.append(elem.text)
    return items

def filter_items(items):
    ites = []
    b = True
    keywords = ['more', 'support', 'about']
    for i in items:
        if '.' in i:
            ""
        else:
            for k in keywords:
                if k in str.lower(i):
                    b = False
            if b:
                ites.append(i)
            
    return ites

def get_search_results(item, name):
    links = search("Buy eco-friendly "+item+" "+name)
    titles = []
    urls = []
    for link in links :
        urls.append(str(link.find('h2').find('a')['href']).replace(" ", " "))
        titles.append(str(link.find('h2').text).replace(" ", " "))
    
    return titles, urls

def getWebItems(filtered, item):
    webitems = []
    for f in filtered:
        obj = {}
        t, u = get_search_results(f, item)
        obj['name'] = f
        obj['urls'] = u[:3]
        obj['titles'] = t[:3]
        webitems.append(obj)
    return webitems
        

def getWebData(item):
    t, u = get_item_info(item)
    titles, urls = get_relevants(t, u, item)
    its = get_items_from_urls(urls)
    f = filter_items(its)
    items = getWebItems(f, item)
    return items

@app.route('/get_web_data', methods=['GET'])
def get_web_data():
    args = request.args
    item = args['item']
    result = {}
    result['result'] = getWebData(item)
    return result

def get_num_strs(string):
    mess=['g ','Grams', 'grams','kg ', 'kilograms', 'Kilograms', 'kilos']
    carb = ['CO2', 'CO 2', 'carbon', 'Carbon']
    temp = re.findall('\d*\.?\d+', string)
    s = []
    i = 0
    tmp = []
    unit = True
    if len(temp)>0:
        for t in temp:
            try:
                g = string[string.find(t)+len(str(temp[i])):string.find(t)+25]
                a = False
                b = False
                for j in range (0, len(mess)):
                    if (mess[j] in g):
                        a = True
                        if j > 2:
                            unit = False
                
                for j in range (0, len(carb)):
                    if (carb[j] in g):
                        b = True
                
                if a and b:
                    tmp.append(t)
                    s.append(g)
            except:
                g = string[string.find(t)+len(str(temp[i])):string.find(t)+5]
                s.append(g)
            i = i+1
            
    
    return s, tmp, unit

def run_search(keyword):
    links = ""
    links = search('Carbon Footprint of a '+keyword)
    titles = []
    descripts = []
    for link in links :
        titles.append(str(link.find('h2')).replace(" ", " ") + "\n#")
        descripts.append(str(link.find('p')).replace(" ", " "))
    i = 0
    val = 0
    for d in descripts:
        if len(get_num_strs(d)[1])>0:
            val = get_num_strs(d)[1][0]
            break
        i = i+1
    i = 0
    description = ""
    for d in descripts:
        if len(get_num_strs(d)[0])>0:
            description = d[3:-4]
            break
        i = i+1
    return description, val, get_num_strs(descripts[0])[2]

@app.route('/get_footprint', methods=['GET'])
def get_footprint():
    args = request.args
    keyword = args['keyword']
    a, b, c = run_search(keyword)
    result = jsonify({'unit':c, 'description':a, 'value': b})
    return result


@app.errorhandler(500)
def server_error(e):
    # Log the error and stacktrace.
    logging.exception('An error occurred during a request.')
    return 'An internal error occurred.', 500

if __name__=="__main__":
    # For local development:
    #app.run(debug=True)
    # For public web serving:
    app.run(host='0.0.0.0', port=8080, debug=True)
# [END app]

