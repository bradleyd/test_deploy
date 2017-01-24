defmodule TestDeploy.FakeLogger do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    level = TestDeploy.Config.lookup(:logging_level)
    Logger.configure(level: level)
    {:ok, level}
  end

  def update_logging do
    GenServer.call(__MODULE__, :change_level)
  end

  def level do
    GenServer.call(__MODULE__, :level)
  end

  def handle_call(:level, _from, state) do
    {:reply, state, state}
  end
  def handle_call(:change_level, _from, state) do
    TestDeploy.Config.sighup
    level = TestDeploy.Config.lookup(:logging_level)
    Logger.configure(level: level)
    {:reply, level, level}
  end
  def handle_call(_message, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(_message, state) do
    {:noreply, state}
  end

  def handle_info(_message, state) do
    {:noreply, state}
  end

end
