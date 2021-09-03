import requests
from bs4 import BeautifulSoup
from datetime import date
import sys


headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0'
}

today = sys.argv[1]

url = 'http://paper.people.com.cn/rmrb/html/%s-%s/%s/nbs.D110000renmrb_01.htm' % (today[0:4],today[5:7],today[8:10])
html = requests.get(url, headers=headers).content
soup = BeautifulSoup(html, 'lxml')

pages = soup.find_all(attrs={'class': 'swiper-slide'})
page_num = len(pages)
print(page_num)

f = open('/root/down.txt', 'w', encoding='utf-8')
for i in range(1, page_num+1):
        link_url = 'http://paper.people.com.cn/rmrb/images/%s-%s/%s/%02d/rmrb%s%s%s%02d.pdf' % (today[0:4], today[5:7], today[8:10], i, today[0:4], today[5:7], today[8:10], i)
        f.write(link_url + '\n')
f.close()

