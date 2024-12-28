# README

PET project `Babbler` for trying and testing Rails Turbo.
Something similar to twitter.

### Next steps:
- [x] Add basic functionality with tests
- [x] Add a new logo
- [x] Add docker support
- [x] Add CI/CD
- [ ] Deploy to Kamal
- [x] Move flash messages to a new place
- [x] Replace font-awesome with heroicon
- [x] Add about me
- [ ] Add pages for 'My tweets', user profile with his tweets
- [ ] Add liked tweets
- [ ] Add follows
- [ ] Add profile settings for viewing profile
- [ ] Add user roles, admin panel
- [ ] Add nested tweet comments
- [ ] Add site settings
- [ ] Add feature flags
- [ ] Add AI tweet and comments generator
- [ ] Add admin panel for sheduled jobs
- [ ] Add AB tests


#### Docker
Run
```
docker build .
docker-compose up --build
# docker-compose down --volumes # for removing
```

#### For development
Create `.env.development` and `.env.test` with your fields for running server and specs.