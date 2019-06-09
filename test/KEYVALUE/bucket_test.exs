defmodule KEYVALUE.BucketTest do
	use ExUnit.Case, async: true

	setup do
		{:ok, bucket} = KEYVALUE.Bucket.start_link([])
		%{bucket: bucket}
	end

	test "Store values by key", %{bucket: bucket} do 
		
		assert KEYVALUE.Bucket.get(bucket, "milk") == nil

		KEYVALUE.Bucket.put(bucket, "milk", 3)
		assert KEYVALUE.Bucket.get(bucket, "milk") == 3

		assert KEYVALUE.Bucket.get(bucket, "rice") == nil

		KEYVALUE.Bucket.put(bucket, "rice", 8)
		assert KEYVALUE.Bucket.get(bucket, "rice") == 8

		KEYVALUE.Bucket.delete(bucket, "rice")
		assert KEYVALUE.Bucket.get(bucket, "rice") == nil
	end

end