json.array!(@ec2_instances) do |ec2_instance|
  json.extract! ec2_instance, :id
  json.url ec2_instance_url(ec2_instance, format: :json)
end
