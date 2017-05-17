# _Six Degrees_

#### _This app will allow users to view movies and actors in a database and modify their information, Wednesday, May 17, 2017_

#### By _**Nicole Santamaria, James Higgins, Nick Powell, Jason Ainsworth**_

## Description

_This app will use a ActiveRecord to track movies and actors through a many-to-many relationship. Users will be able to see the relationship between two actors._

## Specifications:

| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
|goes to homepage| user visits homepage | all movies and actors listed on page|
|clicks on individual movie | user goes to the movie page | user sees the cast of the movie |
|user clicks on the individual actor link | user taken to actor page | user can see ability to delete or modify actor|

## Setup/Installation Requirements

### Access Atom Files

* _Ensure connection to the Internet_
* _On a mac using spotlight search type in terminal_
* _Once in terminal enter the following commands to clone the file to your desktop and open the repository:_
```
$ cd desktop
$ git clone https://github.com/nrsantamaria/six-degrees.git
$ cd six-degrees
$ atom .
```
* _This will open all of the files included in the six-degree folder including Gemfile, Gemfile.lock, app.rb, README.md, views folder, spec folder, public folder, lib folder_
* _To make changes to the text on the page that the user will see you will need to access the files in the views folder._
* _To make changes to the look of the file you will need to access the styles.css file._
* _To make changes to the functions of the form you will need to access the actor.rb file or movie.rb file. Be sure to make necessary changes to your specs._

### Create Database and Tables
* _In the terminal enter the following commands to start postgres:_

```
$ postgres
```
* _Open another tab in the terminal enter the following commands to start the databases needed for this program:_

```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

### Run the Program
* _Navigate to the repo on your desktop and run the following in a new tab in the terminal to start the sinatra server:_

```
$ ruby app.rb
```
* _Open your browser and enter `localhost:4567` as the URL path._

## Known Bugs

_No known bugs._

## Support and contact details

_Please contact Nicole Santamaria at NicoleRSantamaria@gmail.com if you have any questions._

## Technologies Used

* HTML
* CSS
* Bootstrap
* Postgres
* Ruby
* Sinatra

### License

*This software is licensed under MIT license.*

Copyright (c) 2017 **_Nicole Santamaria, James Higgins, Nick Powell, Jason Ainsworth_**
