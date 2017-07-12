# Customers Json Exercise

[![Build Status](https://travis-ci.org/amrabdelwahab/intercom_customers_exercise.svg)](https://travis-ci.org/amrabdelwahab/intercom_customers_exercise)

[![Coverage Status](https://coveralls.io/repos/github/amrabdelwahab/intercom_customers_exercise/badge.svg?branch=master)](https://coveralls.io/github/amrabdelwahab/intercom_customers_exercise?branch=master)


## Problem Description

You can check the entire context [here](https://blog.intercom.com/how-we-hire-engineers-part-1/) 

We have some customer records in a text file (customers.json) -- one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office for some food and drinks on us.

 Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

* You can use the first formula from this [Wikipedia article](https://en.wikipedia.org/wiki/Great-circle_distance) to calculate distance. Don't forget, you'll need to convert degrees to radians.
* The GPS coordinates for our Dublin office are 53.3393,-6.2576841.
* You can find the Customer list [here](https://gist.github.com/brianw/19896c50afa89ad4dec3).

## To setup the project locally

Clone the repository and run
```
bundle install
```

## To run the project and get the results
```
ruby app.rb
```

## To Run the tests
```
bundle exec rspec
```
