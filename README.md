# Therapists Appointments API Server

> This project consists in a Rails App to serve endpoints to book appointments with therapists.

## Built With

- Ruby >= 2.6.5
- Rails >= 6.0.3
- Postgres >= 9.5


## Server

[API](https://hidden-falls-17981.herokuapp.com/)


## Prerequisites

- [PostreSQL](https://www.postgresql.org/download/)

### Setup

Clone or download the repo:

```
$ git clone https://github.com/abdelp/therapist-appointments-backend.git
```

### Install

```
$ cd therapist-appointments-backend
$ bundle
$ rails db:create
$ rails db:migrate
```

### Usage

Inside the root folder run:

```
rails s
```

### Below is a list of the API end points used by this application.

| Endpoint                   | Params                      | Headers                     | Functionality                     | Authentication |
| -------------------------- | --------------------------- | --------------------------- | --------------------------------- | -------------- |
| POST /users                | {email, username, password} | NA                          | User Signup                       | NA             |
| POST /login                | {username, password}        | NA                          | User Login                        | NA             |
| GET /therapists            | NA                          | NA                          | Get Therapists List               | NA             |
| GET /therapists/:id        | NA                          | NA                          | Get Therapist Information         | NA             |
| GET /uses/:id/appointments | NA                          | Authorization: Bearer token | Get appointments of specific user | token          |
| POST /appointments         | NA                          | Authorization: Bearer token | Create a new Appointment          | token          |


### Run tests

Run the tests with:

```
rspec
```

### Deployment

To deploy on Heroku:

1. You need to register an account on [Heroku](https://www.heroku.com)

2. After that, inside the root folder, you need to create and migrate the project:

```
$ heroku create
$ git push heroku master
$ heroku run rails db:migrate
```

## Authors

👤 **Abdel Perez**

- Github: [@abdelp](https://github.com/abdelp)
- Twitter: [@AbdelPerez11](https://twitter.com/AbdelPerez11)
- Linkedin: [abdel-perez](https://www.linkedin.com/in/abdel-perez)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse Inc.

## 📝 License

This project is [MIT](lic.url) licensed.
