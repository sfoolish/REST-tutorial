REST-tutorial
=============

Files for my REST API tutorials featuring a server written in Python and a web client written in Javascript. Here are the articles:

- [Designing a RESTful API with Python and Flask](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask)
- [Writing a Javascript REST client](http://blog.miguelgrinberg.com/post/writing-a-javascript-rest-client)
- [Designing a RESTful API using Flask-RESTful](http://blog.miguelgrinberg.com/post/designing-a-restful-api-using-flask-restful)

Setup
-----

- Install Python 2.7 and git.
- Run `setup.sh` (Linux, OS X, Cygwin) or `setup.bat` (Windows)
- Run `./rest-server.py` to start the server (on Windows use `flask\Scripts\python rest-server.py` instead)
- Alternatively, run `./rest-server-v2.py` to start the Flask-RESTful version of the server.
- Open `http://localhost:5000/index.html` on your web browser to run the client

Docker Run Test
---------------

1) build docker image

	docker build -t flask:rest .

2) run rest server

    root@vm1:/opt/share/mongodb/REST-tutorial# docker run -it flask:rest bash
    root@56afaba52ab5:/# cd /root/rest/
    root@56afaba52ab5:~/rest# python rest-server.py
     * Running on http://127.0.0.1:5000/
     * Restarting with reloader
    56afaba52ab5127.0.0.1 - - [15/Aug/2015 04:02:42] "GET /todo/api/v1.0/tasks HTTP/1.1" 200 -
    127.0.0.1 - - [15/Aug/2015 04:02:59] "POST /todo/api/v1.0/tasks HTTP/1.1" 201 -
    127.0.0.1 - - [15/Aug/2015 04:03:01] "GET /todo/api/v1.0/tasks HTTP/1.1" 200 -

3) run curl test

    root@vm1:~# docker exec -it 56afaba52ab5 bash
    root@56afaba52ab5:/# curl -u miguel:python -i http://127.0.0.1:5000/todo/api/v1.0/tasks
    HTTP/1.0 200 OK
    Content-Type: application/json
    Content-Length: 406
    Server: Werkzeug/0.9.6 Python/2.7.6
    Date: Sat, 15 Aug 2015 04:02:42 GMT

    {
      "tasks": [
        {
          "description": "Milk, Cheese, Pizza, Fruit, Tylenol",
          "done": false,
          "title": "Buy groceries",
          "uri": "http://127.0.0.1:5000/todo/api/v1.0/tasks/1"
        },
        {
          "description": "Need to find a good Python tutorial on the web",
          "done": false,
          "title": "Learn Python",
          "uri": "http://127.0.0.1:5000/todo/api/v1.0/tasks/2"
        }
      ]
    }root@56afaba52ab5:/# curl -u miguel:python -i -H "Content-Type: application/json" -X POST -d '{"title":"Read a book"}' http://localhost:5000/todo/api/v1.0/tass
    HTTP/1.0 201 CREATED
    Content-Type: application/json
    Content-Length: 149
    Server: Werkzeug/0.9.6 Python/2.7.6
    Date: Sat, 15 Aug 2015 04:02:59 GMT

    {
      "task": {
        "description": "",
        "done": false,
        "title": "Read a book",
        "uri": "http://localhost:5000/todo/api/v1.0/tasks/3"
      }
    root@56afaba52ab5:/# curl -u miguel:python -i http://127.0.0.1:5000/todo/api/v1.0/tasks
    HTTP/1.0 200 OK
    Content-Type: application/json
    Content-Length: 558
    Server: Werkzeug/0.9.6 Python/2.7.6
    Date: Sat, 15 Aug 2015 04:03:01 GMT

    {
      "tasks": [
        {
          "description": "Milk, Cheese, Pizza, Fruit, Tylenol",
          "done": false,
          "title": "Buy groceries",
          "uri": "http://127.0.0.1:5000/todo/api/v1.0/tasks/1"
        },
        {
          "description": "Need to find a good Python tutorial on the web",
          "done": false,
          "title": "Learn Python",
          "uri": "http://127.0.0.1:5000/todo/api/v1.0/tasks/2"
        },
        {
          "description": "",
          "done": false,
          "title": "Read a book",
          "uri": "http://127.0.0.1:5000/todo/api/v1.0/tasks/3"
        }
      ]
    }
