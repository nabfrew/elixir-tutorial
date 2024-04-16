defmodule KV.Bucket do
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  puts value in bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn state ->
      Map.put(state, key, value)
    end)
  end

  @doc """
  Gets a value from the 'bucket' by 'key'.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
