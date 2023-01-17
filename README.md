<div align="center">
<h1>Lunch and Learn Backend Service</h1>
<br>
  <img width="602" alt="Sandwich" align="center" src="https://user-images.githubusercontent.com/60988144/213017546-59da95e9-d900-4b6a-befd-88df503763bc.png">
</div>



## Table of Contents
- [Summary](#summary)
- [Setup](#setup)
- [Built With](#built-with)
- [Gems](#gems)
- [Endpoints](#endpoints)
- [Schema](#schema)
- [Contributors](#contributors)

## Summary
This is the backend service for an application called Lunch and Learn (frontend is not built). Lunch and Learn enables users to find recipes around the world and learn about different countries. When a user creates an account, they are able to save recipes to their account for later access. This project was completed as part of the backend curriculum at [Turing School of Software and Design](https://backend.turing.edu/). The project requirements can be found [HERE](https://backend.turing.edu/module3/projects/lunch_and_learn/).

## Setup 
1. (Optional) Fork repository
2. Clone repo by selecting 'Code' on the home page and copying the link. Use command `git clone <link>` on your local machine
3. Open repository in your IDE of choice
4. Set up gems: `bundle install`
5. Setup the database: `rails db:{drop,create,migrate,seed}`
6. Setup Environment variables: `bundle exec figaro install`
7. The following API's require keys for use: 
    * [Edamam](https://developer.edamam.com/)
    * [YouTube](https://developers.google.com/youtube/v3)
    * [Unsplash](https://unsplash.com/documentation#creating-a-developer-account)
8. Add the following environment variables to `config/application.yml`
    ```yml
    recipes_app_id: <key>
    recipes_app_key: <key>
    youtube_api_key: <key>
    unsplash_api_key: <key>
    ```
9. Run the test suite: `bundle exec rspec`
10. Accress the local development enviroment: `rails server` and navigate to `http://localhost:3000`

## Built With
- Ruby 2.7.4
- Rails 5.2.8

## Gems
- [Pry](https://github.com/pry/pry)
- [RSpec-rails](https://github.com/rspec/rspec-rails)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Webmock](https://github.com/bblimke/webmock)
- [VCR](https://github.com/vcr/vcr)
- [Faraday](https://lostisland.github.io/faraday/usage/)
- [Faker](https://github.com/vajradog/faker-rails)
- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails)
- [Figaro](https://github.com/laserlemon/figaro)
- [JSON:API Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

## Endpoints
<details close>
<summary>Get Recipes by Country</summary>
<br>

Request: <br>
```
GET /api/v1/recipes?country=#{country_name}
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": null,
            "type": "recipes",
            "attributes": {
                "title": "Herb And White Wine Granita",
                "url": "http://www.food52.com/recipes/351_herb_and_white_wine_granita",
                "country": "France",
                "image": "https://edamam-product-images.s3.amazonaws.com"
            }
        },
        {
            "id": null,
            "type": "recipes",
            "attributes": {
                "title": "Savory Sesame Cookies",
                "url": "http://chocolateandzucchini.com/recipes/appetizers/savory-sesame-cookies-recipe/",
                "country": "France",
                "image": "https://edamam-product-images.s3.amazonaws.com"
            }
        },
        {...},
        {...},
        ]
}

```
</details>

<details close>
<summary>Get Recipes for a Random Country</summary>
<br>

Request: <br>
```
GET /api/v1/recipes
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": null,
            "type": "recipes",
            "attributes": {
                "title": "Herb And White Wine Granita",
                "url": "http://www.food52.com/recipes/351_herb_and_white_wine_granita",
                "country": "France",
                "image": "https://edamam-product-images.s3.amazonaws.com"
            }
        },
        {
            "id": null,
            "type": "recipes",
            "attributes": {
                "title": "Savory Sesame Cookies",
                "url": "http://chocolateandzucchini.com/recipes/appetizers/savory-sesame-cookies-recipe/",
                "country": "France",
                "image": "https://edamam-product-images.s3.amazonaws.com"
            }
        },
        {...},
        {...},
        ]
}

```
</details>

<details close>
<summary>Get Learning Resource for a Country</summary>
<br>

Request: <br>
```
GET /api/v1/learning_resources?country=#{country_name}
```
Information Sources: 
- Video: [YouTube API](https://developers.google.com/youtube/v3)
- Photos: [UnSplash API](https://unsplash.com/documentation#search-photos)

JSON Response Example:
```json
{
    "data": {
        "id": null,
        "type": "learning_resources",
        "attributes": {
            "country": "Thailand",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "white boat in between rocky mountains",
                    "url": "https://images.unsplash.com/photo-1519451241324-20b4ea2c4220?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHwxfHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "religious figurine near gray concrete mosque under blue and white cloudy sky",
                    "url": "https://images.unsplash.com/photo-1503933166348-a1a86c17b3a0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHwyfHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "aerial photography of body of water",
                    "url": "https://images.unsplash.com/photo-1534008897995-27a23e859048?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHwzfHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "bird's eye view of islands",
                    "url": "https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw0fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "bird's-eye view of white temple surround by trees",
                    "url": "https://images.unsplash.com/photo-1512553353614-82a7370096dc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw1fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw2fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "man standing beside yellow auto rickshaw",
                    "url": "https://images.unsplash.com/photo-1520214572569-0d593dc3f1f2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw3fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "person standing inside the brown boat parked on the seashore",
                    "url": "https://images.unsplash.com/photo-1519915247718-1703f9c6bb15?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw4fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "aerial photography of body of water surrounded with mountains",
                    "url": "https://images.unsplash.com/photo-1506665531195-3566af2b4dfa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHw5fHxUaGFpbGFuZHxlbnwwfHx8fDE2NzM5MDM4OTI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "person riding on Taxi cub",
                    "url": "https://images.unsplash.com/photo-1496283383941-8f638adf042c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTkzNTB8MHwxfHNlYXJjaHwxMHx8VGhhaWxhbmR8ZW58MHx8fHwxNjczOTAzODky&ixlib=rb-4.0.3&q=80&w=1080"
                }
            ]
        }
    }
}
```
</details>

<details close>
<summary>User Registration</summary>
<br>

Request: <br>
```
POST /api/v1/user
```
Example Request Body:
```json
{
    "name": "Leslie Knope",
    "email": "bestemployee@gmail.com"
}
```
JSON Response Example:
```json
{
    "data": {
        "id": "12",
        "type": "user",
        "attributes": {
            "name": "Leslie Knope",
            "email": "bestemployee@gmail.com",
            "api_key": "0e25aeb9f6a2631c912c06012865012d"
        }
    }
}
```
</details>

<details close>
<summary>User Saves Favorites</summary>
<br>

Request: <br>
```
POST /api/v1/favorites
```
Example Request Body:
```json
{
    "api_key": "0e25aeb9f6a2631c912c06012865012d",
    "country": "Thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```
JSON Response Example:
```json
{
    "success": "Favorite added successfully"
}
```
</details>

<details close>
<summary>Get User Favorites</summary>
<br>

Request: <br>
```
GET /api/v1/favorites?api_key=<api_key>
```
JSON Response Example:
```json
{
    "data": [
        {
            "id": "8",
            "type": "favorite",
            "attributes": {
                "country": "Italy",
                "recipe_link": "https://www.foodnetwork.com/",
                "recipe_title": "Italian Style Chicken",
                "created_at": "2023-01-17T21:18:20.361Z"
            }
        },
        {
            "id": "9",
            "type": "favorite",
            "attributes": {
                "country": "Germany",
                "recipe_link": "https://www.foodnetwork.com/",
                "recipe_title": "Bratwurst and Sauerkraut",
                "created_at": "2023-01-17T21:19:19.927Z"
            }
        }
    ]
}
```
</details>

## Schema
There is a one-to-many relationship between Users and Favorites.
<img width="602" alt="Schema" src="https://user-images.githubusercontent.com/60988144/213017114-326e1441-486d-4941-88c1-9c72199f594c.png">

## Contributors
[Darby Smith](https://github.com/DarbySmith) - [LinkedIn](https://www.linkedin.com/in/darby-m-smith/)
