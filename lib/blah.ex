defmodule TestDeploy.Blah do
  require Logger
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    :erlang.send_after(5000, __MODULE__, :log_info)
    :erlang.send_after(5000, __MODULE__, :log_warn)
    {:ok, args}
  end

  def handle_call(_message, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(_message, state) do
    {:noreply, state}
  end

  def handle_info(:log_warn, state) do
    Logger.warn("I am logging warn")
    :erlang.send_after(5000, __MODULE__, :log_warn)
    {:noreply, state}
  end
  def handle_info(:log_info, state) do
    Logger.info("I am logging info")
    :erlang.send_after(5000, __MODULE__, :log_info)
    {:noreply, state}
  end
  def handle_info(_message, state) do
    {:noreply, state}
  end

end
