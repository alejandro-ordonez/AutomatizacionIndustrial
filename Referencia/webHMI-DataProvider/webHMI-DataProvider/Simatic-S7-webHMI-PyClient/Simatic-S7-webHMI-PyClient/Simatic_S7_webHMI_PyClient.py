#####################################
# by Johannes Kinzig (M. Sc.)		#
# https://johanneskinzig.de			#
#####################################

## Tested with S7 1212C AC/DC/Rly and FW Version 4.2.1

import requests
import BeautifulSoup
import json
from Tkinter import *
import ttk

class MainS7DemoApp():
    def __init__(self, master):
        """ Init application (GUI) """
        master.title("S7-Demo-WebAPI")
        master.resizable(width=True, height=True)
        master.grid_columnconfigure(0, weight=1)
        master.grid_rowconfigure(0, weight=1)
        #master.geometry("200x200")
        self.initWidgets(master)
        self.S7PLC = S7ApiClient('192.168.178.50', 'https://192.168.178.50/awp/AnalogInputs/api.io', 's71212cert.crt')

    def initWidgets(self, master):
        """ Initialize all required widgets """
        ttk.Button(master, text = "Get Values", command=self.requestData).grid(row = 0, column = 0)
        
        ########################################
        # Labels for temperature               #
        ########################################
        ttk.Label(master, text = "Temp 0: ").grid(row = 1, column = 0)
        ttk.Label(master, text = "Temp 1: ").grid(row = 2, column = 0)
        self.temp0_value = StringVar()
        self.temp1_value = StringVar()
        ttk.Label(master, textvariable = self.temp0_value).grid(row = 1, column = 1)
        ttk.Label(master, textvariable = self.temp1_value).grid(row = 2, column = 1)
        self.temp0_value.set('??')
        self.temp1_value.set('??')

        ########################################
        # Labels for Digital Outputs           #
        ########################################
        ttk.Label(master, text = "DO 0: ").grid(row = 3, column = 0)
        ttk.Label(master, text = "DO 1: ").grid(row = 4, column = 0)
        self.DO0_value = StringVar()
        self.DO1_value = StringVar()
        ttk.Label(master, textvariable = self.DO0_value).grid(row = 3, column = 1)
        ttk.Label(master, textvariable = self.DO1_value).grid(row = 4, column = 1)
        self.DO0_value.set('??')
        self.DO1_value.set('??')

        ########################################
        # PLC Digital Outs -- Buttons toggle   #
        ########################################
        ttk.Button(master, text = "Toggle DO 0", command = self.sendData).grid(row = 5, column = 0)
        ttk.Button(master, text = "Toggle DO 1", command = self.sendData).grid(row = 5, column = 1)

        ########################################
        # PLC Digital Outs                     #
        ########################################
        self.do0 = False
        self.do1 = False

    def requestData(self):
        """ Request data from the PLC """
        ########################################
        # depending on the access rights which #
        # are set in the PLC, reading requires #
        # other credentials than writing       #
        ########################################
        self.S7PLC.login('WebUser', '123456789')
        do0, do1, temp0, temp1 = self.S7PLC.getData()
        self.DO0_value.set(str(do0))
        self.DO1_value.set(str(do1))
        self.temp0_value.set(str(temp0))
        self.temp1_value.set(str(temp1))
        self.S7PLC.logout()

    def sendData(self):
        """ Send data to the PLC to influence behavior """
        ########################################
        # depending on the access rights which #
        # are set in the PLC, reading requires #
        # other credentials than writing       #
        ########################################
        self.S7PLC.login('WebUser', '123456789')
        #######################
        # togle both vars     #
        #######################
        self.do0 = not(self.do0)
        self.do1 = not(self.do1)
        self.S7PLC.postData(self.do0, self.do1)
        do0, do1, temp0, temp1 = self.S7PLC.getData()
        self.DO0_value.set(str(do0))
        self.DO1_value.set(str(do1))
        self.temp0_value.set(str(temp0))
        self.temp1_value.set(str(temp1))
        self.S7PLC.logout()



class S7ApiClient():
    def __init__(self, host, uri_api, path_to_certfile):
        """ Init S7ApiClient """
        self.url_post_login = 'https://' + str(host) + '/FormLogin'
        self.url_post_logout = self.url_post_login + '?LOGOUT'
        self.url_api = str(uri_api)
        self.s7certfile = str(path_to_certfile)
        self.auth_cookie = None
        self.s7auth_cookie = None
        ########################################
        # setup http header, otherwise S7 will #
        # reject the login request             #
        ########################################
        self.http_headers = {
            'Host': '',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': 'de,en-US;q=0.7,en;q=0.3',
            'Accept-Encoding': 'gzip, deflate, br',
            'Referer': '',
            'Content-Type': 'application/x-www-form-urlencoded',
            'Content-Length': '45',
            'DNT': '1',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1'
            }
        self.http_headers['Host'] = str(host)
        self.http_headers['Referer'] = 'https://' + str(host) + '/Portal/Portal.mwsl'

    def login(self, username, password):
        """ Log into the PLC """
        print("Logging in ...")
        session = requests.Session()
        payload_login = {'Login': str(username), 'Password': str(password), 'Redirection': ''}
        response = session.post(self.url_post_login, data=payload_login, headers=self.http_headers, verify=self.s7certfile)
        print('Status Code: ' + str(response.status_code))
        webpage_html = response.content
        
        ########################################
        # extract authentication cookie which  #
        # is hidden somewhere in the response  #
        # payload (instead of http header)     #
        ########################################
        webpage_soup = BeautifulSoup.BeautifulSoup(webpage_html)
        auth_cookie_part = webpage_soup.find('input', attrs={'name': 'Cookie'})
        auth_cookie_part = str(auth_cookie_part)
        try:
            self.auth_cookie = auth_cookie_part.split('"')[5]
            print("Authentication cookie: ", self.auth_cookie)
            print("Login Done")
        except:
            print("Login failed!")
        
        ########################################
        # prepare cookie for next request      #
        ########################################
        self.s7auth_cookie = dict(siemens_ad_session=self.auth_cookie, coming_from_login='true')

    def logout(self):
        """ Log out after request is finished """
        payload_logout = {'Cookie': self.auth_cookie, 'Redirection': ''}
        session = requests.Session()
        logout = session.post(self.url_post_logout, cookies=self.s7auth_cookie, headers=self.http_headers, data=payload_logout, verify=self.s7certfile)
        print('Status Code: ' + str(logout.status_code))
        print('Logout Done')

    def getData(self):
        """ Request data from the PLC (states, variables, values, etc.) """
        session = requests.Session()
        payload = session.get(self.url_api, cookies=self.s7auth_cookie, verify=self.s7certfile)
        print("Status Code: " + str(payload.status_code))
        content_json = json.loads(payload.text)
        print("Raw payload received: " + str(content_json))
        return content_json['DO0'], content_json['DO1'], content_json['temp0'], content_json['temp1']

    def postData(self, do0, do1):
        """ Influence PLC variables and states """
        session = requests.Session()
        payload = {'"webHMIData".webHMI_DO0_User': str(do0).lower(), '"webHMIData".webHMI_DO1_User': str(do1).lower()}
        action = session.post(self.url_api, data=payload, cookies=self.s7auth_cookie, verify=self.s7certfile)
        print("Status Code: " + str(action.status_code))

if __name__ == '__main__':
    root = Tk()
    root.columnconfigure(0, weight=2)
    root.rowconfigure(0, weight=2)
    app=MainS7DemoApp(root)
    root.mainloop()