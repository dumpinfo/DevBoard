
function forum_birthday()
{
  document.write("<table cellspacing=1 cellpadding=1 class=table>");
  document.write("<tr><td class=td>&nbsp;"+img_skin(web_img_m)+"&nbsp;��������յ��û����� <font class=red>"+birthday_num+"</font> �ˣ�</td></tr>");
  document.write("<tr><td class=bg_td align=center>");
  document.write("  <table border=0 width='98%' cellspacing=0 cellpadding=2>");
  document.write("  <tr><td width='20%' height=5></td><td width='20%'></td><td width='20%'></td><td width='20%'></td><td width='20%'></td></tr>");
  if (birthday_body=="")
  { document.write("<tr><td colspan=5 class=gray>&nbsp;&nbsp;&nbsp;����û�й����յ��û�</td></tr>"); }
  else
  { document.write(birthday_body); }
  document.write("  <tr><td height=5></td></tr>");
  document.write("  </table>");
  document.write("</td></tr>");
  document.write("</table>" + ukong);
}

function forum_user_stat()
{
  document.write("<table cellspacing=1 cellpadding=1 class=table>");
  document.write("<tr><td class=td colspan=2>&nbsp;"+img_skin(web_img_m)+"&nbsp;��̳���� �û�״̬</td></tr>");
  document.write("<tr><td class=bg_td>");
  document.write("  <table border=0 width='100%'>");
  document.write("  <tr>");
  document.write("  <td align=center width=50><img src='"+web_dir_skin+"forum/forum_stat.gif' border=0></td>");
  document.write("  <td height="+m_hei+" width=*>�������� <font class=red>"+web_num_topic+"</font> ������������ <font class=red>"+web_num_data+"</font> ������������ <font class=red>"+web_new_num+"</font> ������վע��<font class=red>"+web_num_reg+"</font> �ˣ��½�������"+format_user_name(web_new_username,0,'')+"</td>");
  document.write("  </tr>");
  document.write("  <tr>");
  document.write("  <td align=center><img src='"+web_dir_skin+"forum/forum_cast.gif' border=0></td>");
  document.write("  <td height="+m_hei+">"+cast_tit+"��"+cast_text+"</td></tr>");
  document.write("  <tr>");
  document.write("  <td align=center><img src='"+web_dir_skin+"forum/forum_user.gif' border=0></td>");
  document.write("  <td height="+m_hei+">������ʵ�ɣ��ǣ�"+user_ip+"��"+user_sys_type(user_sys)+"</td>");
  document.write("  </tr>");
  document.write("  </table>");
  document.write("</td></tr>");
  document.write("<tr><td class=bg_tds align=center height=30>");
  document.write("    <table border=0 cellspacing=0 cellpadding=2>");
  document.write("    <tr>");
  document.write("    <td><a href='forum_action.asp?action=new'>��̳����</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_action.asp?action=hot'>��̳����</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_action.asp?action=good'>��̳����</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_action.asp?action=top'>��̳�ö�</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_search.asp'>��̳����</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='help.asp?action=forum'>��̳����</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_action.asp?action=my'>�ҷ���������</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='forum_action.asp?action=join'>�Ҳ��������</a></td>");
  document.write("    <td class=gray>��</td>");
  document.write("    <td><a href='user_action.asp?action=list'>�û��б�</a></td>");
  document.write("    </tr>");
  document.write("    </table>");
  document.write("</td></tr>");
  document.write("</table>" + ukong);
}

function forum_load_online(fname)
{
  var targetimg =eval("document.all.forum_online_img");
  var targetDivtr =eval("document.all.forum_online_tr");
  var targetDiv =eval("document.all.forum_online");
  //if (targetimg.src.indexOf("nofollow")!=-1){return false;}
  if (targetDivtr.style.display!='block')
  {
    document.all.forum_online_var.innerHTML="�ر������б�";
    targetDivtr.style.display="block";
    if (targetimg.loaded=="no")
    {
      targetimg.loaded="";
      document.frames["hiddenframe"].location.replace("forum_loadonline.asp?fname="+fname);
    }
  }
  else
  {
    document.all.forum_online_var.innerHTML="�������б�";
    targetDivtr.style.display="none";
  }
}

function forum_down()
{
  document.write("<table cellspacing=1 cellpadding=4 class=table>");
  document.write("<tr><td class=td0>"+img_skin(web_img_m)+"&nbsp;��̳ͼ��</td></tr>");
  document.write("<tr><td class=bg_td>"+img_user()+"</td></tr>");
  document.write("<tr><td class=bg_td align=center>");
  document.write("  <table border=0 cellspacing=0 cellpadding=0 width='100%'>");
  document.write("  <tr><td height=1></td></tr>");
  document.write("  <tr><td height=20>");
  document.write("    <table border=0 cellspacing=0 cellpadding=0>");
  document.write("    <tr>");
  document.write("    <td>��վ��ǰ���� <font class=red>"+ web_online_num +"</font> �ˣ�����ע���û� <font class=red>"+counter_r+"</font> �ˣ��ο� <font class=red>"+(web_online_num-counter_r)+"</font> ��</td>");
  document.write("    <td width=30 align=center><img loaded=no id='forum_online_img' src='"+web_dir_skin+"small/new_f.gif' border=0></td>");
  document.write("    <td><span style=cursor:hand onclick=\"javascript:forum_load_online('');\" id=forum_online_var>�������б�</a></span></td>");
  document.write("    </tr>");
  document.write("    </table>");
  document.write("  </td></tr>");
  document.write("  <tr style=\"display:none\" id=forum_online_tr height=30><td id=forum_online width='100%'><div class=div_alt onclick=\"javascript:forum_load_online('')\">���ڶ�ȡ�����û����ݣ����Ժ��</div></td></tr>");
  document.write("  <tr><td height=1></td></tr>");
  document.write("  </table>");
  document.write("</td></tr>");
  document.write("</table>");
  if (isonline=="yes") forum_load_online('');
  document.write(ukong+forum_img_tim());
}
