# Lightweight Docker Setup for PHP Development
A starter Docker setup for PHP development with Nginx and MariaDB.

## How to Get Started?
First you'll have to clone this repo as you naturally would. After cloning the
repo build the images. There is `Makefile` included with simple commands like
`make build` for building the images. See the whole list of commands below:

* `make build`  build the images
* `make up`     start the docker environment
* `make down`   stop the docker environment
* `make php`    enter PHP container interactive mode
* `make node`   enter Node container interactive mode
* `make init`   this is only used when you add your project code as a submodule
    and push this environment to a repo then clone it on another machine. It'll
    build the images, pull the changes and add your project as a submodule.
* `make cleanup` only meant for fixing if something went wrong with `make init`
    command so you'll be able to run `make init` again right away.


After the images are built you've two options to proceed:
1. Create a project directory for example `app` in root and start coding there.
2. Clone your project repo into `app` as a submodule.

### Option 1
The first option is very straight forward and simple you clone the repo, create
a directory like `app`, make the code become part of the whole and push
everything to a repo as one single project. This will include the whole docker
stuff and your code.

As this environment only meant for development you might wanna consider the
second option.

### Option 2
This is more of a clean option to keep your code separate from the whole docker
stuff. After cloning the repo add your project as a submodule into the `app`
directory like following:

```bash
git submodule add git@github.com:containershub/php-docker-demo-app.git app
```

Do try it with the demo-app to make sure everything works before starting with
your own project. After cloning the demo-app run `make up` to make docker up
and running or `make build` if you haven't yet build the images. Next test the
following things to make sure everything is ready and all services work as they
should.

* Run `make php` and install Composer packages. With this you'll verify that
    the PHP service is running and Composer works as well.
* Run `make node` and install NPM packages to verify both NodeJS service and
    NPM are working.
* Visit `phpapp.test` (don't forget to add `phpapp.test` to your hosts!). You
    will see nothing special just a simple website only html and some fields to
    fill and some buttons to click just for testing other services `mariadb`,
    `adminer` and `mailpit`.
* Insert some `users` and `posts` then visit `phpapp.test:8080` to see the
    inserted data inside `adminer`.
* Click `Send Mail` to check if `mailpit` is working. Visit `phpapp.test:8025`
    to see if the email was sent.

After successfully testing everything you can now start with your own project.
However you've to first remove the old submodule which is the `demo-app`
otherwise it'll not allow you to add your project as a submodule into app
directory. To do that run the following commands after another:

```bash
# 1. Remove the submodule entry from .git/config
git submodule deinit -f app

# 2. Remove the submodule directory from the working tree and Git index
git rm -f app

# 3. Remove the old submodule's internal git metadata
rm -rf .git/modules/app
```

Now you can add your project and start working!

```bash
git submodule add git@github.com:<Your-Project>.git app
```

