# Homework for a company in the real estate space

To run locally...

### 1. Clone the repo

```bash
git clone https://github.com/bensochar/pw-homework.git
cd pw
```

### 2. Install dependencies

Uses Ruby 3.2.2 & postgres

```bash
rvm use
bundle install
```

### 3. Setup database

```bash
bundle exec rails db:setup
bundle exec rails db:migrate
bundle exec rails db:seed
```

### 5. Run the app

```bash
rails s
```

### 5. Using the app

The navbar lists Clients & Bulidings. You can login as any User using their email & the password `123456`. The JSON for the API can be viewed here: [http://localhost:3000/buildings.json?page=2](http://localhost:3000/buildings.json?page=2)

### 6. Custom fields

3 types. String, Integer & Enum with data (name, value & options) stored in JSONb. Creating new fields & validating them:

```
field = CustomField::Integer.new(client: Client.first, name: 'dude', value: '1')
field.valid?
=> false
```

```
field = CustomField::Integer.new(client: Client.first, name: 'dude', value: 0)
field.valid?
=> true
```