# NASA Language Finder

**Task to build interactive page that shows the languages NASA uses in their repositories.**

## Installation Instructions

```
$ git clone https://github.com/acookson91/NASA-Language-Finder
$ cd NASA-Language-Finder/
$ bundle install
```

## Running the App

Run the following command.

```
rails s
```

** GitHub has a limited amount of requests per IP address **

To resolved this register this app [here](https://github.com/settings/developers).

Once you have your Client ID and Client Secret, create a .env file in your root directory.

```
touch .env
```

Add your client ID and client secret to this file in the following format.

```
export CLIENT_ID=YOUR_ID_HERE
export CLIENT_SECRET=YOUR_SECRET_HERE
```

## Technologies used

I used Rails with Cucumber for testing, Webmock and VCR to mock API calls in feature tests and HTTParty for making API requests.

## Features

A 2 page application that shows NASA repositories on the first page with descriptions. Click on the repositories name to see the language details in percentage.

## Design approach and Challenges

I started by creating 2 spikes. One to access the Github API with HTTParty, then in addition to this I created 3 tests in cucumber to get an understanding in how to use it for testing.

Once I'd used cucumber, I felt confident I could use it for feature testing this website using behaviour driven development. I didn't know how to mock API calls for cucumber but understood this was important as NASA could update there repositories, causing feature tests to fail as information may not match my test specs.

To avoid this I used VCR with Webmock to record the first API calls. This would then be used in testing instead of the real API call. Understanding that my feature tests would not pick up on changes to structure of the github API this could be a problem, but from my understanding Github use API versioning meaning if they do amend the structure they will change the version, leaving our API structure unaffected.

I would have liked to create webhooks from the NASA's repositories, to store and update information as NASA updated or added new repositories. This would keep the app quick having information posted straight to the database, yet this wasn't possible as only the owner of the repository can set up a webhook.

Originally, I wanted to show the repository name and language details on just one page but as I'm making a number of requests each time the homepage is loaded, it would result in slow page load. This was caused by the app grabbing each of the repos names, visit the language URL and return the data. Doing this not only meant slow page load but also over 20 API requests on each load meaning API request limits could be reached easily.

To avoid this I decided to first grab only the repositories names and descriptions, which meant quick page load making one API request. When the user wants to see the language details of a certain repository, it would one API call to retrieve the languages for that exact repository.  

## Future developments and improvement

As this was my first time I used cucumber, I feel that I could improved a lot using arguments in some tests allowing them to be reused. This would perhaps mean feature test would be quicker and clearer.

Using no models and redirects, meant I couldn't see where I could use RSpec for unit testing. I tried to test drive my RepoController methods before I made them private but found I was unable to.

Last I kept the look of the website clean using basic CSS, but would have liked to use SASS and added additional styling.
