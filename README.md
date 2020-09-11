# Webserver Log Parser

The script takes a log file and returns:
1. List of webpages with most page views ordered from most pages views to less page views
1. List of webpages with most unique page views also ordered

# Requirements

### Ruby version
Ruby 2.6.3

### Required gems
* Sequel
* Sqlite3

Test enviroment:
* RSpec
* FactoryBot
* Simplecov

# How to run
The script can be simply run from terminal with following command:
```bash
ruby parser.rb filename
```
# Features

### Unit tests
Starting from tests, the script test coverage is 99.49%. To run test you need to run command:
```bash
rspec
```
or
```bash
rspec -f doc
Afterwards the coverage report will be automatically generated in the `/coverage` folder and can be viewed in the browser by opening `index.html` file.

### Functionality
The script reads and parses provided text file and prints output. Attached `webserver.log` file produces 2 reports:

#### List of webpages with most page views ordered from most pages views to less page views
```bash
/about/2 90
/contact 89
/index 82
/about 81
/help_page/1 80
/home 78
```
#### List of webpages with most unique page views also ordered
```bash
/contact 23
/help_page/1 23
/home 23
/index 23
/about/2 22
/about 21
```
# What to improve

The script is not perfect. Implemented in a short time can be easily improved. Belows are the steps can be taken to make it better

### Validation
Implemented validation checks only if both strings are present. The first string is a path and can be validated using regular expressions.
Validation can be also improved to cover these cases:
* More than two arguments in the line or more than one whitespace
* Arguments are swapped
* Implement some form of record invalid records

### Command line tool
* Implemented basic help or man page.
* Implemented save results in yaml files.
* Connect with services like Synetry.
