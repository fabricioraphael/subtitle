class Home < ActiveRecord::Base

   def open_arq path, value, operacao
     arq_final = Array.new
     Dir.entries("#{path}").each do |entry|
         unless File.directory?("#{path}/#{entry}")
            arq = File.readlines("#{path}/#{entry}")
            array = Array.new
            arq.size.times do |line|
              if arq[line] =~ /\d{2}:\d{2}:\d{2}/
                horario = arq[line].to_s.scan(/\d{2}:\d{2}:\d{2}/)
                horario1 = calcular horario[0], value, operacao
                horario2 = calcular horario[1], value, operacao
                arq_final << arq[line]
              else
                arq_final << arq[line]
              end
            end
         end 
     end
     arq_final
   end
   
   def write_arq arq_final, path
     File.open("#{path}/arq_final/arq_final.txt", 'w') do |file|
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
     if operacao == true
       horario = som seg, min, hor, value
     else
       horario = sub seg, min, hor, value
     end
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











