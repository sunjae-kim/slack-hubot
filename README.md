# Slack Hubot

Slack 에서 제공하는 bot API 인 [Hubot](https://slack.dev/hubot-slack/) 입니다.

[Coffescript](https://coffeescript.org/) 로 구현되어 있으며 [Heroku](https://www.heroku.com/) 에 배포했습니다.

[Serverless url shortener with Google Firebase](https://github.com/Sunjae-Kim/firebase-url-shortener) 를 사용하는 인터페이스 중 하나입니다.

### Run Server

```bash
HUBOT_SLACK_TOKEN=<API_TOKEN> bin/hubot --adapter slack
```

### Screen Capture

![동작캡처](https://user-images.githubusercontent.com/40228715/63393446-1a2c6900-c3f6-11e9-8da3-f3a2eddf8cbc.png)