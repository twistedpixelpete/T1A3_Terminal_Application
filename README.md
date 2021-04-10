# whats-on-mel

## a ruby terminal app

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

## Dependencies

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
The activity class is called from `main.rb` to run the app.

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
```

Method to add to favorites

```ruby
clear()
```

Method to clear the screen

```ruby
connection?()
```

Method to check there is an internet connection

```ruby
delete_favorite(index)
```

Method to delete from favourites

```ruby
delete_selection(deleted_favorite)
```

Method to process delete selection

```ruby
display_favorites()
```

Method to display the favorites list

```ruby
display_today_activity_name()
```

Method to display today titles

```ruby
display_weekend_activity_name()
```

Method to display weekend titles

```ruby
fav_saved_return()
```

Method to display options after favorite saved

```ruby
fav_saved_selection(return_selection)
```

Method to process fav saved return selection

```ruby
favorite_check()
```

Method to check if favorite exists in the list

```ruby
favorite_saved()
```

Method to verify favorite is saved

```ruby
favorites_header()
```

Method to display the favourites header

```ruby
favorites_menu()
```

Method to display the favorites menu

```ruby
leave_app()
```

Method to leave the app

```ruby
leave_header()
```

method to display the leave header

```ruby
line_divider()
```

Method to display the line divider

```ruby
load_data(file_path)
```

Method to load saved data

```ruby
main_menu()
```

Method to display the main menu

```ruby
offline_header()
```

method to display the leave header

```ruby
process_favorites()
```

Method to process the favorites list for the menu

```ruby
process_today_activities()
```

Method to process the today activity list for the menu

```ruby
process_weekend_activities()
```

Method to process the weekend activity list for the menu

```ruby
run()
```

Method to run the app

```ruby
run_argv()
```

Method to run in ARVG mode

```ruby
run_normal()
```

Method to run in normal mode

```ruby
run_offline()
```

Method to run offline

```ruby
scrape_today()
```

Method to scrape website for whats happening today in Melbourne

```ruby
scrape_weekend()
```

Method to scrape website for whats happening on the weekend in Melbourne

```ruby
today_header()
```

Method to display the today section header

```ruby
today_menu()
```

Method to display the today menu

```ruby
today_return_menu()
```

Method to display today return menu

```ruby
today_return_selection(return_selection)
```

Method to process return selection

```ruby
today_selection(chosen_today_activity)
```

Method to receive the today selection

```ruby
weekend_header()
```

Method to display the weekend header

```ruby
weekend_menu()
```

Method to display the weekend menu

```ruby
weekend_selection(chosen_weekend_activity)
```

Method to receive the weekend selection

```ruby
welcome_header()
```

Method to display the welcome header

### Future Expansion

We were given roughly 1 week to create an app for this assignment so I ran out of time to do all that I wanted. Things I may add in the future are:

- email of favorites list capability
- user log in
- store all last scraped activities
- additional catagories to search
