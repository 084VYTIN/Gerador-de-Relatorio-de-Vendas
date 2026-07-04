require 'sinatra'
require 'csv'

get '/' do
  linhas = CSV.read('vendas.csv')
  
  html = "<h1>Controle de Vendas</h1>"
  html += "<form action='/adicionar' method='POST'>
            Data: <input type='date' name='data'><br>
            Produto: <input type='text' name='produto'><br>
            Vendedor: <input type='text' name='vendedor'><br>
            Valor: <input type='text' name='valor'><br>
            <input type='submit' value='Adicionar Venda'>
          </form><hr>"
  
  html += "<table border='1'><tr><th>Data</th><th>Produto</th><th>Vendedor</th><th>Valor</th></tr>"
  
  linhas.drop(1).each do |linha|
    html += "<tr><td>#{linha[0]}</td><td>#{linha[1]}</td><td>#{linha[2]}</td><td>#{linha[3]}</td></tr>"
  end
  html += "</table>"
end

post '/adicionar' do
  File.open('vendas.csv', 'a') do |f|
    f.puts "#{params[:data]},#{params[:produto]},#{params[:vendedor]},#{params[:valor]}"
  end
  redirect '/'
end