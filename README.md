# 🚀 Nginx, Docker, and Gunicorn Quickstart Repo

Welcome to the **"I-Just-Want-to-Run-My-App"** repo! This is the place where your Docker, Nginx, and Gunicorn dreams come true, and where you can avoid the endless maze of Stack Overflow threads.

## What is this?

Have you ever:

- Wanted to test your web app with Nginx, Docker, and Gunicorn, but got lost in a sea of configuration files?
- Needed a quick setup to show off your cool new Flask app, but didn't want to deal with the hassle of setting everything up?
- Thought, "Man, I wish I had a repo that just did all the work for me"?

If you answered "yes" to any of these, then you're in the right place! This repo is designed to get you up and running in no time, with minimal brain power required. 🎉

## Why Should You Care?

Because life is too short to spend configuring Nginx! Just clone this repo, follow a few simple steps, and you're good to go. Spend more time on your app and less time on the boring stuff.

## How to Get Started

1. **Clone the repo**:
    ```sh
    git clone https://github.com/aronchick/Docker-NGINX-Gunicorn-Flask-Python-Example.git
    cd Docker-NGINX-Gunicorn-Flask-Python-Example
    ```

2. **Run the magic script**:
    ```sh
    ./build_and_run.sh
    ```

3. **Watch the magic happen**:
    ```sh
    bash test_endpoints.sh
    ```

4. **Celebrate** 🎉:
    - Your app is now running at `http://localhost:9999`
    - Logs are being written to the `logs` directory
    - Press `^C` when you're done and everything will clean up nicely (theoretically - if not, do `docker ps` and `docker stop <IMAGEID>`)

## What's Inside?

- **app/**: Your awesome Flask app
- **Dockerfile**: Because containers are cool
- **nginx.conf**: For when you need a professional reverse proxy
- **gunicorn.conf.py**: To manage your Python app like a boss
- **build_and_run.sh**: The script that does it all
- **test_endpoints.sh**: For testing your endpoints and making sure everything works
- **logs**: I've exported the logs, and committed them so you can see what they look like. **NOTE** This erases the logs before each run!

## MY GOD THIS IS NOT FOR PRODUCTION.

**PLEASE** do not run this in production. I am begging you.

## Want to Get Fancy?

Feeling adventurous? Why not try running this setup in a distributed way using [bacalhau.org](https://bacalhau.org) / [https://github.com/bacalhau-project/bacalhau](https://github.com/bacalhau-project/bacalhau)?  Because who doesn't want to scale their test environment to the moon? 🌝

## Disclaimer

This repo is for testing purposes only. If it breaks, you get to keep all the pieces. If you deploy this to production, a team of angry sysadmins might appear at your door.

---

Enjoy and happy coding! 😄 (aronchick (at) expanso.io - [@aronchick](https://twitter.com/aronchick)
