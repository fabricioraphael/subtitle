class Home < ActiveRecord::Base
  # path = ARGV[0].to_s

   subtitle = []
   cont = 0

   
   def open_arq path, value, operacao
     arq_final = Array.new
     Dir.entries("#{path}").each do |entry|
         unless File.directory?("#{path}/#{entry}")
            arq = File.readlines("#{path}/#{entry}")
            array = Array.new
            arq.size.times do |line|
              if arq[line] =~ /\d{2}:\d{2}:\d{2}/
                horario = arq[line].to_s.scan(/\d{2}:\d{2}:\d{2}/)
                # puts "horario Antes: #{horario[0]} - #{horario[1]}"
                horario1 = calcular horario[0], value, operacao
                horario2 = calcular horario[1], value, operacao
                # puts "horario Depois: #{horario1} - #{horario2}"
                arq_final << arq[line]
              else
                arq_final << arq[line]
              end
            end
         end 
     end
     arq_final
   end
   
   def write_arq arq_final
     File.open("arq_final.txt", 'w') do |file|
       x = 0
       arq_final.each do |arq|
         file.write arq_final[x]
         x += 1
       end
     end
  end

   def calcular horario, value, operacao
     array = horario.to_s.scan(/\d{2}/).to_a
     hor = array[0].to_i
     min = array[1].to_i
     seg = array[2].to_i
     # p "horario - antes: #{horario}"
     if operacao == true
       horario = som seg, min, hor, value
     else
       horario = sub seg, min, hor, value
     end
     # p "horario - depois: #{horario}"
     horario
   end  
   
   def som seg, min, hor, value
     if ((seg + value) <= 60)
      seg += value
     elsif min + 1 <= 60
      min += 1
      seg = (seg + value) - 60
     else 
      hor += 1
      min = (min + 1) - 60
      seg = (seg + value) - 60
     end
     horario = "#{hor}:#{min}:#{seg}"
   end  
   
   def sub seg, min, hor, value
     if seg - value >= 0
      seg -= value
     elsif min - 1 >= 0
      min -= 1
      seg = (seg - value) + 60
     else 
      hor += 1
      min = (min - 1) + 60
      seg = (seg - value) + 60
     end
     horario = "#{hor}:#{min}:#{seg}"
   end
end











