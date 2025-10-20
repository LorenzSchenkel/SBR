#!/usr/bin/env texlua

--[[
	Build script for the OTHR-CI project
	Copyright (C) 2025 Marei Peischl <othr-ci@peitex.de>

	This file is part of the build system of the OTHR-CI bundle.

	It may be distributed and/or modified under the conditions of the
	LaTeX Project Public License (LPPL), either version 1.3c of this
	license or (at your option) any later version. The latest version
	of this license is in the file

	https://www.latex-project.org/lppl.txt
]]

module="othr-ci"

sourcefiledir="tex"
sourcefiles={"**/*.dtx", "**/*.ins","**/*.sty", "**/*.cls","**/*.pdf","**/*.cfg", "**/*.clo", "**/*.def","**/*.lco"}
installfiles={"**/*.sty", "**/*.cls","**/*.pdf","**/*.cfg", "**/*.clo", "**/*.def","**/*.lco"}

textfiles= {"*.md"}

flatten=false

typesetexe="lualatex"
-- change font setting for release
typesetopts="\\\\PassOptionsToPackage{main-font=lucida}{othr-fonts}"

demofiles = {"examples/*/*.tex"}--,"manuals/*/*.tex","templates/*/*.tex"}
supportdir="."--"examples"

typesetsuppfiles={ "**/*.bib", "*.bib", "*.lco", "**/*.jpg"}
typesetdemofiles = demofiles

-- allow to tag the build.lua file by only excluding it for other targets
excludefiles={"*/Example-*.tex","Examples-*","*~"}
if not options["target"] == "tag" then
	excludefiles={table.unpack(excludefiles),"build.lua","config-*.lua"}
end

packageversion = "0.02-dev"
packagedate = "2025-10-20"

tagfiles = {"*.cfg", "*.md", "*.clo", "*.tex", "*.lco", "*.def", "*.bib", "*.lua", "*.ins", "**/*.dtx"}

-- compare tags to separate -dev tags
function get_dev_tag (oldtag)
	if string.match(oldtag, "%-dev$") then
		return (oldtag), true
	end
	newtag=string.gsub(oldtag,"v?(%d+).%d+%-?%w*%s?","%1.")..string.format("%02d",math.floor(string.gsub(oldtag,"v?%d+.(%d+)%-?%w*%s?","%1") + 1))
	return newtag.."-dev",false
end

--[[
  # Tagging configuration
]]

function update_tag(file, content, tagname, tagdate)
	local versionpattern = "%d+.%d+%-?%w*"
	local datepattern = "%d%d%d%d%-%d%d%-%d%d"
	local tag_only_changes = false
	local tagname = tagname or packageversion
	local old_tagpattern = packageversion
	if tagname == "dev" or string.match(tagname, "%-dev$") then
		tagname, tag_only_changes = get_dev_tag(packageversion)
	else
		if string.find(old_tagpattern, "-dev")==nil then
			old_tagpattern=old_tagpattern.."-dev"
		end
  end
  -- when a new tag is set all old_dev tags shoould be replaces as well should be replaced as well
	old_tagpattern = string.gsub(old_tagpattern, "%.", "%%.")
	old_tagpattern = string.gsub(old_tagpattern, "%-", "%%-")
	-- tagging \changes
	if file ~= "build.lua" then
		content = string.gsub(content, "\\changes{v?0*%.0*}{" .. datepattern,
							"\\changes{v" .. tagname .. "}{" .. tagdate)
  else
		content = string.gsub(content,
							"(packageversion%s*=%s*\")" .. versionpattern,
							"%1" .. tagname)
	end
	-- don't tag everything to not change all dates
  if tag_only_changes then return content end
  -- change all old-dev in case it's not a dev-tag
  content = string.gsub(content,
		"v?" .. old_tagpattern .. " %("..datepattern.."%)",
		"v" .. tagname .. " (" .. tagdate..")")
	if string.match(file, "%.md$") or string.match(file, "%.tex$") then
		content = string.gsub(content,
							"(tuda%-ci v|version)" .. versionpattern .. "%s%(" ..
								datepattern .. "%)",
							"%1" .. tagname .. " (" .. tagdate .. ")")
	elseif file == "build.lua" then
		content = string.gsub(content,
							"(packageversion%s*=%s*\")" .. versionpattern,
							"%1" .. tagname)
		content = string.gsub(content, "(packagedate%s*=%s*\")" .. datepattern,
							"%1" .. tagdate)
	else
		content = string.gsub(content, "(\\Provides%a+{[^\n]+}\n?%s-%[)" ..
								datepattern .. "%s-v" .. versionpattern,
							"%1" .. tagdate .. " v" .. tagname)
		content = string.gsub(content,
							"(\\ProvidesExpl%a-{[^\n]-}){[^\n]-}{[^\n]-}",
							"%1{" .. tagdate .. "}{" .. tagname .. "}")
		content = string.gsub(content, "(\\usepackage{" .. module .. "}%[)" ..
								datepattern .. "%]", "%1" .. tagdate .. "]")
		content = string.gsub(content,
							"\\changes{v" .. tagname .. "(%-dev)?}{" ..
								datepattern,
							"\\changes{v" .. tagname .. "}{" .. tagdate)
		content = string.gsub(content,
			"\\changes{v" .. old_tagpattern .. "}{" ..
			datepattern,
			"\\changes{v" .. tagname .. "}{" .. tagdate)
	end
	return content
end

--[[
  # CTAN/Upload configuration
]]

git_base_url = "https://codeberg.org/OTH-Regensburg/OTHRegensburg-LaTeX"
ctanpkg = module
ctanzip=ctanpkg.."-ctan_v"..packageversion
uploadconfig = {
	author = "Michael Niemetz, Marei Peischl",
	uploader = "Marei Peischl",
	description = "", -- TODO
	pkg = ctanpkg,
	version = packageversion .. " " .. packagedate,
	license = "lppl1.3c",
	summary = "LaTeX templates using CI of OTH Regensburg",
	ctanPath = "/macros/latex/contrib/" .. ctanpkg,
	home = "",
	support = "",
	repository = {git_base_url .. ".git"},
	bugtracker = {git_base_url .. "/issues"},
	announcement_file = "ctan.ann",
	update = true,
	note_file = "ctan.note"
}
