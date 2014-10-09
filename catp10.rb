#!/usr/bin/ruby -w

require 'date'


class Pessoa
	

	#constructor (nome, data_nascimento, sexo, localizacao)
	def initialize(nome = "Indefinido", data = nil, sexo = "Indefinido", local = "0.0")

		#validations

		if(data!=nil)
			born = Date.parse data
			@idade = age(born)
			@data = data.to_s
		else
			@data = Date.today.to_s	
			@idade = "Indefinido"
		end

		if(nome.length > 0 and nome.include? " " and nome != nil and !startWithNumber?(nome))
			@nome = nome
		else
			@nome = "Indefinido"
		end

		sexo = sexo.downcase
		if(sexo == 'masculino' or sexo == 'feminino')
			@sexo = sexo
		else
			@sexo = 'indefinido'
		end
		@local = local

	end

	def age(dob)
	  now = Time.now.utc.to_date
	  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end

	def startWithNumber?(string)
		if(string[0] == '0' or string[0] == '5' or
			string[0] == '1' or string[0] == '6' or
			string[0] == '2' or string[0] == '7' or
			string[0] == '3' or string[0] == '8' or
			string[0] == '4' or string[0] == '9')
			return true
		else 
			return false
		end
	end



	#accessor methods

	def getNome
		puts "Nome: " + @nome
	end

	def getNascimento
		puts "Data de Nascimento: " + @data
	end

	def getSexo
		puts "Sexo: " + @sexo
	end

	def getLocal
		puts "Localizacao: " + @local.to_s
	end

	def getIdade
		puts "Idade: " + @idade.to_s
	end

	def printInfo
		getNome
		getIdade
		getLocal
		getSexo
		getNascimento
	end

	attr_accessor :nome, :data, :sexo, :local, :idade
	
end



#p = Pessoa.new("Joao da Silva", "10/10/1993", )
p = Pessoa.new
p.nome = "joao"
puts p.nome
puts p.sexo
#p.nome = "joao"
#p.local = 5.5
#p.data = '23-10-1993'
p.printInfo




