simplecov-coverboard
=====================

:beer: :pizza: :banana: :monkey:

## What?
*simpleCov-coverboard* is a SimpleCov::Formatter which sends your code coverage metrics. 
Based on the metrics you can see a de

## How to install
### Add required gems to your Gemfile
```
gem 'simplecov' 
gem 'simplecov-coverboard', git: https://github.com/lautaro-mazzitelli-helpling/simplecov-coverboard
```
### Configure your project
Create a file which will contain the uid of your project: .coverboard.yml

```
coverboard:
  uid: 'demo'
```

Set up your the default Simplecov formater

```
SimpleCov.formatter = SimpleCov::Formatter::CoverBoardFormatter
```

### Check the charts
https://aqueous-forest-2696.herokuapp.com/?project=demo

## About the author
* [Lautaro](https://www.github.com/lautaro-mazzitelli-helpling)
* [Michał](https://www.github.com/mfranczakhelpling)
* [Yair](https://github.com/yair-helpling)
