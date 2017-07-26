# aws-s3-pg-restore

**aws-s3-pg-restore** is a utility which restores production PostgreSQL database Barman backups to local development environments.

## Setup

**aws-s3-pg-restore** requires [Python][1], the [AWS CLI][2], and [PostgreSQL][3].

  [1]: <https://www.python.org/about/gettingstarted/> "Python"
  [2]: <http://docs.aws.amazon.com/cli/latest/userguide/installing.html> "AWS CLI"
  [3]: <https://www.postgresql.org/download/> "PostgreSQL"

You must configure the [AWS CLI][4] in order to use **aws-s3-pg-restore**.

  [4]: <http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html> "AWS CLI"

## Usage

    $ aws-s3-pg-restore my-db-backups my_app_production my_app_development

If your production database uses a different version of PostgreSQL than your local development environment, then you will need to install the production version in addition to your development version and include it in your PATH:

    $ PATH="/usr/local/opt/postgresql@9.4/bin:$PATH" aws-s3-pg-restore my-db-backups my_app_production my_app_development

If your application uses Rails, then **aws-s3-pg-restore** will attempt to run `bin/rake db:environment:set` upon the restoration of your production database to your local development environment.

## License

  [The MIT License (MIT)][5]

  [5]: <https://opensource.org/licenses/MIT> "The MIT License (MIT)"
