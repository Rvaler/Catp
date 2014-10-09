#!/usr/bin/ruby -w

require 'date'


class Pessoa
	attr_accessor :nome, :data, :sexo, :local, :idade

	#constructor
	def initialize(nome = "Indefinido", data = nil, sexo = "Indefinido", local = 0.0)

		today = Time.new
		if(data!=nil)
			born = Date.parse data
			@idade = today.year - born.year
		else
			@idade = "Indefinido"
		end
		@nome = nome
		@data = Date.today.to_s
		@sexo = sexo
		@local = local
		

	end

	#accessor methods

	def printInfo
		puts "Nome: " + @nome
		puts "Data de Nascimento: " + @data
		puts "Sexo: " + @sexo
		puts "Localizacao: " + @local.to_s
		puts "Idade: " + @idade.to_s
	end
end


p = Pessoa.new("joao")
p.printInfo



