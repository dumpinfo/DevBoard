
var dim_power=web_user_power.split("|");
var dim_grade=web_user_grade.split("|");
function forum_user_power_grade(u_int,u_power)
{
  var si,snum,sdim,sdim2;
  var gp_type="";gp_types="";gp_name="";up_type="";up_name="";
  snum=dim_power.length;
  for (si=0;si<snum;si++)
  {
    sdim=dim_power[si].split(":");
    if (u_power==sdim[0])
    {
      up_type=sdim[0];
      up_name=sdim[1];
      switch (si)
      {
        case 0:
          gp_types=up_type;
          gp_type="p";
          break;
        case 1:
          gp_types=up_type;
          gp_type="p";
          break;
        case 2:
          gp_type="p";
          break;
      }
      break;
    }
  }
  if (up_type=="" || up_name=="")
  {
    sdim=dim_power[0].split(":");
    up_type=sdim[0];
    up_name=sdim[1];
  }
  
  var n_int=0;b=0;
  snum=dim_grade.length;
  for (si=0;si<snum;si++)
  {
    sdim=dim_grade[si].split(":");
    if (si!==snum-1) { sdim2=dim_grade[si+1].split(":"); }
    switch (si)
    {
      case snum-1:
        if (u_int>=sdim[0])
        {
          n_int=si;
          gp_name=sdim[1];
          b=1;
          break;
        }
      default :
        if (u_int<sdim2[0])
        {
          n_int=si;
          gp_name=sdim[1];
          b=1;
          break;
        }
    }
    if (b==1) break;
  }
  
  var gp_type2=gp_type;
  var gp_type3=gp_type+n_int;
  if (gp_types!="" && gp_types!=null)
  {
    //gp_name=up_name;
    gp_type3=gp_types;
  }
  return "<img src='"+web_dir_skin+"star/star_"+gp_type3+".gif' border=0><br>&nbsp;&nbsp;µÈ¼¶£º<img border=0 src='"+web_dir_skin+"small/icon_"+up_type+".gif' alt='"+up_name+"' align=absmiddle>&nbsp;"+gp_name;
}
