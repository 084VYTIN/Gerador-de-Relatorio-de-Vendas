require 'csv'
require 'terminal-table' 

class Venda
  attr_reader :data, :produto, :vendedor, :valor
  def initialize(data, produto, vendedor, valor)
    @data = data
    @produto = produto
    @vendedor = vendedor
    @valor = valor.to_f
  end
end

file_path = 'vendas.csv'
vendas = []

CSV.foreach(file_path, headers: true) do |row|
  vendas << Venda.new(row['data'], row['produto'], row['vendedor'], row['valor'])
end


rows = vendas.map { |v| [v.produto, v.vendedor, "R$ #{v.valor}"] }
table = Terminal::Table.new headings: ['Produto', 'Vendedor', 'Valor'], rows: rows

puts table
puts "Total de itens: #{vendas.size}"
puts "Valor total: R$ #{vendas.sum(&:valor).round(2)}"

require 'tty-prompt'

prompt = TTY::Prompt.new

choices = [
  { name: "Ver todas as vendas", value: :all },
  { name: "Ver resumo (Total)", value: :summary },
  { name: "Filtrar por vendedor", value: :filter_vendedor },
  { name: "Exportar resumo para arquivo", value: :export },
]

loop do
  begin
    choice = prompt.select("O que deseja fazer?", choices)
  rescue TTY::Reader::InputInterrupt
    puts "\nPrograma encerrado pelo usuário."
    break
  end

  case choice
  when :all
  when :summary
    total = vendas.sum(&:valor)
    media = total / vendas.size
    puts "Total de itens: #{vendas.size}"
    puts "Valor total: R$ #{total.round(2)}"
    puts "Ticket Médio: R$ #{media.round(2)}" 
  when :filter_vendedor
    vendedores = vendas.map(&:vendedor).uniq
    vendedor_escolhido = prompt.select("Escolha um vendedor:", vendedores)
    
    filtradas = vendas.select { |v| v.vendedor == vendedor_escolhido }
    rows = filtradas.map { |v| [v.produto, v.vendedor, "R$ #{v.valor}"] }
    table = Terminal::Table.new headings: ['Produto', 'Vendedor', 'Valor'], rows: rows
    puts table
  when :export
    File.open("relatorio.txt", "w") do |f|
      f.puts "--- RELATÓRIO DE VENDAS ---"
      f.puts "Total de itens: #{vendas.size}"
      f.puts "Valor total: R$ #{vendas.sum(&:valor).round(2)}"
      f.puts "Ticket Médio: R$ #{(vendas.sum(&:valor) / vendas.size).round(2)}"
    end
    puts "Relatório salvo com sucesso em 'relatorio.txt'!"
  end
end