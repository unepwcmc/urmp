# URMP (a.k.a Pilot Toolkit for Multiple Benefits – draft version)

It is backed by [rails_admin](https://github.com/sferik/rails_admin) for user admin, which is configured in `config/initialisers/`.

## Development

It currently has full unit and functional test coverage, which you can run with `bundle exec guard`.

## Requirements

All gems are bundle packaged, install with `bundle install --path vendor`.

## Deployment

The app is deployed to the standard brightbox staging and production servers. The app is currently awaiting
public release, so disables google indexing in robots.txt, to renable it, simply remove the after_deploy
disable_robots task in production.rb

## New website deploy and data migration

Because of changes in data structure, there was made a dump of
existing production data to the csv/json files, and stored in db/seeds/ dir.

There is a rake task that restores it:

  rake urmp:restore_all

This task creates demo user, and loads existing data, that was exported from prod env:
* principles
* criteria
* resources
* resource_links
