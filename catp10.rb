#!/usr/bin/ruby -w

require 'date'


class Pessoa
	
	attr_accessor :nome, :data, :sexo, :local, :idade

	#constructor (nome, data_nascimento, sexo, localizacao)
	def initialize(nome = "Indefinido", data = nil, sexo = "Indefinido", local = "0.0")

		#validations
		today = Date.today
		
		if(data!=nil)

			born = Date.parse data
			if(born <= today)
				@idade = age(born)
				@data = data.to_s
			else
				@data = Date.today.to_s	
				@idade = "Indefinido"			
			end
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
		puts "Data de Nascimento: " + @data.to_s
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
		getNascimento
		getIdade
		getSexo
		getLocal
	end

	
	
end



#p = Pessoa.new("Joao da Silva", "10/10/1993", )
pessoa1 = Pessoa.new("Joao Silva", "07/10/2002", "masculino", "7.5")

pessoa2 = Pessoa.new

pessoa2.nome = "Maria Soares"
pessoa2.data = "25-03-1975"
pessoa2.sexo = "Feminino"
pessoa2.idade = 23

pessoa1.printInfo
puts 
pessoa2.printInfo



