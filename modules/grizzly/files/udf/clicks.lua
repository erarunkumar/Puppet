local function map_profile(record)
  -- Add username and password to returned map.
  -- Could add other record bins here as well.
  return map{txnid=record.txnid,
dtme=record.dtme,
yr=record.yr,
mn=record.mn,
wk=record.wk,
dy=record.dy,
hr=record.hr,
adccrid=record.adccrid,
adcmpid=record.adcmpid,
oid=record.oid,
 afsid1=record.afsid1,
 admng=record.admng,
 afsid4=record.afsid4,
afid=record.afid,
afid5=record.afsid5,
  ofls=record.ofls,
afsid2=record.afsid2,
 afsid3=record.afsid3,
andid=record.andid,
rf=record.rf,
 andidmd=record.andidmd,
iosifamd=record.iosifamd,
afmng=record.afmng,
devosvr=record.devosvr,
 sts=record.sts,
 adid=record.adid,
url=record.url,
 iosifv=record.iosifv,
isclkunq=record.isclkunq,
pytc=record.pytc,
  ukid=record.ukid,
gaid=record.gaid,
  opudid=record.opudid,
macaddsh=record.macaddsh,
macaddmd=record.macaddmd,
 iosifa=record.iosifa,
   andidsh=record.andidsh,
 pytgid=record.pytgid,
crr=record.crr,
devos=record.devos,
 revtyp=record.revtyp,
usid=record.usid,
odin=record.odin,
crturl=record.crturl,
devidmd=record.devidmd,
 devid=record.devid,
devbrd=record.devbrd,
 cnt=record.cnt,
 afsrc=record.afsrc,
 ip=record.ip,
iosifash=record.iosifash,
macadd=record.macadd,
 pxlrf=record.pxlrf,
 oflid=record.oflid,
 usa=record.usa,
 devidsh=record.devidsh,
 rrevgid=record.revgid,
 revc=record.revc,
rcns=record.rcns,
pytyp=record.pytyp,
 bwr=record.bwr,
  devmdl=record.devmdl
  }
end

  local function mapper(rec)
     local element = map()
    element["dtme"] = rec["dtme"];
    element["txnid"] = rec["txnid"]
    element["tenantId"]=rec["tenantId"]
    return element
  end

local function accumulate(currentList, nextElement)
    local tenantId = nextElement["tenantId"]
    info("current:"..tostring(currentList).." next:"..tostring(nextElement))
      if currentList[tenantId] == nil then
        currentList[tenantId] = list()
      end
      list.append(currentList[tenantId], nextElement)
      return currentList
  end


    local function mymerge(a, b)
      local l = list.merge(a, b)
      local size = list.size(l)-1
      local newlist= list.drop(l,size)
    return newlist
  end

  local function reducer(this, that)
    return map.merge(this, that, mymerge)
  end

function check_oid(stream,oid,afid,ip,isclkunq,itst)
  local function filter_oid(record)
    return record.oid ==oid
  end
  local function filter_afid(record)
    return  record.afid==afid
  end
 local function filter_ip(record)
    return  record.ip==ip
  end

  local function filter_isUnique(record)
    return record.isclkunq ==isclkunq
  end
  local function filter_itst(record)
    return record.itst ==itst
  end

  return stream : filter(filter_oid):filter(filter_afid):filter(filter_ip):filter(filter_isUnique):filter(filter_itst):map(mapper):aggregate(map{}, accumulate):reduce(reducer)
end
