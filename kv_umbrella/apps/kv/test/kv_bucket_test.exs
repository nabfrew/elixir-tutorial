defmodule KvBucketTest do
  use ExUnit.Case, async: true

  setup do
    bucket = start_supervised!(KV.Bucket)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "item") == nil
    KV.Bucket.put(bucket, "item", 3)
    assert KV.Bucket.get(bucket, "item") == 3
  end

  test "deletes values by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "item", 3)
    assert KV.Bucket.get(bucket, "item") == 3
    KV.Bucket.delete(bucket, "item")
    assert KV.Bucket.get(bucket, "item") == nil
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
