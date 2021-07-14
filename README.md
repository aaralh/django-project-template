# Django project template
Template to get started quickly with Django, PostgreSQL and Docker.


## Usage

> Before starting make sure that you have Python 3, Docker and git installed on you system.

1. Clone the repository by running `git clone https://github.com/aaralh/django-project-template.git`
2. Run the `./setup.sh <your_project_name>` with your project name as a argument for example `./setup.sh your_project`.
Make sure that the given project name is valid Django project name
3. After `./setup.py` has finished, run `docker-compose up -d` to start the PostgeSQL container.
4. Wait a couple of seconds for DB to start and run `./manage.py runserver`
5. Navigate to `http://127.0.0.1:8000/` and voilà we have fully working Django project with PostgreSQL DB running :tada:


## Contributing 🔨:construction:

Any contributions you make are **greatly appreciated** :smile:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/NewAmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some NewAmazingFeature'`)
4. Push to the Branch (`git push origin feature/NewAmazingFeature`)
5. Open a Pull Request
6. Get it approved and merged :rocket:


## License

Distributed under the MIT License. See `LICENSE` for more information.


## Contact

Aaro Alhainen - [@AAlhainen](https://twitter.com/AAlhainen)

Project Link: [https://github.com/aaralh/django-project-template](https://github.com/aaralh/django-project-template)
