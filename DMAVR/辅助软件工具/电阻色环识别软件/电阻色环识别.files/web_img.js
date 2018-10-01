function img_user()
{
  var a="网站用户图例：";
  var udim,ui,udim2;
  udim=web_user_power.split("|");
  for (ui=0;ui<udim.length;ui++)
  {
    udim2=udim[ui].split(":");
    a+="&nbsp;<img border=0 src='"+web_dir_skin+"small/icon_"+udim2[0]+".gif' align=absmiddle>&nbsp;"+udim2[1];
  }
  a+="&nbsp;&nbsp;<img border=0 src='"+web_dir_skin+"small/icon_other.gif' align=absmiddle>&nbsp;游客";
  return a;
}

function img_forum()
{
  var a="";
  var fdim,fi;
  fdim=web_forum_type.split("|");
  for (fi=0;fi<fdim.length;fi++)
  {
    a+="&nbsp;<img src='"+web_dir_skin+"forum/label_"+(fi+1)+".gif' title='无新贴' border=0 align=absmiddle>&nbsp;";
    a+="&nbsp;<img src='"+web_dir_skin+"forum/label_"+(fi+1)+"n.gif' title='有新贴' border=0 align=absmiddle>&nbsp;"+fdim[fi]+"&nbsp;";
  }
  return a;
}

function img_topic()
{
  var a="<img src='"+web_dir_skin+"forum/isok.gif' border=0 align=absmiddle>&nbsp;&nbsp;开放的主题&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/ishot.gif' border=0 align=absmiddle>&nbsp;&nbsp;回复超过10贴&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/islock.gif' border=0 align=absmiddle>&nbsp;&nbsp;锁定的主题&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/istop.gif' border=0 align=absmiddle>&nbsp;<img src='"+web_dir_skin+"forum/istops.gif' border=0 align=absmiddle>&nbsp;&nbsp;固顶、总固顶的主题&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/isvote.gif' border=0 align=absmiddle>&nbsp;&nbsp;投票的主题";
  a+="<img src='"+web_dir_skin+"forum/isgood.gif' border=0 align=absmiddle>&nbsp;&nbsp;精华主题";
  return a;
}