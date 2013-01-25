require "rubygems"
require "json"
require "psrp_rich_indexer"
require "awesome_print"

profile_path = "/usr/local/richindexer/etc/profile_u.txt"
scenario_path = "/usr/local/richindexer/sample/evl/scenario_plain_u.txt"

rich = PsrpRichIndexer::Indexer.new(profile_path, scenario_path)

while tweet = STDIN.gets
  begin
    tweet.chomp!
    results = rich.analyze(tweet)
    results.each do |result|
    record = result.split(/\t/)
    if record[0][0..1] == "e:"
      esf = record[4]
      esf.slice!(0,3)
      pn_class = record[3]
      puts esf+"\t"+pn_class+"\t1"
    end
  end
  rescue Exception=>e
    STDERR.puts "(Exception) Failed to parse JSON data: '#{line.chomp}'"
  end
end


