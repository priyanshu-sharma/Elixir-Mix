defmodule KEYVALUE.RegistryTest do
    use ExUnit.Case, async: true

    setup do
        registry = start_supervised!(KEYVALUE.Registry)
        %{registry: registry}
    end

    test "spawn buckets", %{registry: registry} do
        assert KEYVALUE.Registry.lookup(registry, "shopping") == :error

        KEYVALUE.Registry.create(registry, "shoppping")
        assert {:ok, bucket} = KEYVALUE.Registry.lookup(registry, "shopping")

        KEYVALUE.Bucket.put(bucket, "milk", 1)
        assert KEYVALUE.Bucket.get(bucket, "milk") == 1
    end
end