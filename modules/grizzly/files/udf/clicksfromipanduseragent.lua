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

function check_usa(stream,ip)
  local function filter_usa(record)
    return record.usa ==usa
end

 local function filter_ip(record)
    return  record.ip==ip
  end
  return stream :filter(filter_ip):map(map_profile)
end


  

