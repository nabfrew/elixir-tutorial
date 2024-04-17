defmodule KvServer.Command do
  @doc ~S"""
  Parser the given 'line' into a command.
  ## Examples

    iex> KVServer.Command.parse("Create shopping\r\n")
    {:ok, {:create, "shopping"}}
  """
  def parse(_line) do
    :not_implemented
  end
end
