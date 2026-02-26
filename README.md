# Task Management API

A production-ready API for managing tasks with authentication.

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [API Documentation](#api-documentation)
* [Testing](#testing)

## Installation

1. Clone the repository
2. Run `bundle install`
3. Run `rails db:setup`
4. Run `rails server`

## Usage

1. Create a new user by sending a POST request to `/users` with the following parameters:
	* `name`
	* `email`
	* `password`
2. Create a new task by sending a POST request to `/tasks` with the following parameters:
	* `title`
	* `description`
3. Get all tasks for the current user by sending a GET request to `/tasks`

## API Documentation

### Users

* `POST /users` - Create a new user
	+ Parameters:
		- `name`
		- `email`
		- `password`
	+ Response:
		- `201 Created` - User created successfully
		- `422 Unprocessable Entity` - Invalid parameters
* `GET /users` - Get all users (not implemented)

### Tasks

* `POST /tasks` - Create a new task
	+ Parameters:
		- `title`
		- `description`
	+ Response:
		- `201 Created` - Task created successfully
		- `422 Unprocessable Entity` - Invalid parameters
* `GET /tasks` - Get all tasks for the current user
	+ Response:
		- `200 OK` - Tasks retrieved successfully

## Testing

To run the tests, use the following command: