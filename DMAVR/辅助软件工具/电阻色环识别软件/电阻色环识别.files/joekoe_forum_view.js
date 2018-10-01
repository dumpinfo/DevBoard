
function forum_view_top()
{
  var temp1="<table cellspacing=1 cellpadding=1 class=table>";
  temp1+="<tr>";
  temp1+="<td class=td width='80%'>&nbsp;主题："+fir_topic+"</td>";
  temp1+="<td class=td wdith='20%' align=right valign=bottom>";
  temp1+="  <table border=0 cellspacing=0 cellpadding=0>";
  temp1+="  <tr>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:open_win('forum_report.asp?forum_id="+forumid+"&view_id="+viewid+"','page_report',550,300,'no');;\"><img src='"+web_dir_skin+"forum/page_report.gif' alt='向版主报告本贴' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='forum_print.asp?view_id="+viewid+"' target=_blank><img src='"+web_dir_skin+"forum/page_print.gif' alt='显示适合打印的页面' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:commend_friend2('"+tit+"','"+fir_topic+"','"+fv_url+"');\"><img src='"+web_dir_skin+"forum/page_commend.gif' alt='将本页推荐给我的好友' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:window.external.AddFavorite('"+web_url+"forum_view.asp?forum_id="+forumid+"&view_id="+viewid+"&','"+web_name+" - "+tit+" - "+fir_topic+"');\"><img src='"+web_dir_skin+"forum/page_fav.gif' alt='将本页加入收藏夹' border=0></a>&nbsp;&nbsp;</td>";
  temp1+="  <td><a href='javascript:;' onclick=\"javascript:document.location.reload();\"><img src='"+web_dir_skin+"forum/page_refresh.gif' alt='刷新本页' border=0></a>&nbsp;&nbsp;</td>";
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
  if (u_nname!="" && u_nname!=null) temp1+="<br>&nbsp;&nbsp;头衔："+code_html(u_nname,1,0);
  temp1+="<br>&nbsp;&nbsp;贴子："+u_bbs_counter+"<br>&nbsp;&nbsp;积分："+u_integral+"<br>&nbsp;&nbsp;"+m_unit+"："+u_emoney
  if (u_whe!="" && u_whe!=null) temp1+="<br>&nbsp;&nbsp;来自："+code_html(u_whe,1,0);
  temp1+="<br>&nbsp;&nbsp;注册："+u_tim.substring(0,10)+"</td></tr>";
  temp1+="  <tr><td></td></tr>";
  temp1+="  <tr><td></td></tr>";
  temp1+="  </table>";
  temp1+="</td>";
  temp1+="<td width='80%'>";
  temp1+="  <table border=0 width='99%' cellspacing=2 cellpadding=0 height='100%'>";
  temp1+="  <tr height=25>";
  temp1+="  <td width='85%'>";
  temp1+="<a target=_blank href='user_view.asp?username="+url_encode(u_username)+"'><img src='"+web_dir_skin+"forum/forum_profile.gif' alt='查看 "+n_user+" 的详细信息' border=0></a>&nbsp;";
  temp1+="<a target=_blank href='user_friend.asp?action=add&add_username="+n_user+"'><img src='"+web_dir_skin+"forum/forum_friend.gif' alt='将 "+n_user+" 加为我的好友' border=0></a>&nbsp;";
  temp1+="<a target=_blank href='user_mail.asp?action=msg_write&accept="+n_user+"'><img src='"+web_dir_skin+"forum/forum_message.gif' alt='给 "+n_user+" 发短信' border=0></a>&nbsp;";
  if (u_email!="" && u_email!==null) temp1+="<a target=_blank href='mailto:"+u_email+"'><img src='"+web_dir_skin+"forum/forum_email.gif' alt='给 "+n_user+" 发邮件' border=0></a>&nbsp;";
  if (u_url!="" && u_url!==null) temp1+="<a href='"+u_url+"' target=_blank><img src='"+web_dir_skin+"forum/forum_url.gif' alt='访问 "+n_user+" 的主页' border=0></a>&nbsp;";
  if (u_qq!="" && u_qq!==null) temp1+="<a href='http://search.tencent.com/cgi-bin/friend/user_show_info?ln="+u_qq+"' target=_blank><img src='"+web_dir_skin+"forum/forum_qq.gif' alt='"+n_user+" 的QQ是："+u_qq+"' border=0></a>&nbsp;";
  temp1+="<a href='forum_edit.asp?forum_id="+forumid+"&view_id="+viewid+"&edit_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_edit.gif' alt='编辑这个贴子' border=0></a>&nbsp;";
  temp1+="<a href='forum_reply.asp?forum_id="+forumid+"&quote=yes&view_id="+viewid+"&reply_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_quote.gif' alt='引用并回复这个贴子' border=0></a>&nbsp;";
  temp1+="<a href='forum_reply.asp?forum_id="+forumid+"&view_id="+viewid+"&reply_id="+v_id+"'><img src='"+web_dir_skin+"forum/forum_reply.gif' alt='回复这个贴子' border=0></a>";
  temp1+="  </td>";
  temp1+="  <td width='15%' align=center>第 <font class=red2><b>"+v_i+"</b></font> 楼</td>";
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
  temp1+="  <td align=right>&nbsp;<a href='ip_address.asp?ip="+v_ip+"'><img src='"+web_dir_skin+"small/ip.gif' align=absMiddle alt='"+n_user+" 的IP是："+v_ip+"' border=0></a>&nbsp;&nbsp;<img src='"+web_dir_skin+"small/sys.gif' align=absMiddle alt='"+user_sys_type(v_sys)+"' border=0>&nbsp;";
  if (v_i>1 && (manage=="True" || manage=="true")) { temp1+="&nbsp;<a href='forum_isaction.asp?forum_id="+forumid+"&sel_id="+viewid+"&re_id="+v_id+"&action=del'><img src='"+web_dir_skin+"small/del2.gif' alt='删除此回贴' align=absMiddle border=0></a>&nbsp;"; }
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
    temp1+="  <td>状态：</td>";
    temp1+="  <td>"+base_forum_isview(fir_isvote,fir_islock,re_counter,fir_istop,fir_isgood)+"</td>";
    temp1+="  <td>管理：</td>";
    temp1+="  <td><input type=radio name=action value='revert' checked>还原</td>";
    temp1+="  <td><input type=radio name=action value='restore'>修复</td>";
    temp1+="  <td><input type=radio name=action value='rap'>奖惩</td>";
    temp1+="  <td><input type=radio name=action value='move'>转移</td>";
    temp1+="  <td><input type=radio name=action value='istop'>固顶</td>";
    temp1+="  <td><input type=radio name=action value='istops'>总固顶</td>";
    temp1+="  <td><input type=radio name=action value='isgood'>精华</td>";
    temp1+="  <td><input type=radio name=action value='islock'>锁定</td>";
    temp1+="  <td><input type=radio name=action value='delete'>删除</td>";
    //temp1+="  <td><input type=radio name=action value='del_re'>删除回贴</td>";
    temp1+="  <td width=5></td>";
    temp1+="  <td><input type=submit value='执行操作'></td>";
    temp1+="  </tr>";
    temp1+="  </form>";
    temp1+="  </table>";
    temp1+="</td></tr>";
  }
  temp1+="<tr><td height=30>";
  temp1+="  <table border=0 cellspacing=0 cellpadding=2 width='100%'>";
  temp1+="  <tr>";
  temp1+="  <td>本主题回复<font class=red>"+re_counter+"</font>贴，浏览<font class=red>"+counter+"</font>人次，分页："+format_pagecute(viewpage,thepages,'?forum_id='+forumid+'&view_id='+viewid+'&',5)+"</td>";
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
  temp1+="<tr><td class=td0 colspan=2>&nbsp;→ 快速回复："+fir_topic+"</td></tr>";
  if (login_mode=="")
  { temp1+="<tr><td class=bg_td colspan=2>&nbsp;&nbsp;"+web_nologin+"</td></tr>"; }
  else if(fir_islock==1)
  { temp1+="<tr><td class=bg_td colspan=2>&nbsp;&nbsp;主题已被锁定，不能再对其进行回复。</td></tr>"; }
  else
  {
    temp1+="<form name=write_frm action='forum_reply.asp?forum_id="+forumid+"&view_id="+viewid+"&reply_id="+replyid+"' method=post onsubmit=\"javascript:frm_submitonce(this);\">";
    temp1+="<input type=hidden name=chk value='yes'>";
    temp1+="<input type=hidden name=upid value=''>";
    temp1+=vtext;
    temp1+="<tr class=bg_td>";
    temp1+="<td width='20%'>当前心情：</td>";
    temp1+="<td width='80%'>"+jk_icon(0)+"</td>";
    temp1+="</td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_tds>";
    temp1+="<td class=htd>贴子内容：<br>"+web_frm_word+"<br>长度<="+max_word+"KB</td>";
    temp1+="<td><textarea name=jk_word rows=7 cols=93 alt='按 Ctrl+Enter 可直接发送' onkeydown=\"javascript:frm_quicksubmit();\"></textarea></td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_td>";
    temp1+="<td>E M 贴图：</td>";
    temp1+="<td>&nbsp;"+jk_em('write_frm','jk_word')+"</td>";
    temp1+="</tr>";
    temp1+="<tr class=bg_tds>";
    temp1+="<td>快速回复：</td>";
    temp1+="<td><input type=submit value='快速发表我的回贴'>　&nbsp;<input type=button onclick=\"javascript:preview_type('write_frm','jk_word');\" value='预览回复'>　&nbsp;<input type=reset value='清除重写'>　&nbsp;（按 Ctrl + Enter 可快速回复）</td>";
    temp1+="</tr>";
    temp1+="</form>";
  }
  temp1+="</table>";
  document.write(temp1+ukong);
}
