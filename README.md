# 🤔 Deep Thought – DeepL translation bot for Slack

필요한 명령어

```sh
docker build -t deepl-translate .
docker run -d --name ilm-deepl --env-file .env -p 4001:4000 deepl-translate
docker run --name ilm-deepl --env-file .env.jp -p 4001:4000 deepl-translate


docker logs -f ilm-deepl
docker rm -f ilm-deepl
vi lib/deep_thought/slack/api.ex

docker run -p 5432:5432 --name postgres -e POSTGRES_HOST_AUTH_METHOD=trust postgres:15-alpine 
psql postgres --user postgres
docker exec -it postgress /bin/bash
psql -U postgres --host 127.0.0.1

PORT=4001 mix phx.server
```

```sql
CREATE DATABASE deep_thought_dev;

CREATE TABLE translations (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255),
    channel_id VARCHAR(255),
    message_ts VARCHAR(255),
    target_language VARCHAR(255),
    status VARCHAR(255),
    inserted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE slack_users (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255),
    email VARCHAR(255),
    real_name VARCHAR(255),
    real_name_normalized VARCHAR(255),
    display_name VARCHAR(255),
    display_name_normalized VARCHAR(255),
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    inserted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX ON slack_users (user_id);


ALTER TABLE translations
ADD COLUMN translation_channel_id VARCHAR(255),
ADD COLUMN translation_message_ts VARCHAR(255);
```