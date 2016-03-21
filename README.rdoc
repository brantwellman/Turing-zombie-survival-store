# Aberzombie & Fitch
## Built with Ruby on Rails

### Authors
[Jamie Crockett](https://github.com/jecrockett), [Penney Garrett](https://github.com/PenneyGadget), [Brant Wellman](https://github.com/brantwellman)

This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io).

### Overview

This Rails application is a marketplace for all your post-apocalypse needs. A user can create a cart full of necessities, create an account, and pay with Stripe payment.

### Live Version

You can find a live version of this application on Heroku at: [https://aberzombie-and-fitch.herokuapp.com/](https://aberzombie-and-fitch.herokuapp.com/)

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/brantwellman/Turing-zombie-survival-store.git`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:migrate db:seed` to set up the postgres database and seed it with items for purchase.
  5. Run the application in the dev environment by running `rails s`

### App Features

The app is integrated with a test version of Stripe for mock-processing of payment at checkout.

### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rake test` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

The project also utilizes the [simplecov gem](https://github.com/colszowka/simplecov) for quick statistics on code coverage.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.

### Project Outline

The original project description can be found [here](https://github.com/turingschool/curriculum/blob/master/source/projects/little_shop.markdown)
