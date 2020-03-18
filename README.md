# code-library-database
Database schema and migration scripts for the CODE Library system.

## Contents

| Directory | Content |
| --- | --- |
| schema/ | Contains the database schema as SQL for development and production environment |
| base_dataset/ | Required database data for imports. The file `all.sql` is an aggregation of all the other files |
| export/ | Scripts for converting the CSV spreadsheet exports to SQL |

## How to deploy

The following steps assume you have a working Postgres database server running and the access rights to create a new database.

Postgres provides the `psql` command line utility to connect to a database server.
Imports are done with `\i <path-to-sql-file>`, on the psql command prompt.

Please import the files in the following order.

1. `schema/development.sql` or `schema/production.sql`
2. `base_dataset/all.sql`
3. `export/library_se.sql`, `export/library_id.sql`, `export/library_pm.sql`, `export/library_sts.sql`, `export/library_is.sql`, `export/library_dh.sql` and `export/library_xxl.sql`
