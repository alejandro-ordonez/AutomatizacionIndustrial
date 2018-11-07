#####################################
# by Johannes Kinzig (M. Sc.)		#
# https://johanneskinzig.de			#
#####################################

import requests
import BeautifulSoup

## Tested with S7 1212C AC/DC/Rly and FW Version 4.2.1

#########################################
#           Login                       #
#########################################
payload_login = {'Login': 'WebUser', 'Password': '123456789', 'Redirection': ''}
posturl_login = 'https://192.168.178.50/FormLogin'

headers = {
    'Host': '192.168.178.50',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'Accept-Language': 'de,en-US;q=0.7,en;q=0.3',
    'Accept-Encoding': 'gzip, deflate, br',
    'Referer': 'https://192.168.178.50/Portal/Portal.mwsl',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': '45',
    'DNT': '1',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1'
}

session = requests.Session()
login_response = session.post(posturl_login, data=payload_login, headers=headers, verify=False)
print login_response.status_code
print login_response.headers
#print login_response.cookies.get_dict() # will stay empty
webpage =  login_response.content

#########################################
#     Extract authentication Cookie     #
#########################################
webpage_soup = BeautifulSoup.BeautifulSoup(webpage)
auth_cookie_part = webpage_soup.find('input', attrs={'name': 'Cookie'})
auth_cookie_part = str(auth_cookie_part)
auth_cookie = auth_cookie_part.split('"')[5]
print "Authentication cookie: ", auth_cookie

#########################################
#     Set Authentication Cookie         #
#########################################
s7cookies = dict(siemens_ad_session=auth_cookie, coming_from_login='true')

#########################################
# Run Actions (require authentication)  #
#########################################
payload_control = {'"webHMIData".webHMI_DO1_User': '1', '"webHMIData".webHMI_DO0_User': '1'}
usage = session.post('https://192.168.178.50/awp/AnalogInputs/api.io', cookies=s7cookies, data=payload_control, verify=False)
print usage.status_code
print usage.headers
print usage.content

#########################################
#           Logout                      #
#########################################
payload_logout = {'Cookie': auth_cookie, 'Redirection': ''}
posturl_logout = 'https://192.168.178.50/FormLogin?LOGOUT'
logout = session.post(posturl_logout, cookies=s7cookies, headers=headers, data=payload_logout, verify=False)
print logout.status_code
print logout.headers
#print logout.content

