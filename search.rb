#!/usr/bin/env ruby

require 'curl'
require 'JSON'
require 'pp'
require 'securerandom'

  AGENT_ALIASES = {
    'Windows IE 6' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)',
    'Windows IE 7' => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)',
    'Windows Mozilla' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; en-US; rv:1.4b Gecko/20030516 Mozilla Firebird/0.6',
    'Windows Mozilla 2' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; ru-US; rv:1.4b Gecko/20030516',
    'Windows Mozilla 3' => 'Mozilla/5.0 Windows; U; Windows NT 5.0; en-UK; rv:1.4b Gecko/20060516',
    'Mac Safari' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3',
    'Mac FireFox' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.3) Gecko/20060426 Firefox/1.5.0.3',
    'Mac Mozilla' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.4a) Gecko/20030401',
    'Linux Mozilla' => 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624',
    'Linux Konqueror' => 'Mozilla/5.0 (compatible; Konqueror/3; Linux)',
    'IPhone' => 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3',
    'IPhone Vkontakt' => 'VKontakte/1.1.8 CFNetwork/342.1 Darwin/9.4.1',
    'Google'=>"Googlebot/2.1 (+http://www.google.com/bot.html)",
    "Yahoo-Slurp"=>"Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"

}

curl = CURL.new

proxies = JSON.parse(curl.get('https://happy-proxy.com/fresh_proxies?key=2c862302838ac918'))

# proxies = [{"ip_port"=>"110.164.66.100:3128"},
#  {"ip_port"=>"187.216.222.147:80"},
#  {"ip_port"=>"201.159.180.10:8080"},
#  {"ip_port"=>"183.89.128.141:8080"},
#  {"ip_port"=>"177.223.170.18:80"},
#  {"ip_port"=>"175.138.67.66:8888"},
#  {"ip_port"=>"47.88.0.104:3128"},
#  {"ip_port"=>"46.32.229.76:8000"},
#  {"ip_port"=>"200.8.118.47:8080"},
#  {"ip_port"=>"54.228.244.246:3129"},
#  {"ip_port"=>"177.37.208.227:8080"},
#  {"ip_port"=>"89.28.121.179:8080"},
#  {"ip_port"=>"190.63.174.242:8081"},
#  {"ip_port"=>"193.246.106.100:8888"},
#  {"ip_port"=>"182.89.126.202:8123"},
#  {"ip_port"=>"118.161.36.148:8088"},
#  {"ip_port"=>"128.199.168.143:3128"},
#  {"ip_port"=>"81.255.225.25:3128"},
#  {"ip_port"=>"128.199.133.3:3128"},
#  {"ip_port"=>"183.88.46.173:3128"},
#  {"ip_port"=>"49.72.134.177:8118"},
#  {"ip_port"=>"45.64.97.40:8080"},
#  {"ip_port"=>"180.248.40.110:3128"},
#  {"ip_port"=>"103.43.128.138:8080"},
#  {"ip_port"=>"104.236.156.13:8080"},
#  {"ip_port"=>"194.181.108.54:80"},
#  {"ip_port"=>"104.199.137.182:3128"},
#  {"ip_port"=>"23.92.225.171:4444"},
#  {"ip_port"=>"52.88.183.227:3128"},
#  {"ip_port"=>"45.63.83.164:8080"},
#  {"ip_port"=>"209.40.193.62:3128"},
#  {"ip_port"=>"101.109.73.189:8080"},
#  {"ip_port"=>"177.75.232.3:8080"},
#  {"ip_port"=>"125.212.219.221:3128"},
#  {"ip_port"=>"104.155.230.37:3128"},
#  {"ip_port"=>"198.71.88.116:3128"},
#  {"ip_port"=>"186.147.230.234:8080"},
#  {"ip_port"=>"52.27.37.212:3128"},
#  {"ip_port"=>"50.207.29.88:3128"},
#  {"ip_port"=>"89.46.100.85:3128"},
#  {"ip_port"=>"213.197.62.188:80"},
#  {"ip_port"=>"46.101.228.159:3128"},
#  {"ip_port"=>"110.137.18.107:8080"},
#  {"ip_port"=>"189.27.111.7:8080"},
#  {"ip_port"=>"83.6.160.228:8080"},
#  {"ip_port"=>"79.143.181.111:80"},
#  {"ip_port"=>"203.113.59.7:8080"},
#  {"ip_port"=>"114.26.9.171:8888"},
#  {"ip_port"=>"121.58.199.139:3128"},
#  {"ip_port"=>"194.44.15.58:8080"}]

page = ""

1000.times do |i|
  puts "Request number: #{i+1}"
  # if i % 50 == 0
  #    curl.user_agent_alias = AGENT_ALIASES.keys.sample
  #    curl.proxy(proxies.sample["ip_port"])
  # end
  rnd = SecureRandom.urlsafe_base64(22)
  page = curl.get("https://www.google.ru/search?q=ruby&gws_rd=cr,ssl&ei=#{rnd}")
end

puts page

