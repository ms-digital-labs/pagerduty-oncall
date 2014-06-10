require "dotenv"
require "httpclient"
require "jsonpath"
require "sinatra"

Dotenv.load

CONTACT_NUMBERS=Hash[ENV["CONTACT_NUMBERS"].split(",").map{|v| v.split(":") }]

client = HTTPClient.new()

use Rack::Auth::Basic, "Protected Area" do |_username, password|
  password == ENV["PASSWORD"]
end

get "/" do
  doc = client.get_content(
    "https://#{ENV["ACCOUNT"]}.pagerduty.com/api/v1/escalation_policies/on_call",
    {},
    Authorization: "Token token=#{ENV["API_KEY"]}"
  )

  on_call = JsonPath.new("$..on_call").first(doc)
  primary = on_call.find{|v| v["level"] == 1 }
  email = primary["user"]["email"]
  "#{email} – #{CONTACT_NUMBERS[email]}"
end
