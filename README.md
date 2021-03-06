[![Circle CI](https://circleci.com/gh/affablebloke/chatops.svg?style=svg)](https://circleci.com/gh/affablebloke/chatops)

### Running hubot via Docker

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start hubot by running:

    % docker run -it --rm  --env-file ${env-file} -v ${repo-dir}/scripts:/hubot/scripts ${image-id/tag} /hubot/bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO firebase-brain: Connecting to Firebase brain
    hubot>

Then you can interact with hubot by typing `hubot help`.

    hubot> hubot help
    hubot animate me <query> - The same thing as `image me`, except adds [snip]
    hubot help - Displays all of the help commands that hubot knows about.
    ...

### Configuration

```bash
AWS_ACCESS_KEY_ID=${YOUR_AWS_ACCESS_KEY_ID}
AWS_SECRET_ACCESS_KEY=${YOUR_AWS_SECRET_ACCESS_KEY}
FIREBASE_URL=${YOUR_FIREBASE_URL}
FIREBASE_SECRET=${YOUR_FIREBASE_SECRET}
```

## Deployment
It's using Docker.
