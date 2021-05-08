#! /bin/hilbish

function asmansi(code)
	return '\27[' .. code .. 'm'
end

print ''
for i = 0, 3 do
	local block = (i == 0 and '▄' or '█')
	for color = 1, 7 do
		local panepart = (i == 3 and asmansi '1' .. ' ▀▀▀▀'
		or '████' .. asmansi '1' .. block)

		local line = asmansi('3' .. color) 
		.. (color == 1 and ' ' or '') .. panepart .. '  ' .. asmansi '0'

		io.write(line)
	end
	print ''
end
print ''
