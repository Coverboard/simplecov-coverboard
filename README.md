simplecov-coverboard
=====================
Helpling Hackathon project
:beer: :pizza: :banana: :monkey:

## What?
*simplecov-coverboard* is a SimpleCov::Formatter which sends your code coverage metrics. 
You can see the metrics on the CoverBoard project dashboard.

## How to install
### Add required gems to your Gemfile
```
gem 'simplecov' 
gem 'simplecov-coverboard', git: https://github.com/coverboard/simplecov-coverboard
```
### Configure your project
Create a file which will contain the uid of your project: .coverboard.yml

```
coverboard:
  uid: 'demo'
```

Set the default SimpleCov formatter

```
SimpleCov.formatter = SimpleCov::Formatter::CoverBoardFormatter
```

### Check the charts
After running your tests check the charts https://aqueous-forest-2696.herokuapp.com/?project=demo

## Contribution
- fork the repository
- create a PR 

## About the author
* [Lautaro](https://www.github.com/lautaro-mazzitelli-helpling)
* [Michał](https://www.github.com/mfranczakhelpling)
* [Yair](https://github.com/yair-helpling)
