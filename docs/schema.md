# Schema Information

## games
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
description | text      | not null
developer   | string    | not null
release_date| string    | not null
rating      | string    | not null

## genre_tag
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
game_id     | integer   | not null, foreign key (references games)
genre_id    | integer   | not null, foreign key (references genres)

## genre
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
type        | string    | not null, unique

## reviews
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
game_id     | integer   | not null, foreign key (references games)
body        | text      | not null
rating      | integer   | not null

index: author_id / game_id pair must be unique (one rating per game

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, unique
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
bio             | text      | defaults null, (added in the users show page)
location        | string    |
