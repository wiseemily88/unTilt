# UnTilt

This is a Turing BackEnd Mod 3 personal project that uses Rails to build a interview management application.

The application is in the beta stages, but it allows HR admins to initiate interviews using standard templates based on companies core competencies and select questions. The application was built referencing Laszlo Bock's book *Work Rules's* best practices for removing unconscious bias during the interview process. The Admin can also select interviewers upon interview creation, which will send an email notification.

Production Site: https://untilt-emily-wise.herokuapp.com/

It is a Ruby on Rails application using Ruby 2.4.1, Rails 5 with Active Record, and a PostgreSQL database.

### Features
* Interviewer can view all open interviews associated to a candidate
* Interviewer can  complete the standard interview template for the candidate
* HR Admin can add a new candidate to the application
* HR Admin can select which interviewer and core competencies for each upcoming interview

### One:
* git clone: https://github.com/wiseemily88/unTilt
* cd unTilt
### Two:
* CLI -> $ bundle install
### Three:
* rake db:create db:migrate db:seed
### Four:
* To start the sever run: rails s
