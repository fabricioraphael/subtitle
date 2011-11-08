class HomeController < ApplicationController
  def index
    @home = Home.new
    @arq_name = params[:arq_name]
  end
  
  def upload
    @home = Home.new
    @arq_final = Array.new
  
    @arq = params[:arq][:id]
    
    puts "=========================== NIL? #{@arq.nil?}"
    puts "=========================== WTF? #{@arq}"
    puts "=========================== class #{@arq.class}"
    puts "=========================== name: #{@arq.original_filename}"    
    @arq_name = @arq.original_filename
    puts "=========================== NIL2? #{@arq_name.nil?}"
    puts "=========================== class2 #{@arq_name.class}"
    @home.save_file @arq
        
    @arq_final = @home.read_arq params[:home][:value].to_i, params[:home][:operacao], @arq_name

    @home.write_arq @arq_final, @arq_name
        
    render :index, :arq_name => @arq_name
  end
  
  def download
    @arq_name = params[:arq_name]
    send_file("#{RAILS_ROOT}/public/uploads/arq_final/#{@arq_name}", :filename => "#{@arq_name}", :type=>"text/plain")
  end
  
end