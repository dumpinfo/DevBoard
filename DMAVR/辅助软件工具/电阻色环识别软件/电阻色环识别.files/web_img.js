function img_user()
{
  var a="��վ�û�ͼ����";
  var udim,ui,udim2;
  udim=web_user_power.split("|");
  for (ui=0;ui<udim.length;ui++)
  {
    udim2=udim[ui].split(":");
    a+="&nbsp;<img border=0 src='"+web_dir_skin+"small/icon_"+udim2[0]+".gif' align=absmiddle>&nbsp;"+udim2[1];
  }
  a+="&nbsp;&nbsp;<img border=0 src='"+web_dir_skin+"small/icon_other.gif' align=absmiddle>&nbsp;�ο�";
  return a;
}

function img_forum()
{
  var a="";
  var fdim,fi;
  fdim=web_forum_type.split("|");
  for (fi=0;fi<fdim.length;fi++)
  {
    a+="&nbsp;<img src='"+web_dir_skin+"forum/label_"+(fi+1)+".gif' title='������' border=0 align=absmiddle>&nbsp;";
    a+="&nbsp;<img src='"+web_dir_skin+"forum/label_"+(fi+1)+"n.gif' title='������' border=0 align=absmiddle>&nbsp;"+fdim[fi]+"&nbsp;";
  }
  return a;
}

function img_topic()
{
  var a="<img src='"+web_dir_skin+"forum/isok.gif' border=0 align=absmiddle>&nbsp;&nbsp;���ŵ�����&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/ishot.gif' border=0 align=absmiddle>&nbsp;&nbsp;�ظ�����10��&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/islock.gif' border=0 align=absmiddle>&nbsp;&nbsp;����������&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/istop.gif' border=0 align=absmiddle>&nbsp;<img src='"+web_dir_skin+"forum/istops.gif' border=0 align=absmiddle>&nbsp;&nbsp;�̶����̶ܹ�������&nbsp;";
  a+="<img src='"+web_dir_skin+"forum/isvote.gif' border=0 align=absmiddle>&nbsp;&nbsp;ͶƱ������";
  a+="<img src='"+web_dir_skin+"forum/isgood.gif' border=0 align=absmiddle>&nbsp;&nbsp;��������";
  return a;
}