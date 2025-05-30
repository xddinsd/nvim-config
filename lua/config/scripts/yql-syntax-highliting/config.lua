-- Code for vim (templated, sources are in arcadia/yql/
-- Converted to lua and tuned

local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "sql",
		callback = function()
			vim.cmd("syntax off")
		end,
	})

	vim.cmd([[
        augroup MySqlSyntax
            autocmd!
            autocmd FileType sql lua require('config.scripts.yql-syntax-highliting.config').set_hl()
        augroup END ]])
end

function M.set_hl()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "sql",
		callback = function()
			-- Отключает подсветку синтаксиса
			vim.cmd("syntax off")
		end,
	})

	local highlights = {
		yqlKeyword = "Statement",
		yqlSpecial = "Number",
		yqlString = "String",
		yqlNumber = "Number",
		yqlVariable = "Special",
		yqlComment = "Comment",
		yqlType = "Type",
		yqlFunction = "Function",
		yqlUdf = "Question",
		yqlEscaped = "Constant",
	}

	for group, link in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, { link = link })
	end

	vim.cmd([[
        syn case ignore


        syntax keyword yqlKeyword $row $rows action add all alter and any as asc assume async begin bernoulli between bigserial by callable case changefeed column columns commit compact create cross cube declare define delete desc dict discard distinct do drop else empty_action emptydict emptylist end enum erase evaluate except exclusion exists export family flatten flow for from full generic global group grouping having if ignore ilike import in index inner insert intersect into is join key left like limit list match not null nulls offset on only optional or order over partition pragma presort primary process reduce regexp repeatable replace resource respect result return right rlike rollup sample schema select semi serial serial2 serial4 serial8 set sets smallserial stream struct subquery sync table tablesample tagged then truncate tuple union unit update upsert use using values variant view void when where window with without xor
        syntax keyword yqlSpecial false true

        syntax region yqlString start=+"+  skip=+\\\\\|\\"+  end=+"+
        syntax region yqlString start=+'+  skip=+\\\\\|\\'+  end=+'+
        syntax region yqlString start=+@@+ skip=+@@@@+ end=+@@+

        syntax match yqlNumber "-\=\<[0-9]*\>"
        syntax match yqlNumber "-\=\<[0-9]*\.[0-9]*\>"
        syntax match yqlNumber "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
        syntax match yqlNumber "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
        syntax match yqlNumber "\<0x[abcdefABCDEF0-9]*\>"
        syntax match yqlNumber "\<0b[0-1]*\>"

        syntax match yqlVariable "\$[a-z0-9_]*"

        syntax match  yqlEscaped "`[^`]*`"
        syntax region yqlEscaped start="`" end="`"

        syntax region yqlComment start="/\*"  end="\*/"
        syntax match  yqlComment "--.*"

        syntax keyword yqlType bool bytes date datetime decimal double float int16 int32 int64 int8 interval json jsondocument string text timestamp tzdate tzdatetime tztimestamp uint16 uint32 uint64 uint8 utf8 uuid yson

        syntax keyword yqlFunction abs aggregate_by aggregate_list aggregate_list_distinct agg_list agg_list_distinct as_table avg avg_if adaptivedistancehistogram adaptivewardhistogram adaptiveweighthistogram addmember addtimezone aggregateflatten aggregatetransforminput aggregatetransformoutput aggregationfactory asatom asdict asdictstrict asenum aslist asliststrict asset assetstrict asstruct astagged astuple asvariant atomcode bitcast bit_and bit_or bit_xor bool_and bool_or bool_xor bottom bottom_by blockwardhistogram blockweighthistogram cast coalesce concat concat_strict correlation count count_if covariance covariance_population covariance_sample callableargument callableargumenttype callableresulttype callabletype callabletypecomponents callabletypehandle choosemembers combinemembers countdistinctestimate currentauthenticateduser currentoperationid currentoperationsharedid currenttzdate currenttzdatetime currenttztimestamp currentutcdate currentutcdatetime currentutctimestamp dense_rank datatype datatypecomponents datatypehandle dictaggregate dictcontains dictcreate dicthasitems dictitems dictkeytype dictkeys dictlength dictlookup dictpayloadtype dictpayloads dicttype dicttypecomponents dicttypehandle each each_strict emptydicttype emptydicttypehandle emptylisttype emptylisttypehandle endswith ensure ensureconvertibleto ensuretype enum evaluateatom evaluatecode evaluateexpr evaluatetype expandstruct filter filter_strict find first_value folder filecontent filepath flattenmembers forceremovemember forceremovemembers forcerenamemembers forcespreadmembers formatcode formattype frombytes frompg funccode greatest grouping gathermembers generictype histogram hll hoppingwindowpgcast hyperloglog if if_strict instanceof json_exists json_query json_value jointablerow just lag last_value lead least len length like likely like_strict lambdaargumentscount lambdacode lambdaoptionalargumentscount linearhistogram listaggregate listall listany listavg listcode listcollect listconcat listcreate listdistinct listenumerate listextend listextendstrict listextract listfilter listflatmap listflatten listfold listfold1 listfold1map listfoldmap listfromrange listfromtuple listhas listhasitems listhead listindexof listitemtype listlast listlength listmap listmax listmin listnotnull listreplicate listreverse listskip listskipwhile listskipwhileinclusive listsort listsortasc listsortdesc listsum listtake listtakewhile listtakewhileinclusive listtotuple listtop listtopasc listtopdesc listtopsort listtopsortasc listtopsortdesc listtype listtypehandle listunionall listuniq listzip listzipall loghistogram logarithmichistogram max max_by max_of median min min_by min_of mode multi_aggregate_by nanvl nvl nothing nulltype nulltypehandle optionalitemtype optionaltype optionaltypehandle percentile parsefile parsetype parsetypehandle pgand pgarray pgcall pgconst pgnot pgop pgor pickle quotecode range range_strict rank regexp regexp_strict rfind row_number random randomnumber randomuuid removemember removemembers removetimezone renamemembers replacemember reprcode resourcetype resourcetypehandle resourcetypetag some stddev stddev_population stddev_sample substring sum sum_if sessionstart sessionwindow setcreate setdifference setincludes setintersection setisdisjoint setsymmetricdifference setunion spreadmembers stablepickle startswith staticmap staticzip streamitemtype streamtype streamtypehandle structdifference structintersection structmembertype structmembers structsymmetricdifference structtypecomponents structtypehandle structunion subqueryextend subqueryextendfor subquerymerge subquerymergefor subqueryunionall subqueryunionallfor subqueryunionmerge subqueryunionmergefor top topfreq top_by tablename tablepath tablerecordindex tablerow tablerows taggedtype taggedtypecomponents taggedtypehandle tobytes todict tomultidict topg toset tosorteddict tosortedmultidict trymember tupleelementtype tupletype tupletypecomponents tupletypehandle typehandle typekind typeof udaf udf unittype unpickle untag unwrap variance variance_population variance_sample variant varianttype varianttypehandle variantunderlyingtype voidtype voidtypehandle way worldcode
        syntax match   yqlUdf "[a-z0-9_]*::[a-z0-9_]*"
    ]])
end

return M
