# README

[![Build Status](https://travis-ci.org/ppworks/mentions.svg?branch=master)](https://travis-ci.org/ppworks/mentions)

If you've mentioned on github or esa, bitbucket, trello, you'll get the mention on slack.

![chapter3-1-3](https://cloud.githubusercontent.com/assets/536118/13883721/1547b4d8-ed6e-11e5-83b8-fedd1b1fd87f.png)

## Setup

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

or

```
export MENTIONS_MAPPING_FILE_PATH=https://gist.githubusercontent.com/ppworks/49f6ce44efb09d5fc8e9/raw/c1465aab5d6604b98ba6ca4c31263a5b36f62378/mention_mappings.yml # mapping file path
export SLACK_WEBHOOK_URL=https://hook.slack.com/services/yyyyyyyyyyyyyy # Please use Incoming WebHooks
```

### Create webhook

Now, we support from github, esa or bitbucket to slack.

### Set GitHub webhook

Please set `GITHUB_TO_SLACK_TOKEN` or run the following command.

```
heroku run console -a your-application-name
Webhook.create(from: 'github', to: 'slack').token # Your webhook token
```

```
https://your-application-name.herokuapp.com/webhooks/your-webhook-token
```

![image](https://cloud.githubusercontent.com/assets/536118/13662694/dc6ad3e6-e6df-11e5-8fed-905f9fc35ab4.png)

### Set esa webhook

Please set `ESA_TO_SLACK_TOKEN` or run the following command.

```
heroku run console -a your-application-name
Webhook.create(from: 'esa', to: 'slack').token # Your webhook token
```

```
https://your-application-name.herokuapp.com/webhooks/your-webhook-token
```

![image](https://cloud.githubusercontent.com/assets/536118/13838757/d9110bfa-ec59-11e5-8578-acac57619576.png)


### Set bitbucket webhook

Please set `BITBUCKET_TO_SLACK_TOKEN` or run the following command.

```
heroku run console -a your-application-name
Webhook.create(from: 'bitbucket', to: 'slack').token # Your webhook token
```

```
https://your-application-name.herokuapp.com/webhooks/your-webhook-token
```

![image](https://cloud.githubusercontent.com/assets/536118/13899934/77f1f40c-ee3d-11e5-82c6-76d64359ee49.png)

### Set trello webhook

Please set `TRELLO_TO_SLACK_TOKEN` or run the following command.

```
heroku run console -a your-application-name
Webhook.create(from: 'trello', to: 'slack').token # Your webhook token
```

## How to use mentions

1. Clone this repository
2. Add your service accounts [here](https://github.com/moneyforward/mf_mentions/blob/master/public/mention_mappings.yml)
3. Please PR (example: https://github.com/moneyforward/mf_mentions/pull/23?w=1)

```
-
  github: ppworks
  slack: koshikawa.naoto
  esa: koshikawa_naoto
```
