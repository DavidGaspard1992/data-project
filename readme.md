# Setup

## Initial configurations

Create a virtual environment

```bash

python3 -m venv .venv
source ./.venv/bin/activate
pip install -r ./requirements.txt

```

## Start mysql database with docker

```bash
docker compose up
```

## Run the main script

```bash
python3 main.py
```