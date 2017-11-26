# lambdup-elixir-2017

Chapters are available by checking out the branches,
follow the README.md

* 01 - workshop and elixir introduction
* 02 - setting up phoenix 1.3 and its structure
* __03 - basic intro to OTP, genservers and ets__
* 04 - reddit API and fetching from it
* 05 - displaying the results

1) __What is OTP ?__
> OTP stands for Open Telecom Platform, although it's not that much about telecom anymore, we could say that its from the softwere that has a properties of a telecom application. Generally speaking OTP is nothing more then a set of abstract libraries for playing with elixir processes.

In this workshop we won't dive too much into how OTP works. (It would take us much more time), but we will run through the basics

2) [Process](http://elixir-lang.github.io/getting-started/processes.html)

> In Elixir, all code runs inside processes. Processes are isolated from each other, run concurrent to one another and communicate via message passing. Processes are not only the basis for concurrency in Elixir, but they also provide the means for building distributed and fault-tolerant programs.

> Most important methods implemented in Process module are: `spawn, send, receive`

```
iex> pid = spawn fn -> 1 + 2 end
#PID<0.44.0>
iex> Process.alive?(pid)
false
```

```
iex> send self(), {:hello, "world"}
{:hello, "world"}
iex> receive do
...>   {:hello, msg} -> msg
...>   {:world, msg} -> "won't match"
...> end
"world"
```

3) [Genserver](https://hexdocs.pm/elixir/GenServer.html)

> A GenServer is a process like any other Elixir process and it can be used to keep state, execute code asynchronously and so on. The advantage of using a generic server process (GenServer) implemented using this module is that it will have a standard set of interface functions and include functionality for tracing and error reporting. It will also fit into a supervision tree.

Example: 

```
defmodule Stack do
  use GenServer

  # API

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def push(pid, state) do
    GenServer.cast(pid, {:push, state})
  end

  # Callbacks

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# This is the client
Stack.pop(pid)
#=> :hello

Stack.push(pid, :world)
#=> :ok

Stack.pop(pid)
#=> :world
```
If we disect a genserver we can see that it is put together from two disctinct parts: the API and the callbacks. Basically we communicate with the genserver by calling API methods which triggers callbacks where our logic lies. As you can see from the API methods we are basically calling some modules implemented in the GenServer module. THe most important ones are the following: 

GenServer.call - triggers a handle_call a which is a blocking sync method, so we will use it when we want to block the genserver until the result arive

GenServer.cast - triggers a handle_cast callback which is an async method and we are using it when we don't care when the result will arrive
