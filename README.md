# create build
* docker build . -t hermezHK/docker-django-test

# run container
* docker run -p 8000:8000 hermezHK/docker-django-test

# run container in background
* docker run -d -p 8000:8000 hermezHK/docker-django-test
