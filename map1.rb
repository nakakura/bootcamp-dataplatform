require "rubygems"
require "json"
require "awesome_print"

while line = STDIN.gets
  begin
    json = JSON.parse(line)
    data = json["data"]
    tweet = data["text"]
    if tweet.to_s.include?("sleep") then
      puts tweet
    elsif tweet.to_s.include?("寝") then
      puts tweet
    elsif tweet.to_s.include?("眠") then
      puts tweet
    elsif tweet.to_s.include?("布団") then
      puts tweet
    elsif tweet.to_s.include?("ベッド") then
      puts tweet
    else

    end
  rescue Exception=>e
    STDERR.puts "(Exception) Failed to parse JSON data: '#{line.chomp}'"
  end
end
