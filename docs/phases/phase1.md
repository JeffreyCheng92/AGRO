# Phase 1: User Authentication, Games

## Rails
### Models
* User
* Game

### Controllers
* UsersController (create, new)
* SessionsController (create, new, destroy)
* API::GamesController (create, new, show, destroy, index, edit, update)

### Views
* users/new.html.erb
* session/new.html.erb
* static_pages/root.html.erb

## Backbone
### Models
* Game

### Collections
* Games

### Views
* Games Index (list) --composite view: renders games index items as links
    Alphanumeric links for games beginning with character
    Genre links for games with genre tag
* Games Index Item (list-item)
* Games Show --composite view: renders reviews as well

## Gems/Libraries
