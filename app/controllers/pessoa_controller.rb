class PessoaController < ApplicationController
  def index
    @pessoa = Pessoa.new
    @pessoas = Pessoa.order(created_at: :desc)
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)
    
    if @pessoa.save
      @pessoas = Pessoa.order(created_at: :desc)
      render partial: 'pessoas_list', locals: { pessoas: @pessoas }
    else
      render partial: 'form', locals: { pessoa: @pessoa }, status: :unprocessable_entity
    end
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:nome, :cpf, :dataNascimento)
  end
end
