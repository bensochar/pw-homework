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