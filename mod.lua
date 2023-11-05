function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "train", "siemens", "es64f4", "eurosprinter", "electric", "multi-system", "universal" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
        params = {
			{
				key = "g1206fake",
				name = _("Fake_g1206"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_g_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},

	runFn = function (settings, modParams)

		--- Fake ---
		
        local fake_g1206 = {
			["fake_gebraucht1.mdl"] = true,
			["fake_gebraucht2.mdl"] = true,
        }
        
		--- Fake --
        local modelFilterFake = function(fileName, data)
			local modelName = fileName:match('/g1206_([^/]*.mdl)')
			return (modelName==nil or fake_g1206[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
            if params["g1206fake"] == 0 then
				addFileFilter("model/vehicle", modelFilterFake)
			end
		else
            addFileFilter("model/vehicle", modelFilterFake)
		end

	end
	}
end
