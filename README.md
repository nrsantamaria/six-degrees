# _Six Degrees_

#### By _**Nicole Santamaria, James Higgins, Nick Powell, Jason Ainsworth**_

## Description

_This app will use a ActiveRecord to track movies and actors through a many-to-many relationship. Users will be able to see the relationship between two actors._

## Technologies Used

* HTML
* CSS
* JavaScript
* Jquery
* Bootstrap
* Postgres
* psql
* Ruby
* Sinatra

### API

* API from [IMDB](http://www.imdb.com/)

## Specifications:

| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
|goes to homepage| user visits homepage | and sees two forms to add two different actors names|
|submit two forms to see the degree| the user inputs two actors | user sees the separation between the two inputted actors|
|clicks on individual movie | user goes to the movie page | user sees the cast of the movie |
|user clicks on the individual actor link | user taken to actor page | user can see all movies the actor has been in |

### Installation

* `$ git clone https://github.com/nrsantamaria/six-degrees.git`
* `$ cd six-degrees`
* `$ bundle install`
* `$ atom .`

### PostgreSQL Integration
```
$ postgres
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
* _In the terminal enter the following commands to start postgres:_
* _run `$ ruby app.rb` in the terminal:_
* _visit `localhost:4567/load-db`_
* _close terminal window that has ruby app.rb after loading desired amount of movies into database_

### Run the Program
```
$ ruby app.rb
```
* _Open your browser and enter `localhost:4567` as the URL path._

### Launching the Project to Heroku



## Known Bugs

_If autocomplete is not working, inspect element and click error message and it will display the actors name that is causing the error_
_Example Brad "Chip" Pope, Rodney "Bear" Jackson._
_Find the actor by their id, and delete the actor from your database._

## Support and contact details

_Please contact Nicole Santamaria at NicoleRSantamaria@gmail.com if you have any questions._

### License

*This software is licensed under MIT license.*

Copyright (c) 2017 **_Nicole Santamaria, James Higgins, Nick Powell, Jason Ainsworth_**

## Home Page
![Home page](/public/img/home-screenshot.png)

## Degrees Page
![Degrees page](/public/img/degree-screenshot.png)

## Movies Page
![Movies page](/public/img/movie-screenshot.png)

## Actors Page
![Actors page](/public/img/actor-screenshot.png)
