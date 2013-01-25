
class MyData
  attr_accessor :eval, :message, :counter

  def initialize()
    @message = ''
    @eval = ''
    @counter = 0
  end
end

def eval(hash, array)
  begin
    key = array[1].to_s
    if( hash.key?(key) )
      data = hash[key]
      hash[key] += array[2].to_i
    else
      hash[key] = array[2].to_i
    end
  rescue Exception=>e
    STDERR.puts "error" + e
  end
end

def out(hash, array)
  begin
    key = array[0].to_s
    if( hash.key?(key) )
      data = hash[key]
      data.counter += array[2].to_i
      hash[key] = data
    else
      data = MyData.new()
      data.message = array[0].to_s
      data.eval = array[1].to_s
      data.counter = array[2].to_i
      hash[key] = data
    end
  rescue Exception=>e
    STDERR.puts "error" + e
  end
end

evaluation = Hash.new
output = Hash.new

while line = STDIN.gets
  begin
    line.chomp!
    array = line.split(/\t/)
    out(output, array)
    eval(evaluation, array)
  rescue Exception=>e
    STDERR.puts "error" + e
  end
end

output.each_key {|key|
  data = output[key]
  print data.message.to_s + "\t" + data.eval.to_s + "\t" + data.counter.to_s + "\n"
}

evaluation.each_key {|key|
  print key.to_s + "\t" + evaluation[key].to_s + "\n"
}


