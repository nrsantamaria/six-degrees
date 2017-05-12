# _Shoe Store Inventory_

#### _This app will allow users to add shoe stores and shoe brands to a database and modify their information, Friday, May 12, 2017_

#### By _**Nicole Santamaria**_

## Description

_This app will use a ActiveRecord to track shoe stores and shoe brands through a many-to-many relationship. Users will be able to add shoe brands to a specific shoe store. Shoe stores and shoe brands can be modified. This app includes callbacks and validations._

## Specifications:

| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
|goes to homepage| user visits homepage | all stores and brands listed on page|
|clicks on individual store | user goes to the store page | user sees the details of the store inventory |
|clicks on modify/delete store from store edit page | user goes to store modification page | user has options to delete or modify name of store|
|user is on the store modification page | user types in different store name | user taken back to store page with updated store name|
|user is on the store modification page | user clicks button to delete the store | store is deleted|
|user clicks on the individual brand link | user taken to brand page | user can see ability to delete or modify brand|
|clicks on modify/delete brand from brand page | user goes to brand modification page | user sees options to delete or modify name of brand|
|user is on the brand modification page | user types in different brand name | user taken back to brand page with updated brand name|
|user is on the brand modification page | user clicks button to delete the brand | brand is deleted|
|user is on homepage and wants to add brand to a store|clicks on store, selects brand from dropdown|brand is added to a specific store|
|user is on individual store page and wants to remove already added brands|user clicks x button next to brand name|brand is removed from brand list on store page|

## Setup/Installation Requirements

###ACCESS ATOM FILES

* _Ensure connection to the Internet_
* _On a mac using spotlight search type in terminal_
* _Once in terminal enter the following commands to clone the file to your desktop and open the repository:_
```
$ cd desktop
$ git clone https://github.com/nrsantamaria/shoe_store.git
$ cd shoe_store
$ atom .
```
* _This will open all of the files included in the shoe_store folder including Gemfile, Gemfile.lock, app.rb, README.md, views folder, spec folder, public folder, lib folder_
* _To make changes to the text on the page that the user will see you will need to access the files in the views folder._
* _To make changes to the look of the file you will need to access the styles.css file._
* _To make changes to the functions of the form you will need to access the shoe_brand.rb file or shoe_store.rb file. Be sure to make necessary changes to your specs._

###CREATE DATABASE AND TABLES
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

###RUN THE PROGRAM
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

Copyright (c) 2017 **_Nicole Santamaria_**
