class CryptosController < ApplicationController
  #before_action :set_crypto, only: [:show, :edit, :update, :destroy]
  # GET /cryptos
  # GET /cryptos.json
  def index
    if Crypto.first.nil?
      @cryptos = Cryptomonnaies.new 
    end
   
    @all = Crypto.all
    if (params[:name]) != nil
     @find = @all.find_by(name:(params[:name]))
      #redirect_to '/show'
      puts @find
     end
  end
 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def crypto_params
      params.require(:crypto).permit(:name, :value)
    end
end
