FunctionManager = {}

-- Funções auxiliares
function exist(model) -- Existencia do modulo
	for i=1,#Manager do
		if model == Manager[i][1] then
			return true
		end
	end
	return false
end

function position(model) -- Posilçao de impressão do modulo
	for i=1,#Manager do
		if model == Manager[i][1] then
			return i
		end
	end
	return -1
end