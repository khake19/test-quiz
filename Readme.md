# Local Mode
This is run in the docker environment, so just run `docker compose up`, it will setup and start

> Note: For the first time setup, you need to manually run bundle install (backend folder) and yarn install (client folder) via IDE virtual terminal to get dependencies. Todo: modify main Dockerfile to install all workspaces dependencies

### Base URL
IDE: http://ide.localhost
Docs: http://docs.localhost/

For now we only have 2 workspaces (the `backend` and `client` folder). To run those, you have to use the IDE virtual terminal at http://ide.localhost. if not running by default it will return 502 Bad Gateway, normal.

### Backend Workspace
URL: http://backend.localhost/
Command: `bundle exec bin/start`

### Client Workspace
URL: http://client.localhost/
Command: `yarn start`

### Other Workspace
TBD, We plan to create new tests besides `backend` and `client` folders

# Production Mode
### Todo:
- [ ] create Github PR for the code changes, via slack bot command
- [ ] reset code changes, via slack bot command
- [ ] re-generate password access, via slack bot command
