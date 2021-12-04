# README

Update the database credentials in the .env file. Open your terminal and run the DB migration.

`bundle exec rake db:create db:migrate`

Later, you can reset the DB if needed

`bundle exec rake db:reset`

## Unit tests

Open your terminal and run tests. Currently only models are covered by tests

`bundle exec rspec`

## Manual tests

Open your terminal and start the rails server

`bundle exec rails s`

Open another terminal and type the following curl commands to test the API

* replace :user_id by the id of an existing user
* replace :project_id by the id of an existing project
* replace :floorplan_id by the id of an existing floorplan
* replace :relative_path_to_plan_file by the relative path to the image file (You can find some floorplans for testing in `./spec/fixtures/floorplans`, like `./spec/fixtures/floorplans/friends-floorplan.jpeg`)

### Users

**POST - Create a user**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -d "user[email]=foo@bar.com" http://localhost:3000/api/v1/users
```

**GET - Get users**

```
curl -i http://localhost:3000/api/v1/users
```

**GET - Get user ()**

```
curl -i http://localhost:3000/api/v1/users/:user_id
```

**PUT - Update the user's email**

```
curl -i -X PUT -H "Content-Type: multipart/form-data" -d "user[email]=foo2@bar.com" http://localhost:3000/api/v1/users/:user_id
```

**POST - Create another user**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -d "user[email]=foo42@bar.com" http://localhost:3000/api/v1/users
```

**DELETE - Delete a user**

```
curl -i -X DELETE http://localhost:3000/api/v1/users/:user_id
```

### Projects

**POST - Create a project**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -d "project[user_id]=:user_id" -d "project[name]=Foo Bar Project" http://localhost:3000/api/v1/projects
```

**GET - Get all projects**

```
curl -i http://localhost:3000/api/v1/projects
```

**GET - Get user's projects**

```
curl -i http://localhost:3000/api/v1/projects
```

**GET - Get project**

```
curl -i http://localhost:3000/api/v1/projects/:project_id
```

**PUT - Update the project's name**

```
curl -i -X PUT -H "Content-Type: multipart/form-data" -d "project[name]=Bar Baz Project" http://localhost:3000/api/v1/projects/:project_id
```

**POST - Create another project**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -d "project[user_id]=:user_id" -d "project[name]=Project 42" http://localhost:3000/api/v1/projects
```

**DELETE - Delete a project**

```
curl -i -X DELETE http://localhost:3000/api/v1/projects/:project_id
```

### Floorplans

You can find some floorplans for testing in `spec/fixtures/floorplans`.

**POST - Create a floorplan**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -F "floorplan[project_id]=:project_id" -F "floorplan[plan_image]=@:relative_path_to_plan_file" http://localhost:3000/api/v1/floorplans
```

**GET - Get all floorplans**

```
curl -i http://localhost:3000/api/v1/floorplans
```

**GET - Get project's floorplans**

```
curl -i http://localhost:3000/api/v1/floorplans?project_id=:project_id
```

**PUT - Update the floorplan's name**

```
curl -i -X PUT -H "Content-Type: multipart/form-data" -d "floorplan[name]=Floorplan 007" http://localhost:3000/api/v1/floorplans/:floorplan_id
```

**POST - Create another floorplan**

```
curl -i -X POST -H "Content-Type: multipart/form-data" -F "floorplan[project_id]=:project_id" -F "floorplan[plan_image]=@:relative_path_to_plan_file" http://localhost:3000/api/v1/floorplans
```

**DELETE - Delete a floorplan**

```
curl -i -X DELETE http://localhost:3000/api/v1/floorplans/:floorplan_id
```
