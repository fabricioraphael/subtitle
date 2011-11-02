class Home < ActiveRecord::Base
   @@path = "#{RAILS_ROOT}/public/uploads"

   def save_file arq
     if not arq.nil?  
       filepath = "#{@@path}/#{arq.original_filename}"   
       File.open(filepath, "wb") do |f|  
         f.write(arq.read)  
       end  
     end
   end

   def read_arq value, operacao, arq_name
     arq_final = Array.new
       unless File.directory?("#{@@path}/#{arq_name}")
          arq = File.readlines("#{@@path}/#{arq_name}")
          array = Array.new
          arq.size.times do |line|
            if arq[line] =~ /\d{2}:\d{2}:\d{2}/
              horario = arq[line].to_s.scan(/\d{2}:\d{2}:\d{2}/)
              
              horario1 = calcular horario[0], value, operacao
              horario2 = calcular horario[1], value, operacao
                            
              str = arq[line].to_s.gsub(horario[0],horario1.to_s)
              str = str.to_s.gsub(horario[1],horario2.to_s)              
              
              arq_final << str
            else
              arq_final << arq[line]
            end
          end
       end 
     arq_final
   end
 
   def write_arq arq_final, arq_name
     File.open("#{@@path}/arq_final/#{arq_name}", 'w') do |file|
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
     if operacao == "true"
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