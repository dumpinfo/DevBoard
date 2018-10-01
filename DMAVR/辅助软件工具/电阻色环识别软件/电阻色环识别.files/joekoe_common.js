
var web_left_wid=185;
var web_center_height=300;
var lefter="<table border=0 width='"+web_wid+"' cellspacing=0 cellpadding=0><tr><td width=1 class=bg_frame></td><td width=* align=center class=bg>";
var righter="</td><td width=1 class=bg_frame></td></tr></table>";
var redx="&nbsp;<font class=red>*</font>&nbsp;"
var ukong="<table border=0><tr><td height=6></td></tr></table>";
var web_dir_skin=web_dir+"skin/"+web_skin+"/";
var web_img_m="m_"+m_channel;
var web_img_h="h_"+m_channel;
var go_back="<a href='javascript:history.back(1)'>返回上一页</a>";
var closer="<a href='javascript:self.close()'>『关闭窗口』</a>";
var img_emoney="<img border=0 src='"+web_dir_skin+"small/emoney.gif' alt='"+m_unit+"' align=absmiddle>";
var ie_true=nav_ver_true();

function web_ads(atype,avar)
{
  var temp1="";
  switch (atype)
  {
    case 1 :	//小广告(180*60)
      temp1="<img src='ads/logo_dns.gif' border=0 width=180 height=65>";
      break;
    case 2 :	//标准广告(468*60)
      temp1="<img src='ads/banner_dns.gif' border=0 width=468 height=60>";
      break;
    case 3 :	//大广告(页面宽度)
      temp1="<img src='ads/banner_dns.gif' border=0 width='100%' height=80>";
      break;
    default :
      temp1="";
  }
  document.write (temp1);
}

function web_head(var3,index_url)
{
  var img_h_head="h_head";
  document.write ("<body topmargin=0 leftmargin=0><a name='top'></a><center>");
  if (var3==4) return true ;
  document.write ( lefter );
  document.write ("<table border=0 cellspacing=0 cellpadding=0 width='100%'>");
  //document.write ("<tr><td height=1 colspan=2 class=bg_frame></td></tr>");
  document.write ("<tr align=center>");
  document.write ("<td width='24%'>");
  if (top_type=="swf")
  {
    document.write ("<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" "+top_wh+">");
    document.write ("<param name=movie value='"+top_pic+"'>");
    document.write ("<param name=quality value=high>");
    document.write ("<embed src='"+top_pic+"' quality=high pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" "+top_wh+"></embed></object>");
  }
  else
  { document.write ("<a href='"+top_url+"' target=_blank><img src='"+top_pic+"' border=0 "+top_wh+"></a>"); }
  document.write ("</td>");
  document.write ("<td width='76%'>");
  document.write ("  <table border=0 cellspacing=0 cellpadding=2 width='100%'>");
  document.write ("  <tr><td align=right>");
  document.write ("    <table border=0 cellpadding=0 cellspacing=0>");
  document.write ("    <tr>");
  document.write ("    <td>"+img_skin(img_h_head)+"<a class=top href='###' onclick=\"javascript:window.external.AddFavorite('"+web_url+"','"+web_name+"')\" style='target: ' _self?>加入收藏</a></td><td width=10></td>");
  if (login_mode=="" || login_mode==null)
  {
    document.write ("    <td>"+img_skin(img_h_head)+"<a href='register.asp'>免费注册</a></td><td width=10></td>");
    document.write ("    <td>"+img_skin(img_h_head)+"<a href='login.asp'>用户登陆</a></td><td width=10></td>");
  }
  else
  {
    document.write ("    <td>"+img_skin(img_h_head)+"<a href='user_main.asp'>用户中心</a></td><td width=10></td>");
    document.write ("    <td>"+img_skin(img_h_head)+"<a href='login.asp?action=logout' onclick=\"javascript:return click_return('退出本次登陆',1);\">退出登陆</a></td><td width=10></td>");
  }
  document.write ("    <td>"+img_skin(img_h_head)+"<a href='help.asp'>帮助中心</a></td><td width=10></td>");
  document.write ("    </tr>");
  document.write ("    </table>");
  document.write ("  </td></tr>");
  document.write ("  <tr><td align='right'>");
  document.write ("    <table border=0 cellpadding=0 cellspacing=0 width='100%' align='right'>");
  document.write ("    <tr align=center height=64>");
  document.write ("    <td width='20%' align='right'>");
  //document.write ("kong");
  document.write ("    </td>");
  document.write ("    <td width='80%' align='right'>");
  document.write ("      <table border=0 cellpadding=0 cellspacing=0>");
  document.write ("      <tr valign=top>");
  document.write ("      <td align='right'>");
  if (banner_type=="swf")
  {
    document.write ("<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" "+banner_wh+">");
    document.write ("<param name=movie value='"+banner_pic+"'>");
    document.write ("<param name=quality value=high>");
    document.write ("<embed src='"+banner_pic+"' quality=high pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" "+banner_wh+"></embed></object>");
  }
  else
  { document.write ("<a href='"+banner_url+"' target=_blank><img src='"+banner_pic+"' border=0 "+banner_wh+"></a>"); }
  document.write ("      </td>");
  document.write ("      <td align='right'>&nbsp;<a href='page_help.asp'><img src='images/ads_button.gif' border=0></a></td>");
  document.write ("      </tr>");
  document.write ("      </table>");
  document.write ("    </td>");
  document.write ("    </tr>");
  document.write ("    </table>");
  document.write ("  </td></tr>");
  document.write ("  </table>");
  document.write ("</td>");
  document.write ("</tr>");
  document.write ("<tr><td colspan=2 height=22 valign=bottom align=center background='"+web_dir_skin+"bg_menu.gif'>"+web_menu()+"</td></tr>");
  document.write ("</table>");
  document.write ("<table border=0 cellpadding=0 cellspacing=0 width='98%' align=center>");
  document.write ("<tr><td align=left height=30 width='80%'>");
  document.write (format_now_time()+"您现在位于：&nbsp;<a href='./'>首页</a>&nbsp;→&nbsp;");
  if (tit_fir=="")
  { document.write ( "<font title='"+code_html(tit,1,0)+"'>"+code_html(tit,1,30)+"</font>" ); }
  else
  { document.write ("<a href='"+index_url+".asp'>"+tit_fir+"</a>&nbsp;→&nbsp;<font title='"+code_html(tit,1,0)+"'>"+code_html(tit,1,12)+"</font>" ); }
  document.write ("</td><td width='20%' align=right><div id=div_msg>");
  if (login_message>0 && ie_true==1)
  { document.write ("<bgsound src='"+web_dir_skin+"mail/message.wav'><a href='user_mail.asp'><img src='"+web_dir_skin+"mail/new.gif' align=absmiddle border=0>&nbsp;我的短信箱（<font class=red>"+login_message+"&nbsp;新</font>）</a>"); }
  else
  { document.write ("<marquee scrolldelay=100 scrollamount=3 onMouseOut='if (document.all!=null){this.start()}' onMouseOver='if (document.all!=null){this.stop()}'>"+scroll_head+"</marquee>"); }
  document.write ("</div></td></tr></table>");
  document.write ( righter );
}

function web_left(wlt)
{
  var wa="t"+wlt;
  var wb;
  switch (wa)
  {
    case "t1" :
      wb="<table border=0 width='100%' cellspacing=0 cellpadding=0><tr valign=top align=center><td width="+web_left_wid+" height="+web_center_height+" class=bg_left>";
      break;
    case "t2" :
      wb="<table border=0 width='100%' cellspacing=0 cellpadding=0><tr><td align=center class=bg_1>";
      break;
    case "t3" :
      wb="<table border=0 width='100%' cellspacing=0 cellpadding=0><tr><td height="+web_center_height+" align=center class=bg_1>";
      break;
    default :
      wb="<table border=0 width='100%' cellspacing=0 cellpadding=0><tr valign=top align=center><td width="+web_left_wid+" class=bg_left>";
  }
  document.write(lefter+wb);
}

function web_end(end_type)
{
  var time_now2=new Date();
  var time_end=time_now2.getTime();
  //web_left(2);
  document.write ( lefter );
  document.write ("<table border=0 width='100%' cellspacing=0 cellpadding=0>");
  document.write ("<tr><td class=td style='font-weight: normal;' align=center>");
  document.write ("<a class=h_td href='help.asp'>关于我们</a>&nbsp;┋&nbsp;");
  document.write ("<a class=h_td href='gbook.asp'>网站留言</a>&nbsp;┋&nbsp;");
  //document.write ("<a class=h_td href='chat.asp'>聊 天 室</a>&nbsp;┋&nbsp;");
  document.write ("<a class=h_td href='links.asp'>友情链接</a>&nbsp;┋&nbsp;");
  document.write ("<a class=h_td href='online.asp'>与我在线</a>&nbsp;┋&nbsp;");
  document.write ("<a class=h_td href='admin.asp'>管理</a>&nbsp;┋&nbsp;");
  document.write ("<a class=h_td href='#top'>TOP</a>");
  document.write ("</td></tr>");
  document.write ("<tr><td height=3></td></tr>");
  document.write ("<tr><td align=center>");
  document.write ("  <table border=0 cellspacing=0 cellpadding=2>");
  document.write ("  <tr lign=center>");
  document.write ("  <td width=60><img src='images/joekoe_b.gif' alt='");
  document.write ("页面执行时间：<font class=red>"+exec_tim+"</font> 毫秒<font class=gray>("+num_rs+"次)</font><br>");
  document.write ("页面加载时间：<font class=red>"+(time_end-time_start)+"</font> 毫秒<br>");
  document.write ("本站当前有&nbsp;<font class=red>"+web_online_num+"</font>&nbsp;人同时在线<br>");
  document.write ("最高峰有&nbsp;<font class=red title=>"+web_max_online+"</font>&nbsp;人同时在线<br>");
  document.write ("最高峰发生在："+web_max_tim.substring(0,16)+"<br>");
  document.write ("本站总访问量：<font class=red>"+web_counter+"</font>&nbsp;人次<br>");
  document.write ("本站统计时间：从&nbsp;<font class=red>"+web_start_tim+"</font>&nbsp;至今<br>");
  document.write ("<font class=gray>网站当前版本："+pro_edition+"</font>' border=0></td>");
  document.write ("  <td>");
  document.write ("    <table border=0 cellspacing=0 cellpadding=2>");
  document.write ("    <tr><td align=center><a href='"+web_url+"' target=_blank>"+web_name+"</a>&nbsp;&nbsp;<a href='"+web_url+"' target=_blank>"+web_url+"</a></td></tr>");
  document.write ("    <tr><td align=center><a href='mailto:"+web_email+"'>联系我们："+web_email+"</a></td></tr>");
  document.write ("    <tr><td align=center>"+web_copyright+"</td></tr>");
  document.write ("    </table>");
  document.write ("  </td>");
  document.write ("  <td width=60></td>");
  document.write ("  </tr>");
  document.write ("  </table>");
  document.write ("</td></tr>");
  document.write ("<tr><td height=3></td></tr>");
  document.write ("<tr><td height=2 class=bg_frame></td></tr>");
  document.write ("</table>"+righter);
  document.write ("</center></body></html>");
  if (login_message>0 && ie_true==2)
  {
    document.write ("<bgsound src='"+web_dir_skin+"mail/message.wav'>");
    msg_pop();
  }
}

if (ie_true==2) { var msg_popup=window.createPopup(); }
var msg_width=167;
var msg_height=70;
var msg_exc=5;
var msg_max=1500;
var msg_poptop=0;
var screen_width=screen.width;
var screen_height=screen.height;
var screen_left=screen_width-msg_width-msg_exc;

function msg_pop()
{
  var temp1="";
  temp1+="<table border=1 bordercolor=#000000 cellpadding=0 cellspacing=0 style=\"border-collapse: collapse\" width="+msg_width+" height="+msg_height+">";
  temp1+="<tr><td width='100%' height='100%'>";
  temp1+="  <table border=0 cellpadding=0 cellspacing=0 width='100%'>";
  temp1+="  <tr><td height=10><img src='images/msg/win_top.gif' border=0></td></tr>";
  temp1+="  <tr><td height=58 background='images/msg/win_bg.gif'>";
  temp1+="    <table border=0 width='94%'>";
  //temp1+="    <tr><td align=right><img src='images/msg/win_close.gif' border=0></td></tr>";
  temp1+="    <tr><td align=center height=25><img src='"+web_dir_skin+"mail/new.gif' align=absmiddle border=0>&nbsp;<font size=2 color=#ffffff>您现在有<font color=#ff0000>"+login_message+"</font>条新短信</font></td></tr>";
  //temp1+="    <tr><td height=5></td></tr>";
  temp1+="    </table>";
  temp1+="  </td></tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="</table>";
  msg_popup.document.body.innerHTML=temp1;
  msg_pop_show();
}

function msg_pop_show()
{
  if(msg_poptop>msg_max)
  { clearTimeout(msg_time); msg_popup.hide(); return; }
  if (msg_poptop<=(msg_height+msg_exc))
  { msg_popup.show(screen_left,screen_height-msg_poptop,msg_width,msg_poptop-msg_exc); }
  else if (msg_poptop>=(msg_max-msg_height))
  { msg_popup.show(screen_left,screen_height+msg_max-msg_max,msg_width,msg_max-msg_poptop); }
  msg_poptop+=msg_exc;
  var msg_time=setTimeout("msg_pop_show();",50);
}

function web_branch()
{
  //document.write (ukong);
  web_right();
  web_left(2);
}

function web_center(ct)
{
  document.write("</td>");
  document.write("<td width=1 background='"+web_dir_skin+"bg_c.gif'></td>");
  document.write("<td wdith=*>");
}

function web_right() { document.write("</td></tr></table>"+righter); }

function format_topic_type(b_jt,b_username,b_topic,b_c_num,b_url,b_tim,b_counter,b_ispic,b_tit,b_count,b_tim_type)
{
  var n_img="";
  var tim_type="";
  var n_c_num=b_c_num;
  if (b_ispic=="True" || b_ispic=="true")
  {
    n_img="&nbsp;<img src='"+web_dir_skin+"small/img.gif' border=0>";
    n_c_num-=2;
  }
  if (b_tim_type>0)
  {
    if (b_tim_type==2) tim_type+="</td><td align=right>";
    tim_type+="&nbsp;<font class=tims>"+b_tim.substring(2,10)+"</font>";
  }
  var temp1="<tr><td>"+b_jt+"<a href='javascript:;' onclick=\"javascript:open_view('"+b_url+"',1);\" alt='"+b_tit+"："+code_html(b_topic,1,0)+"<br>发 布 人："+b_username+"<br>"+b_count+"："+b_counter+" 人次<br>整理时间："+b_tim+"'>"+code_html(b_topic,1,n_c_num)+"</a>"+n_img+tim_type+"</td></tr>";
  return temp1;
}

function format_pic_type(b_pic,b_topic,b_c_num,b_url)
{
  var temp1="<table border=0>";
  temp1+="<tr><td align=center>"+pic_fk(b_pic,1,b_url)+"</td></tr>";
  temp1+="<tr><td align=center><a href='"+b_url+"' title='"+code_html(b_topic,1,0)+"'>"+code_html(b_topic,1,b_c_num)+"</a></td></tr>";
  temp1+="</table>";
  return temp1;
}

function pic_fk(pvar,pt,purl)
{
  var burl,picurl,temp1="";
  burl="images/fk/";
  picurl=pic_url(pvar,pt);
  if (purl!="" && purl!=null) { picurl="<a href='"+purl+"' target=_blank>"+picurl+"</a>"; }
  /*
  var npic_w,npic_h;
  switch (pt)
  {
   case 2:
     npic_w=pic_w*1.5;npic_h=pic_h*1.5;
     break;
   case 4:
     npic_w=pic_w*0.7;npic_h=pic_h*0.7;
     break;
   case 5:
     npic_w=pic_w*0.5;npic_h=pic_h*0.5;
     break;
   default :
     npic_w=pic_w;npic_h=pic_h;
     break;
  }
  npic_w+=8;npic_h+=8;
  */
  // width='"+npic_w+"' height='"+npic_h+"'
  temp1+="<table border=0 cellpadding=0 cellspacing=0>";
  temp1+="<tr><td colspan=3 width='100%' align=center>";
  temp1+="  <table border=0 cellpadding=0 cellspacing=0 width='100%'>";
  temp1+="  <tr height=4>";
  temp1+="  <td width=7><img src='"+burl+"fk_top_left.gif' width=7 height=4 border=0></td>";
  temp1+="  <td background='"+burl+"fk_top_bg.gif' width='*'><img src='"+burl+"fk_top_bg.gif' border=0 height=4></td>";
  temp1+="  <td width=7 align=right><img src='"+burl+"fk_top_right.gif' border=0 width=7 height=4></td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="<tr><td colspan=3 width='100%' align=center>";
  temp1+="  <table border=0 cellpadding=0 cellspacing=0 width='100%'>";
  temp1+="  <tr>";
  temp1+="  <td width=4 height='100%'>";
  temp1+="    <table border=0 cellpadding=0 cellspacing=0 width='100%' height='100%'>";
  temp1+="    <tr><td height=4><img src='"+burl+"fk_left_top.gif' border=0 width=4></td></tr>";
  temp1+="    <tr><td background='"+burl+"fk_left_bg.gif'></td></tr>";
  temp1+="    <tr><td height=4 valign=bottom><img src='"+burl+"fk_left_end.gif' border=0 width=4></td></tr>";
  temp1+="    </table>";
  temp1+="  </td>";
  temp1+="  <td align=center width=*>"+picurl+"</td>";
  temp1+="  <td width=4 height='100%'>";
  temp1+="    <table border=0 cellpadding=0 cellspacing=0 width='100%' height='100%'>";
  temp1+="    <tr><td height=4><img src='"+burl+"fk_right_top.gif' border=0 width=4></td></tr>";
  temp1+="    <tr><td background='"+burl+"fk_right_bg.gif'></td></tr>";
  temp1+="    <tr><td height=4 valign=bottom><img src='"+burl+"fk_right_end.gif' border=0 width=4></td></tr>";
  temp1+="    </table>";
  temp1+="  </td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="<tr><td colspan=3 width='100%' align=center>";
  temp1+="  <table border=0 cellpadding=0 cellspacing=0 width='100%'>";
  temp1+="  <tr height=4>";
  temp1+="  <td width=7><img src='"+burl+"fk_end_left.gif' width=7 height=4 border=0></td>";
  temp1+="  <td background='"+burl+"fk_end_bg.gif' width='*'><img src='"+burl+"fk_end_bg.gif' border=0 height=4></td>";
  temp1+="  <td width=7 align=right><img src='"+burl+"fk_end_right.gif' border=0 width=7 height=4></td>";
  temp1+="  </tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="</table>";
  return temp1;
}

function nav_ver_true()
{
  if (navigator.appName!="Microsoft Internet Explorer") { return 0; }
  var nav_ver=navigator.appVersion;
  var sys_dim=nav_ver.split(";");
  if (sys_dim.length<3) { return 1; }
  var tmp1=sys_dim[1];
  tmp1=tmp1.replace(/\ /gi,"")
  tmp1=tmp1.replace(/\MSIE/gi,"")
  tmp1=tmp1.substring(0,3);
  var tn=tmp1.substring(0,1);
  if (tn<5) { return 1; }
  if (tn==5)
  { if (tmp1!="5.5") { return 1; } }
  return 2;
}
