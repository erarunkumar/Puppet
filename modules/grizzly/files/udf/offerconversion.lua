local function map_profile(record)
  -- Add username and password to returned map.
  -- Could add other record bins here as well.
  return map {cdte=record.cdte,
sts=record.sts,
oid=record.oid,
typ=record.typ,
cnvpxurl=record.cnvpxurl,
offerconversionpixel=record.offerconversionpixel,
id=record.id,
glid=record.glid,
afid=record.afid

}

end



function check_offer_conversion(stream,oid,afid,glid)
  local function filter_oid(record)
    return record.oid == oid
  end
  local function filter_afid(record)
    return  record.afid==afid
  end
 local function filter_glid(record)
    return  record.glid==glid
  end
  if(oid==0)  then
    return stream : filter(filter_oid):filter(filter_afid):map(map_profile)
  else
    return stream : filter(filter_oid):filter(filter_afid):filter(filter_glid):map(map_profile)
end
end