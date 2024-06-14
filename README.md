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