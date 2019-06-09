defmodule KEYVALUE.Bucket do
	use Agent

	@doc """ 
	Start a new bucket. 
	"""

	def start_link(_opts) do
		Agent.start_link(fn -> %{} end)
	end

	@doc """ 
	To get the value from the bucket by key.  
	"""

	def get(bucket, key) do
		Agent.get(bucket, &Map.get(&1, key))
	end

	@doc """ 
	To Put the value for a given key in bucket.  
	""" 

	def put(bucket, key, value) do
		Agent.update(bucket, &Map.put(&1, key, value))
	end

	@doc """
	To delete key from bucket. Return the current value of key, if key exists
	"""
	def delete(bucket, key) do
		Process.sleep(1000)
		Agent.get_and_update(bucket, fn dict ->
			Process.sleep(1000)
			Map.pop(dict, key)
		end)
	end
end