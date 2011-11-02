class HomeController < ApplicationController
  def index
    path = "/Users/fabricioraphael/trak/develop/rails/dvp/subtitle/public/arqs"
    @home = Home.new
    @arq_final = Array.new
    @arq_final = @home.open_arq path, 2, true
    @home.write_arq @arq_final, path
  end
end
