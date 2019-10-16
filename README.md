# Roomr | Chat Application
Roomr is a simple 1:1 chat application developed with rails. It utilizes rails 6's ActionCable and asset infrastructure to allow a direct user to user communication.

* Ruby version
  ruby-version 2.6.3

* System dependencies
  - ruby
  - bundler
  - rails
  - redis
  - yarn
  
* Configuration

* Database creation
`rails db:create` creates
  Development Database 'roomr_development' 
  Test Database 'roomr_test' 
`rails db:migrate` generates all the table for the application


* Services (job queues, cache servers, search engines, etc.)
  The application runs a single job queue 'MessageRelay' for broadcasting and rendering messages on the client side. 
  Application also utilizes redis to broadcast all messages through the message queue.

## Documentation
### Wireframe
  Wireframe is available locally demonstrating the UI for the chat application.

### User Story Priotization
  Due to time constraint caused due to the technical conplexity of the ActionCable interface, user story and the regular documentation process had to be shortened to the minimum. 

  All requirements and the project progress have been tracked on local computer and user story and prioritization done on paper.
## Technologies Used

### Rails
  The application utilizes Rails 6 and it's components, like ActionCable and ActionJobs.

## Project Details
### Models
The application uses four model, three models with controller and a message model to store all messages and retrive them as necessary.
* User
* Subscription
* Chats
* Messages

### Devise
Sign Up/In/out and have been used and the user detail page and other forms have been generated with devise_bootstrapped gem. The details page allows the user to edit their details as necessary.

## Project Progress Overview
The following steps were roughly followed towards the completion of the project
1. Chat Application Research (Competitors and tutorials)
2. Sketch rough application
3. User Story and general application structure handling
4. Application Map and Flow
5. Scaffolding and test projects from available resources {github, blogs, herok blogs, DHH's Rails 5 release video, Gorails Forum video series}
6. Class diagram clarified
7. Programming application with specified requirements.

The project due to time constraints could not deliver all the requirements. 
* Invite Other user and only chat with them
* ActionCable for notification

These two requirements required substancial time investment which was used to deliver the code application functionaity of 1:1 chat that was to allow users to chat.

