function preview_frm()
{
  var temp1="<form name=pre_frm action='preview.asp' method=post target='preview'>";
  temp1+="<input type=hidden name=p_topic value=''>";
  temp1+="<input type=hidden name=p_word value=''>";
  temp1+="</form>";
  return temp1;
}

function preview_type(pfrm,pword)
{
  eval("document.pre_frm.p_word.value=document."+pfrm+"."+pword+".value");
  open_win('about:blank','preview',600,500,'yes');
  document.pre_frm.submit();
}


function preview_b(pfrm,pword,pv)
{
  return "<input type=button onclick=\"javascript:preview_type('"+pfrm+"','"+pword+"');\" value='"+pv+"'>";
}