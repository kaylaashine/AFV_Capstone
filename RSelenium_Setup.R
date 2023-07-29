library(RSelenium)
library(wdman)
library(netstat)
library(binman)

# packages needed to setup RSelenium

selenium()

# run above code to download all drivers needed for RSelenium to work

selenium_object <- selenium(retcommand = T, check = F)

# retcommand tells us where drivers are installed, check will check if R Drivers are installed but we don't need that because we just installed them so we set that to FALSE.

selenium_object

# viewing the object will print out locations of each driver. Now open file explorer, navigate to the Chrome driver location, and delete each LICENSE file for each of the Chrome driver versions. This is a CRITICAL STEP.
# any time a new version of the Chrome driver comes out, we will need to delete the LICENSE file the same way as detailed above

list_versions("chromedriver")

# in order to create remote_driver object below, we need to know our current Chrome version. type "chrome://version" in url box.
# in this instance, the latest chrome driver hasn't been released yet (115) and I am running the latest version of Chrome...
# instead of going through all of the trouble to downgrade my version of Chrome, I was able to find the test version of this driver. 
# downloaded it and carefully placed it in the correct folder (I had to make a new folder w/ the version name, delete license file, etc.)
# ran the list_versions function again on "chromedriver" and made sure the new one I downloaded showed up...it did!!

remote_driver <- rsDriver(browser = "chrome",
                          chromever= "115.0.5790.102",
                          verbose = F,
                          port = free_port())

# this code sets up the server. For your Chrome driver, you don't need to match everything correctly. Really only the first 3 numbers, which is where I ran into my issue as at the time of making this, only ver 114 was out.
# I was able to successfully use the test version for this, so don't be afraid to give that a try if you run into the same issue. Make sure you are only using test versions that are marked as stable.
# verbose is set to false to suppress any messages that could appear while connecting to Selenium
# port is set to free_port which is a part of the netstat package. It finds a free port on your computer to open up a server.
# if your code is ran successfully, a new Chrome window should open. It will have a header that reads "Chrome is being controlled by automated test software"
# congrats you did the thing!!!

remote_driver$server$stop

# this closes the server when you are done using rSelenium.



