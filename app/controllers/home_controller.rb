class HomeController < ApplicationController
  def index
    @home = Home.new
  end
  
  def upload
    @home = Home.new
    @arq_final = Array.new
  
    @arq = params[:home][:arq]
    @arq_name = @arq.original_filename
    
    @home.save_file @arq
    
    @arq_final = @home.read_arq params[:home][:value].to_i, params[:home][:operacao], @arq_name

    @home.write_arq @arq_final, @arq_name
  end
end
