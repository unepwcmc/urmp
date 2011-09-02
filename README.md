# URMP (a.k.a Pilot Toolkit for Multiple Benefits – draft version)
Pretty standard, simple *Rails 3* application.

It is backed by *rails_admin* for user admin, which is configured in config/initialisers/

It currently has full unit and functional test coverage, which you can run with `guard init`

# Requirements
All gems are bundle packaged, please install with `bundle install --path vendor`

# Deployment
The app is deploy to the standard brightbox staging and production servers. The app is currently awaiting
public release, so disables google indexing in robots.txt, to renable it, simply remove the after_deploy
disable_robots task in production.rb

