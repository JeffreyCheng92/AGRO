# AGRO

http://agro-app.herokuapp.com/

## Minimum Viable Product
AGRO (Authentic Game Reviews Online) is a clone of Yelp built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [X] Create accounts
- [X] Create sessions (log in)
- [X] Create games
- [X] Create users
- [X] Create reviews/posts
- [ ] Search for games by title

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Games Creation and Viewing (~2 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to add new games using
a simple text form in a Rails view. I will add API routes to serve games data
as JSON and add Backbone models/collections to fetch said data. Users will be
able to add games to the index at the end of this phase. The most important part
of this phase will be pushing the app to Heroku and ensuring that everything
works before moving onto phase 2.

[Details][phase-one]

### Phase 2: User Profile Page (~1 days)
I will add Backbone models and collections(?) for the user to view the profile
show page. By the end of this phase, users will be able to view their own
profile and edit their description. I may add for details for the user to edit
as I think of them and add corresponding columns in the database.

[Details][phase-two]

### Phase 3: Editing and Displaying Reviews (~2 days)
Within the games show page, I will render each individual review (perhaps a
maximum of 5?) beneath it. Reviews may be nested under each individual game
making data easier to manage. Users writing the reviews will be able to assign a
numerical rating and the game will average all those ratings and display that as
the overall rating. There will be a link to allow users to write reviews on the
game show page. Guest user reviews will not persist and are automatically
deleted after 30 days to ensure "authentic" reviews.

[Details][phase-three]

### Phase 4: Game Search Bar and CSS (~1-2 days)
I'll need to add `search` routes to both the Games controllers. The search bar
will have an active listener on it so it will modify the index as each
character is typed in and narrow the game list items. The application will go
through CSS styling to make sure the site is functional and aesthetically
pleasing to users.

[Details][phase-four]

### Phase 5: TBD - Bonus Features (~2 days)
Will do one of the bonus features, most likely review history or 'like' button
first. Will do more if time allows.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Screenshots for games
- [ ] "Like" button and counter for reviews
- [ ] Pagination/infinite scroll on games show
- [ ] Review history (on profile page)
- [ ] User-to-user private messages
- [X] User avatars
- [ ] Forum for users with defined subforum categories

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
