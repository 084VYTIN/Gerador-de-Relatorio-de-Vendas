require 'sinatra'
require 'csv'


get '/' do
  @linhas = CSV.read('vendas.csv')
  erb :index
end

post '/adicionar' do
  if params[:data].empty? || params[:produto].empty? || params[:vendedor].empty? || params[:valor].empty?
    return "Erro: Todos os campos são obrigatórios! <a href='/'>Voltar</a>"
  end

  valor = params[:valor].to_f
  if valor <= 0
    return "Erro: O valor deve ser um número maior que zero! <a href='/'>Voltar</a>"
  end

  File.open('vendas.csv', 'a') do |f|
    f.puts "#{params[:data]},#{params[:produto]},#{params[:vendedor]},#{valor}"
  end
  
  redirect '/'
end