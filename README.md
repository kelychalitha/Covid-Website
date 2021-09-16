# Covid-Website
======================================================================================================================================





=====================================================================================================================================


Installment

1. API:

extract
npm i 
nodemon server.js
npm start

2. Mobile Application: 

check your ip ( cmd -> ipconfig)
set your ip in lib/api-services/Connection
static var base_url = "http://your ip:8000";  // port + host
example : 192.168.1.101
full base_url will be like this :  "http://192.168.1.101:8000";
start the emulator & run(shift r)
take the terminal(flutter run)


3. Web Application :

open xampp
start apache server
Copy the web site to the htdocs



Credintials details

1. Admin(CDC) Credintials: Username: admin@helth.lk
                   Passward:12345678






==========================================================================================
==========================================================================================
A scenario for the project 


Center for Disease Control and Prevention (CDC) is the main body in managing the pandemic situations such as COVID-19 in Sri Lanka. With the help of the ministry of health and Public Health Inspectors (PHI) the CDC is planning to establish an internet service where the citizens can report their locations when they are moving one place to another. CDC hired you to develop a web API which can facilitate the below requirements.
i.	Any citizen can become a member through a free online registration.
ii.	The citizens must update their current location when they travel by scanning a QR code at every super market, food outlets, schools, etc.
iii.	The PHI officers monitor the citizens and update the PCR or Antigen test results for each individual. 
iv.	The immediate contacts of the COVID positive patients are then traced by the CDC. 

========================================================================================
==========================================================================================

Minimal Required APIs
•	POST 	/citizens
Citizens and PHIs can register themselves with details including a national ID, name, age, address, current location (latitude and longitude), profession, email, affiliation, password, health status, etc.
•	GET	/citizens/:nid
PHI or CDC officers can collect the details of any citizen.
•	PUT	/citizens/:nid
Individual citizens should be able to update their current locations.
•	PUT	/citizens/:nid
While the PHIs should be able to update the citizen’s health status (such as COVID positive or negative, deceased, recovered, etc.)
•	DELETE	/citizens/:nid
The CDC staff can deactivate an individual’s account if the patient is deceased.
•	GET	/citizens/:nid/contacts
The CDC staff should be able to collect information about contacts of any citizen.

===========================================================================================
