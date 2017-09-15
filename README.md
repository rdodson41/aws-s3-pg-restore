# aws-s3-pg-restore

A utility which restores production Barman database backups to your local development environment.

## Installation

Navigate to the directory in which you would like to clone this repository:

    $ cd /usr/local/opt

Clone this repository:

    $ git clone https://github.com/rdodson41/aws-s3-pg-restore.git

Navigate to your local copy of this repository:

    $ cd aws-s3-pg-restore

Run `make install` to install `aws-s3-pg-restore` to `/usr/local/bin`:

    $ make install

Run `make update` to update `aws-s3-pg-restore`:

    $ make update

## Setup

**aws-s3-pg-restore** requires [Python][1], the [AWS CLI][2], and [PostgreSQL][3].

  [1]: <https://www.python.org/about/gettingstarted/> "Python"
  [2]: <http://docs.aws.amazon.com/cli/latest/userguide/installing.html> "AWS CLI"
  [3]: <https://www.postgresql.org/download/> "PostgreSQL"

You must configure the [AWS CLI][4] in order to use **aws-s3-pg-restore**.

  [4]: <http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html> "AWS CLI"

## Usage

Restore a production Barman database backup to your local development environment:

    $ aws-s3-pg-restore my-db-backups my_app_production my_app_development

If your production database uses a different version of PostgreSQL than your local development environment, then you will need to install the production version in addition to your development version and include it in your PATH:

    $ PATH="/usr/local/opt/postgresql@9.4/bin:$PATH" aws-s3-pg-restore my-db-backups my_app_production my_app_development

**aws-s3-pg-restore** responds to PostgreSQL environment variables `PGUSER`, `PGHOST`, and `PGPORT`:

    $ PGUSER=postgres aws-s3-pg-restore my-db-backups my_app_production my_app_development

See PostgreSQL documentation section [32.14. Environment Variables][5] for additional details.

  [5]: <https://www.postgresql.org/docs/9.6/static/libpq-envars.html> "PostgreSQL Environment Variables"

These connection options may be set or overridden via command line options `--user USER`, `--host HOST`, and `--port PORT`, respectively:

    $ aws-s3-pg-restore --host localhost --port 32774 my-db-backups my_app_production my_app_development

## Uninstallation

Navigate to the local copy of this repository:

    $ cd /usr/local/opt/aws-s3-pg-restore

Use `make uninstall` to uninstall `aws-s3-pg-restore`:

    $ make uninstall

## License

  [The MIT License (MIT)][6]

  [6]: <https://opensource.org/licenses/MIT> "The MIT License (MIT)"
