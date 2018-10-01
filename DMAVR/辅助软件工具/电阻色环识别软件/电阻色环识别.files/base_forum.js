
function base_forum_istop(b_istop,b_isvote)
{
  var temp_b="istop";
  if (b_isvote==1)
  { temp_b="isvote"; }
  { if (b_istop==2) { temp_b="istops"; } }
  return "<img src='"+web_dir_skin+"forum/"+temp_b+".gif' border=0>";
}

function base_forum_is(b_re_counter,b_istop,b_islock,b_isgood,b_isvote,b_vote_num)
{
  var temp_b="isok";
  if (b_isvote==1)
  {
    if (b_islock==1)
    { temp_b="isvotelock"; }
    else
    { temp_b="isvote"; }
  }
  else
  {
    switch (b_istop)
    {
      case 1:
        temp_b="istop";
        break;
      case 2:
        temp_b="istops";
        break;
      default :
        if (b_isgood==1)
        { temp_b="isgood"; }
        else
        {
          if (b_islock==1)
          { temp_b="islock"; }
          else
          { if (b_re_counter>=10) temp_b="ishot"; }
        }
        break;
    }
  }
  return "<img src='"+web_dir_skin+"forum/"+temp_b+".gif' border=0>";
}

function base_forum_isview(b_isvote,b_islock,b_re_counter,b_istop,b_isgood)
{
  var temp_b="";
  if (fir_isvote=="True" || fir_isvote=="true")
  { temp_b+="<img src='"+web_dir_skin+"forum/isvote.gif' border=0>&nbsp;"; }
  else
  {
    if (fir_islock==1)
    { temp_b+="<img src='"+web_dir_skin+"forum/islock.gif' border=0>&nbsp;"; }
    else
    {
      if (re_counter>=hot_num)
      { temp_b+="<img src='"+web_dir_skin+"forum/ishot.gif' border=0>&nbsp;"; }
      else
      { temp_b+="<img src='"+web_dir_skin+"forum/isok.gif' border=0>&nbsp;"; }
    }
  }
  if (fir_istop==1) { temp_b+="<img src='"+web_dir_skin+"forum/istop.gif' border=0>&nbsp;"; }
  if (fir_istop==2) { temp_b+="<img src='"+web_dir_skin+"forum/istops.gif' border=0>&nbsp;"; }
  if (fir_isgood==1) { temp_b+="<img src='"+web_dir_skin+"forum/isgood.gif' border=0>&nbsp;"; }
  return temp_b;
}