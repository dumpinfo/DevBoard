
function forum_main_head(vars,cid,ct)
{
  var hurl="forum_list.asp?forum_id=";
  if (ct=="f") { hurl="forum_list.asp?forum_id="; }
  document.write("<table cellspacing=1 cellpadding=1 class=table>");
  document.write("<tr><td class=td colspan=4>&nbsp;"+img_skin(web_img_m)+"&nbsp;<a href='"+hurl+cid+"' class=h_td>" + vars + "</a></td></tr>");
}

function forum_main_body(f_id,f_n,f_w,f_name,f_type,f_new_info,f_new_num,f_topic_num,f_data_num,f_power,f_remark,f_pic,f_new_view)
{
  var temp1;
  document.write("<tr class=bg_td>");
  document.write("<td width='6%' align=center><img src='"+web_dir_skin+"forum/label_"+f_type);
  if (f_new_num>0) { document.write("n"); }
  document.write(".gif' border=0></td>");
  document.write("<td width='94%'>");
  document.write("  <table border=0 width='100%' cellpadding=0 cellspacing=0>");
  document.write("  <tr height=22 class=bg_tds><td width='72%'>");
  document.write("    <table border=0 width='100%' cellpadding=0 cellspacing=0>");
  document.write("    <tr align=center>");
  document.write("    <td width='25%' align=left>&nbsp;<b><a href='forum_list.asp?forum_id="+f_id+"'>"+f_name+" </a></b></td>");
  document.write("    <td width='12%' class=gray>");
  var ddim=web_forum_type.split("|");
  for(i=0;i<ddim.length;i++) { if (f_type==i+1) { document.write(ddim[i]);break; } }
  document.write("</td>");
  document.write("    <td width='4%'></td>");
  document.write("    <td align=left width='15%'><img src='"+web_dir_skin+"forum/forum_num_new.gif' alt='今日主题数' border=0>&nbsp;<font class=red>"+f_new_num+"</font></td>");
  document.write("    <td align=left width='15%'><img src='"+web_dir_skin+"forum/forum_num_topic.gif' alt='论坛主题数' border=0>&nbsp;"+f_topic_num+"</td>");
  document.write("    <td align=left width='15%'><img src='"+web_dir_skin+"forum/forum_num_data.gif' alt='论坛贴子数' border=0>&nbsp;"+f_data_num+"</td>");
  document.write("    <td width='10%' align=right>");
  if (f_n>0 && f_w==1) { document.write("<font class=gray alt='本论坛下面有 "+f_n+" 个分论坛'>[<font class=red>"+f_n+"</font>]</font>&nbsp;"); }
  document.write("<a href='forum_write.asp?forum_id="+f_id+"'><img src='"+web_dir_skin+"forum/mini_write.gif' align=absmiddle alt='发表主题' border=0></a>&nbsp;</td>");
  document.write("</td>");
  document.write("    </tr>");
  document.write("    </table>");
  document.write("  </td>");
  document.write("  <td width='28%'>"+forum_super_view(f_power,web_forum_power_type)+"</td>");
  document.write("  </tr>");
  document.write("  <tr class=bg_1>");
  document.write("  <td align=center>");
  document.write("    <table border=0 width='99%'>");
  document.write("    <tr>");
  document.write("    <td class=htd>"+code_html(f_remark,22,0)+"</td>");
  if (f_pic!=null && f_pic!="")
  {
    temp1=f_pic;
    if (temp1.indexOf("$")==0) { temp1=temp1.substr(1);temp1="images/forum_pic/"+temp1; }
    document.write("    <td align=right><img src='"+temp1+"' border=0></td>");
  }
  document.write("    </tr>");
  document.write("    </table>");
  document.write("  </td>");
  document.write("  <td><font class=htd>");
  if (f_w==1)
  {
    if (f_new_view=="True" || f_new_view=="true")
    {
      f_new_info=f_new_info.split("|");
      if (f_new_info.length==4)
      { document.write("<font class=htd>新贴：<a href='forum_view.asp?forum_id="+f_id+"&view_id="+f_new_info[2]+"' alt='"+code_html(f_new_info[3],1,0)+"'>"+code_html(f_new_info[3],1,12)+"</a><br>作者："+format_user_name(f_new_info[0],0,'')+"<br>时间："+f_new_info[1]+"</font>"); }
      else
      { document.write("<font class=gray>暂无</font>"); }
    }
    else
    { document.write("<p align=center class=gray>您没有浏览最后更新的权限</p>"); }
  }
  else
  { document.write("<p align=center><a href='forum_list.asp?forum_id="+f_id+"' class=gray>点击浏览分论坛（<font class=red>"+f_n+"</font>个）信息</a></p>"); }
  document.write("</td>");
  document.write("  </tr>");
  document.write("  </table>");
  document.write("</td></tr>");
}

function forum_main_end(vars)
{
  document.write("</table>"+ukong);
}