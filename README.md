## pagerduty-oncall

A simple Sintatra app to show who's on call, and a phone number for them.

## Setup:
Deploy it to heroku, it has no DB or dependencies.

Get the name of your pagerduty account (the bit before .pagerduty.com in the URL), set it in heroku
   $ heroku config set ACCOUNT=<your account name>

Get an API key from your pagerduty account, set it in heroku
   $ heroku config set API_KEY=<your api key>

Choose a password:
   $ heroku config set PASSWORD=<password>

Map the email address of the on call members to their chosen phone numbers in the format from the example:
   $ heroku config set CONTACT_NUMBERS="one@example.com:12345678,two@example.com:12345677"
