# https://medium.com/bettercode/how-to-build-a-modern-ci-cd-pipeline-5faa01891a5b
#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku container:login
heroku container:push web --app $HEROKU_APP_NAME
heroku container:release web --app $HEROKU_APP_NAME