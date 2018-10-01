
function joekoe_lmenu()
{
  if (lmenu_true!=true) { return; }
  var temp1="<div id=joekoe_lmenu_master style=\"LEFT:-100px;POSITION:absolute;\">";
  temp1+="<div id=joekoe_lmenu_menu style=\"LEFT:100px;POSITION:absolute; TOP:76px; Z-INDEX:5;\" onmouseover=\"javascript:joekoe_lmenu_expand();\">";
  temp1+="<table border=0 cellpadding=0 cellspacing=0 width=21>";
  temp1+="<tr><td width=100%><img name=menu_toolbar src='images/lmenu/toolbar_2.gif'></td></tr>";
  temp1+="</table>";
  temp1+="</div>";
  //temp1+="<div id=top>";
  //temp1+="<table border=0 cellpadding=0 cellspacing=0 width=100>";
  //temp1+="<tr><td width=100%><img border=0 height=1 src=/images/menuborder.gif width=100></td></tr>";
  //temp1+="</div>";
  temp1+="<div id=joekoe_lmenu_screenlinks style=\"POSITION:absolute; TOP:30px; VISIBILITY:visible; Z-INDEX:5;\">";
  temp1+="<table border=0 cellpadding=1 cellspacing=0 width=100>";
  temp1+="<tr><td width='100%'>";
  //开始
  temp1+="<table height=215 cellspacing=0 cellpadding=0 width=95 border=0>";
  temp1+="<tr><td width=95 height=7><img height=7 src='images/lmenu/menu_top.gif' width=95></td></tr>";
  temp1+="<tr>";
  temp1+="<td align=middle background='images/lmenu/menu_bg.gif'>";
  temp1+="  <table cellspacing=0 cellpadding=0 width='90%' border=0>";
  temp1+="  <tr><td height=20><img height=11 hspace=7 src='images/lmenu/menu_arrow.gif' width=7 align=absmiddle><a href='user_main.asp'><b>用户中心</b></a></td></tr>";
  temp1+="  <tr><td height=2><img height=2 src='images/lmenu/menu_1.gif' width=88></td></tr>";
  temp1+="  <tr><td height=3></td></tr>";
  temp1+="  <tr><td align=center height=165>";
  if (login_mode=="" || login_mode==null)
  {
    temp1+="    <table cellspacing=1 cellpadding=1 width='95%' border=0>";
    temp1+="    <form name=login_frm action='login.asp?action=login_chk' method=post>";
    temp1+="    <tr><td colspan=2>用户名称：</td></tr>";
    temp1+="    <tr><td colspan=2><input type=text name=username size=10 maxlength=20></td></tr>";
    temp1+="    <tr><td colspan=2>登陆密码：</td></tr>";
    temp1+="    <tr><td colspan=2><input type=password name=password size=10 maxlength=20></td></tr>";
    temp1+="    <tr><td colspan=2><input type=radio name=memery_info value='no' checked class=bg> 登陆一次</td></tr>";
    temp1+="    <tr><td colspan=2><input type=radio name=memery_info value='yes' class=bg> 永久登陆</td></tr>";
    temp1+="    <tr>";
    temp1+="    <td><a href='register.asp'><img border=0 height=18 width=37 src='images/lmenu/menu_reg.gif'></a></td>";
    temp1+="    <td align=right><input onclick=\"javascript:return login_true();\" name=img_login type=image border=0 height=18 width=37 src='images/lmenu/menu_login.gif'></td>";
    temp1+="    </tr>";
    temp1+="    <tr><td colspan=2 height=20 valign=bottom>→&nbsp;<a href='user_getpass.asp'>忘记密码</a></td></tr>";
    temp1+="    </form>";
    temp1+="    </table>";
  }
  else
  {
    temp1+="    <table cellspacing=1 cellpadding=2 border=0>";
    temp1+="    <tr><td align=center><b><font class=blue>"+login_username+"</font></b></td></tr>";
    temp1+="    <tr><td align=center><font class=red>"+format_power(login_mode,1)+"</font></td></tr>";
    temp1+="    <tr><td align=center><a href='user_mail.asp'>站内短信</a></td></tr>";
    temp1+="    <tr><td align=center><a href='user_emoney.asp'>虚拟货币</a></td></tr>";
    temp1+="    <tr><td align=center><a href='user_friend.asp'>我的好友</a></td></tr>";
    temp1+="    <tr><td align=center><a href='user_edit.asp'>修改资料</a></td></tr>";
    temp1+="    <tr><td align=center><a href='user_pass.asp'>修改密码</a></td></tr>";
    temp1+="    <tr><td align=center><a href='login.asp?action=logout' onclick=\"javascript:return click_return('退出本次登陆',1);\" class=gray>退出登陆</a></td></tr>";
    temp1+="    <tr><td align=center></td></tr>";
    temp1+="    </table>";
  }
  temp1+="  </td></tr>";
  temp1+="  <tr><td height=3></td></tr>";
  temp1+="  <tr height=1><td align=middl height=1 background='images/lmenu/menu_dot.gif'></td></tr>";
  temp1+="  <tr><td height=2></td></tr>";
  temp1+="  <tr><td height=20><img height=11 hspace=7 src='images/lmenu/menu_arrow.gif' width=7 align=absmiddle><a href='help.asp'>帮助中心</a></td></tr>";
  temp1+="  </table>";
  temp1+="</td></tr>";
  temp1+="<tr><td height=6><img height=6 src='images/lmenu/menu_end.gif' width=95></td></tr>";
  temp1+="</table>";
  //结束
  temp1+="</td></tr>";
  temp1+="</table>";
  temp1+="</div>";
  temp1+="</div>";
  document.write(temp1);
  setInterval("document.all.joekoe_lmenu_master.style.top=document.body.scrollTop+2",100);
}

var joekoe_lmenu_master=new Object("element");
joekoe_lmenu_master.curLeft=-100;
joekoe_lmenu_master.curTop=10;
var expandState=0;

function joekoe_lmenu_movealong(layerName, paceLeft, paceTop, fromLeft, fromTop)
{
  clearTimeout(eval(layerName).timer);
  if(eval(layerName).curLeft != fromLeft)
  {
    if((Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft)) < paceLeft)
    { eval(layerName).curLeft=fromLeft; }
    else if(eval(layerName).curLeft < fromLeft)
    { eval(layerName).curLeft=eval(layerName).curLeft + paceLeft; }
    else if(eval(layerName).curLeft > fromLeft)
    { eval(layerName).curLeft=eval(layerName).curLeft - paceLeft; }
    document.all[layerName].style.left=eval(layerName).curLeft;
  }
  if(eval(layerName).curTop != fromTop)
  {
    if((Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop)) < paceTop)
    { eval(layerName).curTop=fromTop; }
    else if(eval(layerName).curTop < fromTop)
    { eval(layerName).curTop=eval(layerName).curTop + paceTop; }
    else if(eval(layerName).curTop > fromTop)
    { eval(layerName).curTop=eval(layerName).curTop - paceTop; }
    document.all[layerName].style.top=eval(layerName).curTop
  }
  eval(layerName).timer=setTimeout('joekoe_lmenu_movealong("'+layerName+'",'+paceLeft+','+paceTop+','+fromLeft+','+fromTop+')',30);
}

function joekoe_lmenu_setPace(layerName, fromLeft, fromTop, motionSpeed)
{
  eval(layerName).gapLeft=(Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft))/motionSpeed;
  eval(layerName).gapTop=(Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop))/motionSpeed;
  joekoe_lmenu_movealong(layerName, eval(layerName).gapLeft, eval(layerName).gapTop, fromLeft, fromTop);
}


function joekoe_lmenu_expand()
{
  if(expandState == 0)
  {
    joekoe_lmenu_setPace("joekoe_lmenu_master", 0, 10, 10);
    document.menu_toolbar.src="images/lmenu/toolbar_1.gif";
    expandState=1;
  }
  else{
    joekoe_lmenu_setPace("joekoe_lmenu_master", -100, 10, 10); 
    document.menu_toolbar.src="images/lmenu/toolbar_2.gif";
    expandState=0;
  }
}

joekoe_lmenu();
