# Hippocratic
## Inspiration
Hospitals are extremely inefficient in how data is stored and shown to doctors, with paper being the primary means of storing said data. We wanted to streamline this process to make it easier for doctors to see their patients data.

## What it does
Hippocratic uses beacons to calculate a given patients location in the hospital, so that when a patient walks into a doctors office, their data will automatically be shown to the doctor on their phone on an iOS app. The process is streamlined in that when a patient walks in their file automatically appears, and when they leave their data is automatically cleared, but the doctor can search for the data if they would like. 

## How we built it
We simulated beacons on Arduino 101s, and used Intel Edison to simulate patient bracelets. This way, we can assign a beacon to the doctors office, and when the Intel Edison is close to this beacon, we can dynamically update a webpage to show the correct data.

## Challenges we ran into
The hardest part about this hack was trying to figure out how to use hardware on public wifi, as creating a wifi hotspot for the hack would have gotten extremely expensive. Also, flashing the correct linux distro on the Intel Edisons was confusing, as some of the options did not contain access to basic things like python.  This is something we still were not able to figure out. In addition, trying to dynamically update a webpage did not work for us, so for the sake of our demo, we are just using our phones as the basic data viewer. 

## What's next for Hippocratic
We would like to be able to dynamically update a webpage with the actual patients data, as this entire process is transferrable to other fields as well, namely stores -- when a customer walks in, you can have data about them to be able to offer targeted discounts, etc. 
