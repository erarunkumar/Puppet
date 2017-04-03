
local function counter(record)
  return 1
end

local function sum(v1, v2)
    return v1 + v2
  end

function check_count(stream,txnid)
  local function filter_txnid(record)
    return record.txnid == txnid
  end
  return stream : filter(filter_txnid):map(counter):reduce(sum)
end
