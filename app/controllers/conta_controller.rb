class ContaController < ApplicationController
  def index
    @conta = Conta.new
    @pessoas = Pessoa.all
    @contas = Conta.includes(:pessoa).order(created_at: :desc)
  end

  def create
    @conta = Conta.new(conta_params)
    
    if @conta.save
      @contas = Conta.includes(:pessoa).order(created_at: :desc)
      render partial: 'contas_list', locals: { contas: @contas }
    else
      render partial: 'form', locals: { conta: @conta }, status: :unprocessable_entity
    end
  end

  def toggle_status
    @conta = Conta.find(params[:id])
    @conta.update(flagAtivo: !@conta.flagAtivo)
    
    @contas = Conta.includes(:pessoa).order(created_at: :desc)
    render partial: 'contas_list', locals: { contas: @contas }
  end

  private

  def conta_params
    params.require(:conta).permit(:saldo, :limiteSaqueDiario, :flagAtivo, :tipoConta, :Pessoa_id)
  end
end
