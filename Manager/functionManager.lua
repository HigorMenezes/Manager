FunctionManager = {}

-- Funções auxiliares
function exist(data) -- Existencia do modulo
	for i=1,#Manager do
		if data == Manager[i][1] then
			return true
		end
	end
	return false
end

function position(data) -- Posilçao de impressão do modulo
	for i=1,#Manager do
		if data == Manager[i][1] then
			return i
		end
	end
	return -1
end