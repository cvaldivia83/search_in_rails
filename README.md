# Rais Article Search Engine

This is a Ruby on Rails app that creates a real time search bar that looks up for articles in DB. 

It records the user's input in realtime and ultimately display analytics & trends on what people are searching for the most.

The results are ordered per user. 

## App stack

This apps uses the following stack: 
- Postgres
- Tailwind
- Simple_Form_For
- Rack-Attack
- Stimulus
- Faker
- RSpec
- Factory_Bot_Rails

## Performance and Scalability

The main goal for this app is to be scalable and able to handle thousands of requests per hour. 

In order to improve performance and scalability and avoid a pyramid problem I have decided to attack this problem in both front-end and back-end.

### Front End performance

In the front-end I decided to use the debounce technique to control how often the function that records the user input is executed, delaying the execution to save the user query and ip until a specified amount of time had passed. I also implemented a function to calculate an typing speed average from the user and use it to set the waiting time in the debouncing function. 

### Back end performance 

In the back-end I decided to implemenet the gem ```rack-attack``` and its basic configuration to prevent malicious requests, limit the number of requests a user or client can make to a specific resource within a given time grame, and make sure that this app will not be taken down by a misconfigured web scraper. This ensures the application's stability and performance - requests are limited to a 100 requests per minute. 


