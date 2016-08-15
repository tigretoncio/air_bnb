[![Build Status](https://travis-ci.org/MariaRomero/air_bnb.svg?branch=master)](https://travis-ci.org/MariaRomero/air_bnb)
[![Coverage Status](https://coveralls.io/repos/github/MariaRomero/air_bnb/badge.svg?branch=master)](https://coveralls.io/github/MariaRomero/air_bnb?branch=master)
Makers Bnb
---
#Authors
- Sergio Enrech Trillo
- Moises Aday Mesa Ojeda
- Amy Nicholson
- Maria Romero

#Installation
- Fork this repo and in the shell do:
- `cd air_bnb`
- `rackup`
then launch a browser and go to http://localhost:9292

or you can avoid all that and go to:
https://air-bnb-aams.herokuapp.com/

#Technologies
Technologies used (in no particular order):

TDD
- rspec
- capybara
- coveralls report

Server side
- Sinatra
- Ruby

Front-end
- HTML
- CSS
- JavaScript
- Sinatra partials
- ERB

APIs and gems
- mailgun
- bcrypt
- dotenv

Databases / ORM
- postgres
- datamapper

#Use

It should be self-explanatory.  Functions added:

- Users can sign up, login and logout.
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users can name their space, provide a short description of the space, and a price per night.
- Users can provide a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked are not available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.


#Use of technologies and best practices

- Model View Controller used
- Use of Sinatra modular with partials to separate concerns
- Best practices used in terms of storing passwords, (Salted hashes, use of Bcrypt)
- Use of JQuery UI and datepicker to deal with complex calendar functions

#Agile reflection

We feel we have succesfully adopted an agile methodology:

- Intense interaction among the members of the team
- Self-organization with stand-ups as required
- Always having a "working software" version continuosly improved
- Good response to change and continuous development
- Good use of code reuse on the user access management side
- Loads of fun and a sense of achivement
- Good troubleshooting effort when things became messy

<a name="comment">#General comment and reflection

Although at the beginning some individuals of the team were  wary of the way we should work together, and scared of the huge task ahead, people really went on to the task contributing with their technical and soft skills, and it was really amazing what we have accomplished in a week.

It took some time to organise ourselves in pairs, as it was quite complex to make a parallel path for the two pairs to work on, that did not happen until Tuesday mid-day.  However all the interaction within the group cemented the understanding of the team about the task, and built strong relationships.

We specifically asked Amy to become Chief Architect, and it has proven an excellent decision. Amy's way of seeing a path through complexity has made this project a success.  She even has learnt Spanish, and now agrees that it's easier than JavaScript, (no pasa nada, Amy).

Maria has been instrumental in chasing confusion away with the relationship models, and she has been crowned datamapper queen by popular acclamation.  In the last part of the project, she has wildly unleashed her design skills and has tamed CSS in her straight, efficient way.  In the meantime she was dealing with daughter Elena getting sick and all the heroic things mums do on a daily basis.

Aday has found errors that could have taken us months to debug, and report those in a nice way, "are you sure you have added this require here, or that variable there?" In his spare time he has teached HTML and CSS to Sergio and worked in the pub to serve pints to the Makers people.

Special mention goes to Sergio, who has not stopped chatting all week, (most of it in Spanish), and entertained (!?) the team with his (tasteless, perhaps) sheeps jokes, while in the background he was micromanaging the plumber who came to fix a pipe leak. That's what it's called extreme added value, (and multitasking).

We have worked as a team and the result is here. We did not know how to work in an agile way, however we feel we have shown the XP values and we put our strengths together to build a great solution.

The feeling of elation of seeing 50+ tests all passing green and with a 100% coverage is something difficult to emulate elsewhere. We made it happen this week with this project.

You don't like the shiny look of the website?  You consider that the controllers are fat and smelly?  Are you Sandi Metz and would like to make comments about it? Sure, Pull requests are always accepted, (now that we know how to resolve conflict merges :-)
