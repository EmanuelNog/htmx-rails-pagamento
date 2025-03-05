class TransacaoController < ApplicationController
  def index
    @contas = Conta.includes(:pessoa).where(flagAtivo: true).order('pessoas.nome')
  end

  def show_history
    @conta = Conta.find(params[:conta_id])
    
    unless @conta.flagAtivo
      render json: { error: 'Conta inativa' }, status: :unprocessable_entity
      return
    end
    
    @transacoes = @conta.transacoes.order(created_at: :desc)
    render partial: 'transactions_list', locals: { 
      conta: @conta,
      transacoes: @transacoes
    }
  end

  def deposit
    @conta = Conta.find(params[:conta_id])
    
    unless @conta.flagAtivo
      render json: { error: 'Não é possível depositar em uma conta inativa' }, status: :unprocessable_entity
      return
    end

    valor = params[:valor].to_d
    
    if valor > 0 && @conta.update(saldo: @conta.saldo + valor)
      @transacao = Transacao.create!(
        Conta_id: @conta.id,
        valor: valor
      )
      
      render partial: 'transaction_success', locals: { 
        conta: @conta,
        valor: valor
      }
    else
      render json: { error: 'Valor inválido' }, status: :unprocessable_entity
    end
  end

  def list
    @contas = Conta.includes(:pessoa).where(flagAtivo: true).order('pessoas.nome')
    @transacoes = if params[:conta_id].present?
      Conta.find(params[:conta_id]).transacoes.order(created_at: :desc)
    else
      []
    end
  end
end
