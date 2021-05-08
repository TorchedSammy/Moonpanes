#!/bin/hilbish
local os = require 'os'
local fs = require 'fs' -- fs module from Hilbish

local f = io.open 'moonpanes.lua'
local source = f:read '*a'
f:close()

local destdir = os.getenv 'DESTDIR' and os.getenv 'DESTDIR' or ''
local prefix = os.getenv 'PREFIX' and os.getenv 'PREFIX' or '/usr'
local binpath = destdir .. prefix .. '/bin'

-- i should really make fs.mkdir recursive :\
function mkdirAll(path)
	local dirarr = string.split(path, '/')
	local appendeddir = ''
	for i = 1, #dirarr do
		appendeddir = appendeddir .. dirarr[i] .. '/'
		fs.mkdir(appendeddir)
	end
end

-- makes our destination directory if it doesnt exist
mkdirAll(binpath)

-- Install moonpanes
local dest, e = io.open(binpath .. '/moonpanes', 'w+')
assert(dest, e)

dest:write(source)
dest:close()

os.execute('chmod 755 ' .. binpath .. '/moonpanes')
print('Installed Moonpanes to ' .. binpath .. '/moonpanes')
