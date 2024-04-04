--!nocheck
--!optimize 2

local HttpService = game:GetService("HttpService")

local Promise = require(script.Promise)

local function Json(self)
	return pcall(HttpService.JSONDecode, HttpService, self.Body)
end

return function(Resource, Options)
	local RealOptions = Options or {}
	local RealBody = if type(RealOptions.Body) == "table"
		then HttpService:JSONEncode(RealOptions.Body)
		else RealOptions.Body

	return Promise.try(function(RealOptions, RealBody)
		local HttpResponse = HttpService:RequestAsync({
			Url = Resource,
			Method = RealOptions.Method or "GET",
			Headers = RealOptions.Headers or {},
			Body = RealBody,
		})

		return {
			Body = HttpResponse.Body,
			Headers = HttpResponse.Headers,
			Status = HttpResponse.StatusCode,
			StatusText = HttpResponse.StatusMessage,
			Ok = HttpResponse.Success,
			Url = Resource,

			Json = Json,
		}
	end, RealOptions, RealBody)
end
