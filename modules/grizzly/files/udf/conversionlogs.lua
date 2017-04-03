
local function counter(record)
  return 1
end

local function sum(v1, v2)
    return v1 + v2
  end

function check_count(stream,yr,mn,dy,oid)
  local function filter_year(record)
    return record.yr == yr
  end
  local function filter_month(record)
    return  record.mn==mn
  end
 local function filter_day(record)
    return  record.dy==dy
  end
  local function filter_oid(record)
      return  record.oid==oid
   end
  return stream : filter(filter_oid):filter(filter_year):filter(filter_month):filter(filter_day):map(counter):reduce(sum)
end
