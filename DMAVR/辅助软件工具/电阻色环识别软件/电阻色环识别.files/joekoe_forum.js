
function forum_super_view(vars,vt)
{
  var temp1="<img src='"+web_dir_skin+"forum/forum_power.gif' alt='��̳����' align=absmiddle border=0>";
  if (web_forum_power_type==1)
  {
    if (vars==null || vars=="")
    { temp1+="&nbsp;<font class=gray>��û��&nbsp;</font>"; }
    else
    {
      var ddim=vars.split("|");
      for(i=0;i<ddim.length;i++)
      { temp1+="&nbsp;<a href='user_view.asp?username="+url_encode(ddim[i])+"' alt='�鿴��������"+ddim[i]+" ����ϸ����' target=_blank>"+ddim[i]+"</a>"; }
    }
  }
  else
  {
    temp1+="&nbsp;<select name=forum_power_sel onchange=\"if(this.options[this.selectedIndex].value!=''){window.open('user_view.asp?username='+this.options[this.selectedIndex].value);}\"><option value='' class=gray>�������</option>";
    if (vars==null || vars=="")
    { temp1+="<option value='' class=gray>��û��</option>"; }
    else
    {
      var ddim=vars.split("|");
      for(i=0;i<ddim.length;i++)
      { temp1+="<option value='"+ddim[i]+"'>"+ddim[i]+"</option>"; }

    }
    temp1+="</select>";
  }
  return temp1;
}

function forum_img_tim()
{
  var temp1="";
  temp1+="<table border=0 width='98%'>";
  temp1+="<tr><td align=center>"+img_forum()+"</td></tr>";
  temp1+="<tr><td height=5></td></tr>";
  temp1+="<tr><td align=center>ʱ���ʽ��<font class=gray>��-��-�� ʱ:��:��</font>����ǰʱ�䣺"+now_time+"</a></td></tr>";
  temp1+="</table>";
  temp1+=ukong;
  return temp1;
}

function forum_img_topic()
{
  var temp1="";
  temp1+="<table border=0 width='98%'>";
  temp1+="<tr><td align=center>��̳����ͼ���� "+img_topic()+"</td></tr>";
  temp1+="</table>";
  temp1+=ukong;
  return temp1;
}

function forum_sea_go(st)
{
  var temp1="";
  temp1+="<table border=0 width='98%' cellspacing=0 cellpadding=0>";
  temp1+="<tr><td>";
  if (st=="s")
  {
    temp1+="  <table border=0>";
    temp1+="  <form action='forum_search.asp?' method=get onsubmit=\"javascript:frm_submitonce(this);\">";
    temp1+="  <input type=hidden name=sea_fid value='"+forumid+"'>";
    temp1+="  <input type=hidden name=action value='chk'>";
    temp1+="  <input type=hidden name=page value='1'>";
    temp1+="  <tr>";
    temp1+="  <td>��̳������</td>";
    temp1+="  <td><select name=sea_type size=1>";
    temp1+="<option value='topic'>������</option>";
    temp1+="<option value='username'>������</option>";
    temp1+="</select></td>";
    temp1+="  <td><input type=text name=keyword size=20 maxlength=20></td>";
    temp1+="  <td>&nbsp;<input type=submit value='�� ��'></td>";
    temp1+="  </tr>";
    temp1+="  </form>";
    temp1+="  </table>";
  }
  temp1+="</td>";
  temp1+="<td align=right>"+forum_go()+"</td>";
  temp1+="</tr>";
  temp1+="<table>";
  temp1+=ukong;
  return temp1;
}

function forum_go()
{
  var gi,gj,gnum,ocid=0;
  var gdim;
  var temp1="<select name=forum_sort_sel size=1 onchange=\"if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}\">";//location=
  temp1+="<option value=''>������ת��̳��...</option>";
  gnum=forum_list_sorts.length;
  for (gi=0;gi<gnum;gi++)
  {
    gdim=forum_list_sorts[gi].split("'");
    temp1+="<option value='forum_list.asp?forum_id="+gdim[0]+"'>";
    if (ocid==gdim[1])
    {
      for (gj=1;gj<gdim[2];gj++)
      { temp1+="��"; }
      temp1+="��";
    }
    else
    {
      temp1+="��";
      ocid=gdim[1];
    }
    temp1+=gdim[3]+"</option>";
  }
  temp1+="</select>";
  return temp1;
}