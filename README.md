# COP4655-Mobile-App-Dev-Group-Project
===
# APP_NAME_HERE

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

[Provide a brief description of your app, its purpose, and functionality.]

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Entertainment/Social
- **Mobile:** It will be desgined as a mobile first iOS app
- **Story:**  People waste time scrolling trying to decide what to watch. Our application solves this by giving quick, trusted, community-based ratings, helping users instantly decide if something is worth their time.
- **Market:** Movie watchers, TV fans, young adults, social media users.
- **Habit:** Opened frequently (after watching content or browsing for something new)
- **Scope:** Moderate scope; Core features are manageable for a semester.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can register and log in
* User can search for movies and TV shows
* User can view movie/TV show details (title, description, rating, poster)
* User can rate a movie or show
* User can view average ratings from other users
* User can view a list of popular or trending content

**Optional Nice-to-have Stories**

* User can leave written reviews/comments
* User can follow friends and see their ratings
* User can create a watchlist
* User can receive notifications when friends rate something
* User can filter by genre, popularity, or rating
* User can see personalized recommendations

### 2. Screen Archetypes

- [ ] [**Screen Name, e.g., Login Screen**]
* [Required User Feature: User can log in.]
- [ ] [**Another Screen Name**]
* [Associated required user story]
...
...
...

### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] [First Tab, e.g., Home Feed]
- [ ] [Second Tab, e.g., Profile]
...
...
...

**Flow Navigation** (Screen to Screen)

- [ ] [**Home Screen**]
  * Leads to [**Detail Screen**] when user taps a movie or show
- [ ] [**Search Screen**]
  * Leads to [**Detail Screen**] when user taps a movie or show
- [ ] [**Detail Screen**]
  * Leads to [**Login Screen**] if user tries to rate while not logged in
- [ ] [**Login Screen**]
  * Leads to [**Detail Screen**] after successful login
- [ ] [**Sign Up Screen**]
  * Leads to [**Detail Screen**] after account creation


## Wireframes

[Add picture of your hand sketched wireframes in this section]

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models

[User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id       | UUID   | unique id for the user post (default field)  |
| email    | String | user's email for login                       |
| password | String | user's password                              |                      


[Movie]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id       | Int    | TMDB movie id                                | 
| title    | String | movie title                                  |
| description| String | movie overview                             |
| posterURL| String | link to poster image                         | 
| releaseDate| Date | movie release date                           |
| tmdbRating| Float | third party rating                           |

[TVShow]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id       | Int    | TMDB tv show id                              |
| title    | String | show title                                   |
| description| String| show overview                               |
| posterURL| String | link to poster image                         |
| firstAirDate| Date| first air date                               |
| tmdbRating| Float | initial third-party rating                   |


[Review]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id       | UUID   | unique review id                             |
| userId   | UUID   | references User                              |
| mediaId  | Int    | references movie or tv show id               |
| rating   | Float  | numerical rating                             |
| comment  | String | written review text                          |
| createdAt| DateTime| review submission date                      |

### Networking

TMDB API Requests
- `[GET] /trending/movie/day` - to retrieve trending movies
- `[GET] /trending/tv/day` - to retrieve trending TV shows
- `[GET] /search/movie` - to search for movie by title
- `[GET] /search/tv` - search for tv shows by title
- `[GET] /movie/{id}` - retrieves movie details
- `[GET] /tv/{id}` - retrieves tv show details

Supabase Requests
- `[POST] /auth/signup` - create new user account
- `[POST] /auth/login` - authenticate existing user
- `[GET] /reviews/{mediaId}` - retrieve all reviews for a movie or show
- `[POST] /reviews` - submit a rating and written review
- `[PUT] /reviews/{reviewId}` - edit existing review
- `[DELETE] /reviews/{reviewId}` - delete review
