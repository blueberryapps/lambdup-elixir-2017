# lambdup-elixir-2017

Chapters are available by checking out the branches,
follow the README.md

* 01 - workshop and elixir introduction
* 02 - setting up phoenix 1.3 and its structure
* 03 - basic intro to OTP, genservers and ets
* 04 - reddit API and fetching from it
* 05 - displaying the results

## O1 - workshop and elixir introduction

1) __A quick intro about the workshop:__

> The workshop main goal is to do a quick introduction to the elixir language, phoenix and OTP framework.

> My personal goal is to not make one more rails port elixir tutorial for you, but to show some of the more important differnences, which are made possible by the language design itself and the functional paradigm.

> Generally the application we will create will be a quite trivial one, but don't be afraid it will not be one more TODO list. We will fetch the lattest posts from same of the selected subreddits. 

2) __Introduction to elixir__
---
* __getting started__
<br />

  `run iex in terminal`
    
  ```elixir
  iex> 2 + 2
  4
  iex> 2 = 2
  2
  iex> 2 == 2
  true
  ```
---
* __basics data types__
  <br />
  * Integers
    ```elixir
    iex> 1024
    1024
    ```
        
  * Floats
    ```elixir
    iex> 2.71
    2.71
    ```

  * Booleans
    ```elixir
    iex> true
    true
    iex> false
    false
    ```

  * Atoms
    ```elixir
    iex> :foo
    :foo
    iex> :foo == :bar
    false
    ```
     
  * Strings
    ```elixir
    # Strings in Elixir are UTF-8 encoded and are wrapped in double quotes:
    iex> "Dobrý den"
    Dobrý den
    ```
---
* __modules__
  <br />
  ```elixir
  defmodule Fun do
    @moduledoc """
        This is a Fun modul documentation.
        To create it use the reserved attribute @moduledoc. 
        You can write even unit tests inside it, how cool is that:
        iex> Fun.fib(5)
        5
    """
    
    @doc """
        
    """
    def fib(0), do: 0
    def fib(1), do: 1
    def fib(n) do 
        fib(n-2) + fib(n-1)  
    end
  end
  ```
---
* __lambdas__
  <br />
  TBD
---
* __cool features__
  <br />
  * pipe operator |>
    ```elixir
    iex> a = fn(a, b) -> a + b
    iex> a(1, 2)
    3
    iex 1 |> a(2)
    3
    ```
  * pattern matching
    ```elixir
    iex> map = %{a: 1, b: 2}
    iex> %{:a => matched} = map
    iex> matched
    1
    ```
    
    ```elixir
    iex> tupple = {"a", "b", "c"}
    iex> {val, _, _} = tupple
    iex> val
    "a"
    ```
    
    ```elixir
    iex> list = [1, 2, 3]
    iex> [head | tail] = list
    iex> head
    1
    iex> tail
    [2, 3]
    ```
  * case
    ```elixir
    case Repo.insert(changeset) do
        {:ok, user} ->
            case Guardian.encode_and_sign(user, :token, claims) do
                {:ok, token, full_claims} ->
                    important_stuff(token, full_claims)
                error ->
                    error
            end
        error ->
            error
        end
    end
    ```
  * cond
    ```elixir
    ```
  * with
    ```elixir
    with {:ok, user} <- Repo.insert(changeset),
        {:ok, token, full_claims} <- Guardian.encode_and_sign(user, :token, claims) do
        important_stuff(token, full_claims)
    end
    ```
---
* __Mix__
  <br />
  > Mix is an Elixir executable. From ruby terms of view it is a combination of Bundler, RubyGems and Rake.

  * to list all commands use:
      `$ mix help`
  * to create new project
      `$ mix new my_fancy_elixir_project`
  * to interactively start your application:
      `$ iex -S mix`
  * install dependencies
      `$ mix deps.get`

  Inside mix.ex we can manage our dependencies

* __Testing__
