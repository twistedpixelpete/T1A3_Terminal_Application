# whats-on-mel

---

The termainal application `whats-on-mel` is a ruby application that lists activities that are happening in and around the city of Melbourne, Australia.
You can check what is happening on the current day, or the coming weekend.
You can store activities in a list to view later.
Created for an assignment after starting to learn ruby.

## Installation

You will require `bundle` to install this app. Most systems already have this installed but you can check by running `gem install bundle`

Navigate to the `src` directory

And then execute

`bundle`

And then execute

`./whats-on-mel.sh`

## Dependancies

This app requires the following to run correctly. These will have been installed with the previous `bundle` execution.

`tty-prompt`
Used to implement the menu system throughout the app.

`nokogiri`
For sorting HTML so it can be targeted and information displayed to the user.

`httparty`
To read the body of HTML from a web page.

`colorize`
To add some colour to text throughout the app.

`netchecker`
To query a website to check the network connection of the computer.

`json`
You must `require jason` to be able to both read and store the data in the json format.

## Command line Arguments

The following command line arguments are accepted.

```ruby
-today, -t    Displays todays activities
-weekend, -w  Displays weekend activities
-all, -a      Displays all activities
-new, -n      Add your own favourite
-online, -o   Checks internet connection
-help, -n     Add display options
```

## The Activity Class

This Class contains all the methods to run the application.

### Attributes

```ruby
active[RW]
chosen_today_activity[R]
fav_list[R]
processed_today[R]
selected_activity[RW]
today_activities[R]
weekend_activities[R]
```

### Public Class Methods

Initialise class variables and scrape website for current information

```ruby
new(file_path)
```

### Public Instance Methods

```ruby

add_to_favorites(new_fav)
Method to add to favorites

clear()
Method to clear the screen

connection?()
Method to check there is an internet connection

delete_favorite(index)
Method to delete from favourites

delete_selection(deleted_favorite)
Method to process delete selection

display_favorites()
Method to display the favorites list

display_today_activity_name()
Method to display today titles

display_weekend_activity_name()
Method to display weekend titles

fav_saved_return()
Method to display options after favorite saved

fav_saved_selection(return_selection)
Method to process fav saved return selection

favorite_check()
Method to check if favorite exists in the list

favorite_saved()
Method to verify favorite is saved

favorites_header()
Method to display the favourites header

favorites_menu()
Method to display the favorites menu

leave_app()
Method to leave the app

leave_header()
method to display the leave header

line_divider()
Method to display the line divider

load_data(file_path)
Method to load saved data

main_menu()
Method to display the main menu

offline_header()
method to display the leave header

process_favorites()
Method to process the favorites list for the menu

process_today_activities()
Method to process the today activity list for the menu

process_weekend_activities()
Method to process the weekend activity list for the menu

run()
Method to run the app

run_argv()
Method to run in ARVG mode

run_normal()
Method to run in normal mode

run_offline()
Method to run offline

scrape_today()
Method to scrape website for whats happening today in Melbourne

scrape_weekend()
Method to scrape website for whats happening on the weekend in Melbourne

today_header()
Method to display the today section header

today_menu()
Method to display the today menu

today_return_menu()
Method to display today return menu

today_return_selection(return_selection)
Method to process return selection

today_selection(chosen_today_activity)
Method to receive the today selection

weekend_header()
Method to display the weekend header

weekend_menu()
Method to display the weekend menu

weekend_selection(chosen_weekend_activity)
Method to receive the weekend selection

welcome_header()
Method to display the welcome header


```
