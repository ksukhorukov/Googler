# AdWords monitoring application

Technical description of the project can be found [here][todo].

Generally speaking you signup, upload comma separated file with the search keywords and monitor the AdWords statistics. Profit!

# Genetal requirements 

* Rails
* Postgresql
* Redis
* Sidekiq

# Installation

Do the following steps:

```
$ git clone https://github.com/ksukhorukov/Googler
$ cd Googler
$ rvm use ruby-2.1.5@googler --create
$ bundle
$ rake db:setup
$ redis-server
$ sidekiq
$ rails s
```

Enjoy!

## API 

Application provides OAuth2 RESTful API. How to make it up and running?

Go to http://localhost:3000/oauth/applications and create new application.
For instance name will be ``Test Client`` and redirect URL ``http://localhost:3001/auth/adwords/callback``

You should get something like this at the end:

*  Application Id: ``fc4fb01fcea038a920d22b64eb411a942a0287660c3dfc8bfd2991885e9a6c94``
*  Secret: ``160d6e7fbf98ca5bd49a653c9e386fc48eb77c40540488d28bb067b6bb5723bf``
*  Callback urls: ``http://localhost:3001/auth/adwords/callback``

Now we need to get the socalled authentication token. In order to do this, launch ``rails c`` and execute the following code (change variables with your own values):

```
callback = "http://localhost:3001/auth/adwords/callback"

app_id = "fc4fb01fcea038a920d22b64eb411a942a0287660c3dfc8bfd2991885e9a6c94"

secret = "160d6e7fbf98ca5bd49a653c9e386fc48eb77c40540488d28bb067b6bb5723bf"

client = OAuth2::Client.new(app_id, secret, site: "http://localhost:3000")

client.auth_code.authorize_url(redirect_uri: callback)
```

It will throws out the URL:

```
http://localhost:3000/oauth/authorize?client_id=fc4fb01fcea038a920d22b64eb411a942a0287660c3dfc8bfd2991885e9a6c94&redirect_uri=http%3A%2F%2Flocalhost%3A3001%2Fauth%2Fadwords%2Fcallback&response_type=code
```

Open it in your browser and you will see 404 page. Grab the ``code`` value from the URL, go back to the terminal and executes the following code:

```
access = client.auth_code.get_token('bdc4e42909403a9477b6890dbdc25d8116ba96123f8319f601ac6c66b70bcd79', redirect_uri: callback)
access.token
```

Finally you have the access token: ``ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d``

It is valid for the next 2 hours.

Here is the funnest part begins. You could access API of AdWords application. Lets use CURL for this purpose.

### Uploading file with you keywords

```
curl -H "Authorization: Bearer  ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d" -F "keywords[name]=test" -F "keywords[description]=test" -F "keywords[keys]=@/Users/kirill/Desktop/test.csv" http://localhost:3000/api/keywords
```

### Getting all keywords sets

```
curl http://localhost:3000/api/keywords?access_token=ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d
```

#### Getting all words from the keywords set

```
curl http://localhost:3000/api/keywords/12345/?access_token=ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d
```

#### Displaying the statistics

```
curl http://localhost:3000/api/statistics?access_token=ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d
```

#### Making search queries

```
curl http://localhost:3000/api/queries?access_token=ee0753e7206e6baae97e553cae1d9cade066161c6ffcc794606ba8a82c32b86d&type=query1&word=booking
```

## Thats all. Have fun!

[todo]: <https://github.com/ksukhorukov/Googler/blob/master/nimbl3_test_task.pdf>



