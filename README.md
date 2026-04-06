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

[app name] is a community-driven iOS mobile application that allows users to search, rate, and review movies and TV shows. The app helps users quickly decide what to watch by providing aggregated community ratings and reviews.

Users can browse trending movies and shows without creating an account. Ratings initially come from the TMDB API and appear greyed out to indicate they are temporary placeholder ratings. As real users submit their own ratings and written reviews, the community score replaces the placeholder rating and becomes the primary score displayed.

The app is built natively using Swift and SwiftUI in Xcode with a fully programmatic UI. Supabase is used for backend authentication and database storage, while TMDB API provides movie and TV show data such as titles, posters, descriptions, and initial ratings.

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

- [ ] [**Home Screen**]
* User can view trending movies
* User can view trending TV shows
* User can view top rated content
* User can select a movie or show to view details
- [ ] [**Search Screen**]
* User can search for movies and TV shows by title
* User can view search results from TMDB API
- [ ] [**Detail Screen**]
* User can view movie or TV show information (poster, description, rating)
* User can view average community rating
* User can read user reviews
* User can submit a rating and review
- [ ] [**Login Screen**]
* User can log in to an existing account
* User can create a new account
* Appears when user attempts to rate without being logged in (lazy registration)
- [ ] [**Sign Up Screen**]
* User can create a new account with email and password


### 3. Navigation

**Tab Navigation** (Tab to Screen)


- [ ] Home
- [ ] Search
- [ ] Profile

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
<figure>
  <video src="https://github.com/user-attachments/assets/afac838c-f372-4305-b230-b7e83848ef97" width="400" controls muted>
  </video>
  <figcaption><b>Demo:</b> Interactive scroll and navigation flow of the wireframes.</figcaption>
</figure>

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
