# lambdup-elixir-2017

Chapters are available by checking out the branches,
follow the README.md

* 01 - workshop and elixir introduction
* 02 - setting up phoenix 1.3 and its structure
* 03 - basic intro to OTP, genservers and ets
* 04 - reddit API and fetching from it
* 05 - displaying the results

1) __Install phoenix__
  ```mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez```

2) __Create new phoenix application__
  ```
    mix phx.new <app_name>
  ```

3) __To start your Phoenix server:__

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

4) __Phoenix structure__

      `lib`

        |_ elixir_workshop_2017 <- business logic
          |_ application.ex
        |_ elixir_workshop_2017_web <- controllers, router, templates goes here
          |_ controllers
          |_ templates
          |_ views
          |_ router.ex
