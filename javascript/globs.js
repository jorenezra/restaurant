//define functions and global variables here...
var siteloc = "http://localhost/restaurant";
var scriptloc = "/scripts/"

function fetchgradesheet(course, section, semid)
{
  $.ajax({
      url: siteloc + scriptloc + "getorder.py",
      data: {menu_id:menu_id},
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
					  table = '<table border="1">';
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}

