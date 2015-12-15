# Problems Bank

Problems Bank allows the posting of various problems with attachments

## Setup

Make sure your environment variables for AWS are stored. This lets you talk to the AWS account.

The required variables are `AWS_PROBLEM_KEY_ID`, `AWS_PROBLEM_SECRET_ACCESS_KEY`, and `AWS_PROBLEM_BUCKET`. These are held by the client.

They can be set on a UNIX system with `export AWS_PROBLEM_KEY_ID=XXXX` and so on... These must be added over again on a new terminal session.

## Running Problems Bank

* First, you must `bundle install` if there are any errors, it usually has to do with your system not having postgres or another tool. A Google search and a `brew install` on a Mac or a `apt-get` on Linux will usually help.
* Set up the database with `rake db:migrate` and `rake db:reset`
* Search is powered by [sunspot](https://github.com/sunspot/sunspot). Before running the rails app, you need to start up sunspopt with `rake sunspot:solr:start`.
* Now start the rails app with `rails server`
