Publisher
==

| who       | what |
|-----------|------|
| dockerhub | https://hub.docker.com/r/jspc/publisher/   |
| circleci  | https://circleci.com/gh/jspc/publisher   |
| licence   | MIT   |


Installation and Configuration
--

```bash
$ # Get from CLOUDINARY dashboard
$ export CLOUDINARY_URL=cloudinary://
$ bundle install
```

The tool is powered by the config as per:

```json
{
    "envs": {
        "staging": {
            "uri": "https://localhost",
            "username": "ghost",
            "password": "ghost",
            "host": "10.0.0.1",
            "port": 3306,
            "database": "ghost"
        },
        "production": {
            "username": "ghost",
            "password": "ghost",
            "host": "127.0.0.1",
            "port": 3307,
            "database": "ghost"
        }
    }
}
```

Running
--

In production, given the database is all firewalled off, we use SSh tunnels:

```bash
$ ssh -L 3307:172.17.0.1:3306 core@db-host
```

Then:

```bash
$ bundle exec ruby migrate.rb -h
Usage: migrate [options]
    -p, --post post                  Post ID id to publish
    -c, --config-file path           Config file
```

Licence
--

MIT License

Copyright (c) 2016 jspc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
