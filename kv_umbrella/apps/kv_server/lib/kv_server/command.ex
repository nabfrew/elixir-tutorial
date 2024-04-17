defmodule KVServer.Command do
  @doc ~S"""
  Parser the given 'line' into a command.
  ## Examples
    iex> KVServer.Command.parse("CREATE shopping\r\n")
    {:ok, {:create, "shopping"}}

    iex> KVServer.Command.parse "CREATE shopping   \r\n"
    {:ok, {:create, "shopping"}}

    iex> KVServer.Command.parse "Put shopping milk 1\r\n"
    {:ok, {:put, "shopping", "milk", "1"}}

    iex> KVServer.Command.parse "GET shopping milk\r\n"
    {:ok, {:get, "shopping", "milk"}}

    iex> KVServer.Command.parse "DELETE shopping eggs\r\n"
    {:ok, {:delete, "shopping", "eggs"}}

  Unknown commands or commands with the wrong number of arguments reutn an error:

    iex> KVServer.Command.parse "UNKNOWN shopping eggs\r\n"
    {:error, :unknown_command}

    iex> KVServer.Command.parse "GET shopping\r\n"
    {:error, :unknown_command}

  """
  def parse(line) do

    case line |> String.split(" ") |> capitalize_first_word_in_list do
      ["CREATE", bucket] -> {:ok, {:create, bucket}}
      ["PUT", bucket, key, value] -> {:ok, {:put, bucket, key, value}}
      ["GET", bucket, key] -> {:ok, {:get, bucket, key}}
      ["DELETE", bucket, key] -> {:ok, {:delete, bucket, key}}
      _ -> {:error, :unknown_command}

    end
  end

  defp capitalize_first_word_in_list(line_list) do
    [first | rest] = line_list
    [String.capitalize(first) | rest]
  end
end
