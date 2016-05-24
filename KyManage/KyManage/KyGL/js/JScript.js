// JScript 文件
    function unselectall()
{
    if(document.form1.chkAll.checked){
	document.form1.chkAll.checked = document.myform.chkAll.checked&0;
    } 	
}

function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll"&&e.disabled!=true)
       e.checked = form.chkAll.checked;
    }
}
//弹出居中窗口
//param wW，要弹出窗口的宽度
//param wH，要弹出窗口的高度
//param wHref，网页action或链接
function openwin(wW,wH,wHref,winname) {
		var xMax = screen.width, yMax = screen.height;
		var xOffset = (xMax - wW)/2, yOffset = (yMax - wH)/2;
		win = window.open(wHref,winname, 'width=' + wW + ',height=' + wH + ',top=10,left='+xOffset+',toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=yes');
}

 function CallPrint(strid)
    {
     var prtContent = document.getElementById(strid);
     var WinPrint = window.open('','','letf=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0,menubar=0');
     WinPrint.document.write(prtContent.innerHTML);
     WinPrint.document.close();
     WinPrint.focus();
     WinPrint.print();
     WinPrint.close();
     //prtContent.innerHTML=strOldOne;
    }
function EditSubjectCategory(id){
	    openwin('600','450','Category_Edit.aspx?CategoryID='+id,'EditSubjectCategory');

	}
function EditCategory(CategoryID){
	if(CategoryID!='0')
	    openwin('600','400','Category_Edit.aspx?CategoryID='+CategoryID,'EditCategory');
	}
function EditParentCategory(CategoryID){
	if(CategoryID!='0')
	    openwin('600','400','Category_Edit.aspx?ParentID='+CategoryID,'EditCategory');
	}
function Del(){
    if(confirm("您确定要删除?"))
    {return true;}
return false;
}

