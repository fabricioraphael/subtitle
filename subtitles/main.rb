class Main < ActiveRecord::Base
  path = ARGV[0].to_s

  subtitle = []
  cont = 0
  arq = File.readlines("arq.txt")
  array = Array.new
  main = Main.new
  arq.size.times do |line|
    if arq[line] =~ /\d{2}:\d{2}:\d{2}/
      horario = arq[line].to_s.scan(/\d{2}:\d{2}:\d{2}/)
      puts "horario: #{horario[0]} - #{horario[1]}"
      calcular horario 
      puts arq[line]
    else
      puts arq[line]
    end
  end
  
  # private
  def self.calcular array_horario 
    # seg = array_horario[0].to_s.scan(/\d{2}/)
    seg = "12"
    p "Seg: #{seg}"
    # min
    # hor
    # array_horario
  end

end




# Dir.entries("#{path}").each do |entry|
#   unless File.directory?("#{path}/#{entry}")
#     arqx = File.read("#{path}/#{entry}")
# 
#     # if arqx =~ /\d{2}:\d{2}:\d{2}/
#     subtitle = arqx.scan /\d{2}:\d{2}:\d{2}/
#     
#     p " Cont: #{cont}  -  Arq:  #{subtitle}"
#     # end
#     cont += 1
#   end
# end

# File.open("arq.txt") do |txt|
#   txt.each_line("linha") do |linha|
#     if linha =~ /\d{2}:\d{2}:\d{2}/
#       puts "Um horario"
#     end
#     puts "Cont: #{cont} Linha#{linha}"
#     cont += 1
#   end
# end
