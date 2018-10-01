
function format_pagecute(p_viewpage,p_thepages,p_pageurl,p_pp)
{
  var fc=" class=red";
  if (p_thepages<1) { return "<font"+fc+">[1]</font>"; }
  var temp1="";
  var pn,ppp,ppt,pl,pr,ppi;
  ppt=p_pp/2;
  ppp=Math.round(ppt);
  if (ppp<ppt) ppp+=1;
  pl=p_viewpage-ppp;
  pr=pl+p_pp-1;
  if (pl<1)
  {
    pr=pr-pl+1;
    pl=1;
    if (pr>p_thepages) pr=p_thepages;
  }
  if (pr>p_thepages)
  {
    pl=pl+p_thepages-pr;
    pr=p_thepages;
    if (pl<1) pl=1;
  }
  if (pl>1)
  {
    temp1+=" <a href='"+p_pageurl+"' alt='第一页'>[|<]</a> <a href='"+p_pageurl+"page="+(pl-1)+"' alt='上一页'>[<]</a> ";
  }
  for (ppi=pl;ppi<=pr;ppi++)
  {
    if (p_viewpage==ppi)
    {
      temp1+=" <font"+fc+">["+ppi+"]</font> ";
    }
    else
    {
      temp1+=" <a href='"+p_pageurl+"page="+ppi+"' alt='第 "+ppi+" 页'>["+ppi+"]</a> ";
    }
  }
  if (pr<p_thepages)
  {
    temp1+=" <a href='"+p_pageurl+"page="+ppi+"' alt='后一页'>[>]</a> <a href='"+p_pageurl+"page="+p_thepages+"' alt='最后一页'>[>|]</a> ";
  }
  return temp1;
}
