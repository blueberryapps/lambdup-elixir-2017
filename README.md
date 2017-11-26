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

5) __Creating Search Content__
  Run `mix phx.gen.html Redit Search searches`
  Then `mix ecto.migrate`
  Then add `resources "/searches", SearchController` to router.ex

    
    Now we need to cleanup the generated stuff,
  in the controller remove all actions except `index, create, new`

    In the newly created redit.ex file ( `elixir_workshop_2017/redit/redit.ex`) remove all except the following methods:
    
  
    ```
    list_searches
    get_search
    create_search
    change_search
    ```
6) __Add search form__
    <br />

    Create a search form inside `page/index.html.eex`:
    

    ```
    <%= form_for @conn, search_path(@conn, :new), [as: :search, method: :get], fn f -> %>
        <%= text_input f, :query %>
        <%= submit "Search for subredits" %>
      <% end %>
    ```
