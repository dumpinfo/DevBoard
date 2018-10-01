
function ads_txt_type(t1,t2)
{
  var tb=" target=_blank";
  if (t2==0) tb="";
  if (ads_txt_num<1)
  { return("<font class=gray>[<font class=red>Welcome</font>]</font>&nbsp;<a href='"+web_url+"'"+tb+">"+web_name+"»¶Ó­ÄúµÄ¹âÁÙ£¡</a>"); }
  var na=rnd2(t1+ads_txt_num);
  var n_dim=ads_txt_dim[na].split("|");
  return("<font class=gray>[<font class=red>"+n_dim[0]+"</font>]</font>&nbsp;<a href='"+n_dim[3]+"'"+tb+" "+n_dim[2]+">"+n_dim[1]+"</a>");
}

function rnd2(nvar)
{
  var dd=new Date();
  var ms=dd.getMilliseconds();
  if (ms<1) ms=1;
  for(i=1;i<3;i++)
  {
    if (ms<=ads_txt_num) break;
    ms=Math.floor(ms/2);
    i-=1;
  }
  return(ms);
}

//function rnd_num()
//{
//  rnd_num.today=new Date();
//  rnd_num.seed=rnd.today.getTime();
//  rnd.seed = (rnd.seed*9301+49297) % 233280;
//  return rnd.seed/(233280.0);
//}
//function rand(number) { return Math.ceil(rnd_num()*number); }
