
function forum_view_top()
{
  var temp1="<table cellspacing=1 cellpadding=1 class=table>";
  temp1+="<tr>";
  temp1+="<td class=td width='80%'>&nbsp;���⣺"+fir_topic+"</td>";
  temp1+="<td class=td wdith='20%' align=right valign=bottom>";
  temp1+="  <table border=0 cellspacing=0 cellpadding=0>";
  temp1+="  <tr>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:open_win('forum_report.asp?forum_id="+forumid+"&view_id="+viewid+"','page_report',550,300,'no');;\"><img src='"+web_dir_skin+"forum/page_report.gif' alt='��������汾��' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='forum_print.asp?view_id="+viewid+"' target=_blank><img src='"+web_dir_skin+"forum/page_print.gif' alt='��ʾ�ʺϴ�ӡ��ҳ��' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:commend_friend2('"+tit+"','"+fir_topic+"','"+fv_url+"');\"><img src='"+web_dir_skin+"forum/page_commend.gif' alt='����ҳ�Ƽ����ҵĺ���' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:window.external.AddFavorite('"+web_url+"forum_view.asp?forum_id="+forumid+"&view_id="+viewid+"&','"+web_name+" - "+tit+" - "+fir_topic+"');\"><img src='"+web_dir_skin+"forum/page_fav.gif' alt='����ҳ�����ղؼ�' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:document.location.reload();\"><img src='"+web_dir_skin+"forum/page_refresh.gif' alt='ˢ�±�ҳ' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td>";
  temp1+="</tr>";
  temp1+="</table>";
  document.write(temp1);
}

function forum_view_body(v_i,v_rnum,v_id,v_topic,v_icon,v_word,v_tim,v_ip,v_sys,u_username,u_nname,u_sex,u_whe,u_qq,u_email,u_url,u_face,u_face_w,u_face_h,u_tim,u_remark,u_emoney,u_integral,u_power,u_last_time,u_bbs_counter)
{
  var bg_var="bg_td";
  var a,b;
  a=Math.round(v_i/2);
  if ((a*2)==v_i) bg_var="bg_tds"
  var n_user=code_html(u_username,1,0);
  var temp1="<table cellspacing=1 cellpadding=1 class=table><tr class="+bg_var+">";
  temp1+="<td width='20%' valign=top>";
  temp1+="  <table border=0 width='98%'>";
  temp1+="  <tr><td height=30><table border=0 class=tf width='100%'><tr align=center><td class=bw><font class=blue><b>"+n_user+"</b></font></td><td width=22>"+user_view_sex(u_sex,u_last_time)+"</td></tr></table></td></tr>";
  temp1+="  <tr><td height=80 align=center>"+format_user_face(u_face,u_face_w,u_face_h)+"</td></tr>";
  temp1+="  <tr><td>&nbsp;&nbsp;"+forum_user_power_grade(u_bbs_counter,u_power);
  if (u_nname!="" && u_nname!=null) temp1+="<br>&nbsp;&nbsp;ͷ�Σ�"+code_html(u_nname,1,0);
  temp1+="<br>&nbsp;&nbsp;���ӣ�"+u_bbs_counter+"<br>&nbsp;&nbsp;���֣�"+u_integral+"<br>&nbsp;&nbsp;"+m_unit+"��"+u_emoney
  if (u_whe!="" && u_whe!=null) temp1+="<br>&nbsp;&nbsp;���ԣ�"+code_html(u_whe,1,0);
  temp1+="<br>&nbsp;&nbsp;ע�᣺"+u_tim.substring(0,10)+"</td></tr>";
  temp1+="  <tr><td></td></tr>";
  temp1+="  <tr><td></td></tr>";
  temp1+="  </table>";
  temp1+="</td>";
  temp1+="<td width='80%'>";
  temp1+="  <table border=0 width='99%' cellspacing=2 cellpadding=0 height='100%'>";
  temp1+="  <tr height=25>";
  temp1+="  <td width='85%'>";
  temp1+="<a target=_blank href='user_view.asp?username="+url_encode(u_username)+"'><img src='"+web_dir_skin+"forum/forum_profile.gif' alt='�鿴 "+n_user+" ����ϸ��Ϣ' border=0></a>&nbsp;";
  temp1+="<a target=_blank href='user_friend.asp?action=add&add_username="+n_user+"'><img src='"+web_dir_skin+"forum/forum_friend.gif' alt='�� "+n_user+" ��Ϊ�ҵĺ���' border=0></a>&nbsp;";
  temp1+="<a target=_blank href='user_mail.asp?action=msg_write&accept="+n_user+"'><img src='"+web_dir_skin+"forum/forum_message.gif' alt='�� "+n_user+" ������' border=0></a>&nbsp;";
  if (u_email!="" && u_email!==null) temp1+="<a target=_blank href='mailto:"+u_email+"'><img src='"+web_dir_skin+"forum/forum_email.gif' alt='�� "+n_user+" ���ʼ�' border=0></a>&nbsp;";
  if (u_url!="" && u_url!==null) temp1+="<a href='"+u_url+"' target=_blank><img src='"+web_dir_skin+"forum/forum_url.gif' alt='���� "+n_user+" ����ҳ' border=0></a>&nbsp;";
  if (u_qq!="" && u_qq!==null) temp1+="<a href='http://search.tencent.com/cgi-bin/friend/user_show_info?ln="+u_qq+"' target=_blank><img src='"+web_dir_skin+"forum/forum_qq.gif' alt='"+n_user+" ��QQ�ǣ�"+u_qq+"' border=0></a>&nbsp;";
  temp1+="<a href='forum_edit.asp?forum_id="+forumid+"&view_id="+viewid+"&edit_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_edit.gif' alt='�༭�������' border=0></a>&nbsp;";
  temp1+="<a href='forum_reply.asp?forum_id="+forumid+"&quote=yes&view_id="+viewid+"&reply_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_quote.gif' alt='���ò��ظ��������' border=0></a>&nbsp;";
  temp1+="<a href='forum_reply.asp?forum_id="+forumid+"&view_id="+viewid+"&reply_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_reply.gif' alt='�ظ��������' border=0></a>";
  temp1+="  </td>";
  temp1+="  <td width='15%' align=center>�� <font class=red2><b>"+v_i+"</b></font> ¥</td>";
  temp1+="  </tr>";
  temp1+="  <tr><td colspan=2 height=1 class=bg_td></td></tr>";
  temp1+="  <tr><td colspan=2 valign=top align=center>";
  temp1+="    <table border=0 width='98%' class=tf>";
  temp1+="    <tr><td height=30><img src='"+web_dir+"images/icon/"+v_icon+".gif' align=absMiddle border=0>&nbsp;<font class=red_3><b>"+code_html(v_topic,1,0)+"</b></font></td></tr>";
  temp1+="    <tr><td class=bw><font class=htd>"+v_word+"</font></td></tr>";
  temp1+="    </table>";
  temp1+="  </td></tr>";
  temp1+="  <tr><td colspan=2 height=20 align=right><img border=0 src='"+web_dir_skin+"forum/signature.gif' align=absmiddle>&nbsp;</td></tr>";
  temp1+="  <tr><td colspan=2 height=30 align=center valign=top><table border=0 width='96%' class=tf><tr><td class=bw><font class=htd>"+u_remark+"</font></td></tr></table></td></tr>";
  temp1+="  </table>";
  temp1+="</td>";
  temp1+="</tr>";
  temp1+="<tr class="+bg_var+">";
  temp1+="<td height=25>&nbsp;&nbsp;<img border=0 src='"+web_dir_skin+"forum/forum_tim.gif' align=absmiddle>&nbsp;<font class=gray>"+v_tim.substring(0,16)+"</font></td>";
  temp1+="<td>";
  temp1+="  <table border=0 width='100%'>";
  temp1+="  <tr>";
  temp1+="  <td>"+ads_txt_type(v_rnum,1)+"</td>";
  temp1+="  <td align=right>&nbsp;<a href='ip_address.asp?ip="+v_ip+"'><img src='"+web_dir_skin+"small/ip.gif' align=absMiddle alt='"+n_user+" ��IP�ǣ�"+v_ip+"' border=0></a>&nbsp;&nbsp;<img src='"+web_dir_skin+"small/sys.gif' align=absMiddle alt='"+user_sys_type(v_sys)+"' border=0>&nbsp;";
  if (v_i>1 && (manage=="True" || manage=="true")) { temp1+="&nbsp;<a href='forum_isaction.asp?forum_id="+forumid+"&sel_id="+viewid+"&re_id="+v_id+"&action=del'><img src='"+web_dir_skin+"small/del2.gif' alt='ɾ���˻���' align=absMiddle border=0></a>&nbsp;"; }
  temp1+="</td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td>";
  temp1+="</tr>";
  temp1+="</table>";
  document.write(temp1);
  web_branch();
}

function forum_view_end()
{
  var temp1="";
  temp1+="<table cellspacing=1 cellpadding=1 width='98%'>";
  if (manage=="True" || manage=="true")
  {
    temp1+="<tr><td height=30 align=center>";
    temp1+="  <table border=0 cellspacing=0 cellpadding=2>";
    temp1+="  <form name=del_frm action='forum_isaction.asp' method=get onsubmit=\"javascript:frm_submitonce(this);\">";
    temp1+="  <input type=hidden name=forum_id value='"+forumid+"'>";
    temp1+="  <input type=hidden name=sel_id value='"+viewid+"'>";
    temp1+="  <tr>";
    temp1+="  <td>״̬��</td>";
    temp1+="  <td>"+base_forum_isview(fir_isvote,fir_islock,re_counter,fir_istop,fir_isgood)+"</td>";
    temp1+="  <td>����</td>";
    temp1+="  <td><input type=radio name=action value='revert' checked>��ԭ</td>";
    temp1+="  <td><input type=radio name=action value='restore'>�޸�</td>";
    temp1+="  <td><input type=radio name=action value='rap'>����</td>";
    temp1+="  <td><input type=radio name=action value='move'>ת��</td>";
    temp1+="  <td><input type=radio name=action value='istop'>�̶�</td>";
    temp1+="  <td><input type=radio name=action value='istops'>�̶ܹ�</td>";
    temp1+="  <td><input type=radio name=action value='isgood'>����</td>";
    temp1+="  <td><input type=radio name=action value='islock'>����</td>";
    temp1+="  <td><input type=radio name=action value='delete'>ɾ��</td>";
    //temp1+="  <td><input type=radio name=action value='del_re'>ɾ������</td>";
    temp1+="  <td width=5></td>";
    temp1+="  <td><input type=submit value='ִ�в���'></td>";
    temp1+="  </tr>";
    temp1+="  </form>";
    temp1+="  </table>";
    temp1+="</td></tr>";
  }
  temp1+="<tr><td height=30>";
  temp1+="  <table border=0 cellspacing=0 cellpadding=2 width='100%'>";
  temp1+="  <tr>";
  temp1+="  <td>������ظ�<font class=red>"+re_counter+"</font>�������<font class=red>"+counter+"</font>�˴Σ���ҳ��"+format_pagecute(viewpage,thepages,'?forum_id='+forumid+'&view_id='+viewid+'&',5)+"</td>";
  temp1+="  <td align=right>"+forum_go()+"</td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="";
  temp1+="</table>";
  document.write(temp1);
  web_branch();
}

function forum_view_reply(vtext)
{
  var temp1="<table cellspacing=1 cellpadding=4 class=table>";
  temp1+="<tr><td class=td0 colspan=2>&nbsp;�� ���ٻظ���"+fir_topic+"</td></tr>";
  if (login_mode=="")
  { temp1+="<tr><td class=bg_td colspan=2>&nbsp;&nbsp;"+web_nologin+"</td></tr>"; }
  else if(fir_islock==1)
  { temp1+="<tr><td class=bg_td colspan=2>&nbsp;&nbsp;�����ѱ������������ٶ�����лظ���</td></tr>"; }
  else
  {
    temp1+="<form name=write_frm action='forum_reply.asp?forum_id="+forumid+"&view_id="+viewid+"&reply_id="+replyid+"' method=post onsubmit=\"javascript:frm_submitonce(this);\">";
    temp1+="<input type=hidden name=chk value='yes'>";
    temp1+="<input type=hidden name=upid value=''>";
    temp1+=vtext;
    temp1+="<tr class=bg_td>";
    temp1+="<td width='20%'>��ǰ���飺</td>";
    temp1+="<td width='80%'>"+jk_icon(0)+"</td>";
    temp1+="</td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_tds>";
    temp1+="<td class=htd>�������ݣ�<br>"+web_frm_word+"<br>����<="+max_word+"KB</td>";
    temp1+="<td><textarea name=jk_word rows=7 cols=93 alt='�� Ctrl+Enter ��ֱ�ӷ���' onkeydown=\"javascript:frm_quicksubmit();\"></textarea></td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_td>";
    temp1+="<td>E M ��ͼ��</td>";
    temp1+="<td>&nbsp;"+jk_em('write_frm','jk_word')+"</td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_tds>";
    temp1+="<td>���ٻظ���</td>";
    temp1+="<td><input type=submit value='���ٷ����ҵĻ���'>��&nbsp;<input type=button onclick=\"javascript:preview_type('write_frm','jk_word');\" value='Ԥ���ظ�'>��&nbsp;<input type=reset value='�����д'>��&nbsp;���� Ctrl + Enter �ɿ��ٻظ���</td>";
    temp1+="</tr>";
    temp1+="</form>";
  }
  temp1+="</table>";
  document.write(temp1+ukong);
}
