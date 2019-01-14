Tournament
===========

Software that can be used to manage tournament scoring - prepare and fill tournament schedule. User can enter list of teams. Together 16 teams are participating. Teams by random are split in 2 divisions – A and B (8 teams in each). In each division teams play each against other. The best 4 teams from each division meet in Play-off. Play-off initial schedule is made by principle - best team plays against worst team. The winning team stays to play further but the losing team is out of the game. Overall winning team is the one who wins all games in play-off.

# Demo
https://tournament-test.herokuapp.com/

# Requirements
- ruby 2.5.1
- postgresql 9.x

# How to run locally
- clone this repo
- `./bin/setup`
- `rails s`

# Development
- fork this repo
- `bundle install`
- make changes
- `rspec` ensure tests are passing
- commit && create Pull Request
