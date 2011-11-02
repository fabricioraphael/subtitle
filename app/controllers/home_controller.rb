class HomeController < ApplicationController
  def index
    @home = Home.new
    @arq_final = Array.new
    @arq_final = @home.open_arq "/Users/fabricioraphael/trak/develop/rails/dvp/subtitle/public/arqs", 2, true
    @home.write_arq @arq_final
  end
end
