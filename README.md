# XSL Tester
====================

Forked from https://github.com/joepjoosten/XSL-tester

====================

Transform your XML with XSLT online

Choose between the following engines:
- Saxon 9.5.1.6 HE,
- Saxon 9.5.1.6 EE, 
- Saxon 6.5.5, or
- Xalan 2.7.1

External version is available on http://xsltransform.net

## Setup 
====================

After set up, access at http://localhost:9000.

Suggested method is to run it using Docker, self contained set up.

### Locally

Requires having [sbt](https://www.scala-sbt.org/) installed and having a MySQL db set up.

The db script for creating requried tables is found in `conf/init.sql`. Make sure to change `db.default.url` in `conf/application.conf` to the url of where db is hosted. If local and default set up, should be `jdbc:mysql://localhost:3306/xsltransform".

Run `make sbt-shell` to start up SBT and then run `run` inside to start app up.

If you don't have [Make](https://www.gnu.org/software/make/) installed, run the command directly:
- `sbt -Dsbt.repository.config=./repositories -Dsbt.override.build.repos=true run`

### Docker

Requires Docker and Docker Compose.

Docker setup adapted from https://bitbucket.org/fvdmerwe/xsl-transform

Run `make dock-load compose-up` to run tasks from Makefile to start up app.

If you don't have [Make](https://www.gnu.org/software/make/) installed, run the commands directly:
- `docker load -i xsl-tester.tar.gz`
- `docker-compose up -d`

#### Build image

If you want to make changes to the app and build:
- using Make, run `make dock-build`
- or run directly `DOCKER_BUILDKIT=1 docker build --compress --target deploy -t xtd/xsl-tester`

## Changelog
====================

Version 1.2
- Preview of PDF or HTML when results are results are in the correct format / doctype
- Added Saxon EE (XSLT 3.0).


Version 1.1
- Added positibility to switch to different XSLT engines

Version 1.0
- Initial release
