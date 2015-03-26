---
-- tests/actions/vstudio/vc2010/test_floatingpoint.lua
-- Validate handling of vectorextensions() in VS 2010 C/C++ projects.
--
-- Created 26 Mar 2015 by Jason Perkins
-- Copyright (c) 2015 Jason Perkins and the Premake project
---

	local suite = test.declare("vs2010_vc_floatingpoint")
	local m = premake.vstudio.vc2010


	local sln, prj

	function suite.setup()
		_ACTION = "vs2010"
		sln, prj = test.createsolution()
	end

	local function prepare()
		local cfg = test.getconfig(prj, "Debug")
		m.floatingPointModel(cfg)
	end



	function suite.instructionSet_onNotSet()
		test.isemptycapture()
	end


	function suite.floatingPoint_onFloatFast()
		flags "FloatFast"
		prepare()
		test.capture [[
<FloatingPointModel>Fast</FloatingPointModel>
		]]
	end

	function suite.floatingPoint_onFloatStrict()
		flags "FloatStrict"
		prepare()
		test.capture [[
<FloatingPointModel>Strict</FloatingPointModel>
		]]
	end



