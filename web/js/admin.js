function up_down(obj) {
    window.location.href="Up_down?name="+obj;
}



function sort1() {
    // var t=document.getElementById("table1");
    //删除
    // t.deleteRow(2);
    // //更新
    // // var uRow = t.rows[0];
    // // uRow.className = "title";
    //
    // //添加
    // var rowNums = t.rows.length;
    // var newRow = t.insertRow(rowNums);
    // var col1 = newRow.insertCell(0);
    // col1.innerHTML = "幸福从天而降";
    // var col2 = newRow.insertCell(1);
    // col2.innerHTML = "18.5";
    // var col2 = newRow.insertCell(2);
    // col2.innerHTML = "18.5";
    // var col2 = newRow.insertCell(3);
    // col2.innerHTML = "18.5";
    // var col2 = newRow.insertCell(4);
    // col2.innerHTML = "18.5";
    // sessionStorage.setItem("sort","1");

}
function sort2(obj) {
    var td4s=document.getElementsByName("td4");
    var td0s=document.getElementsByName("td0");
    var td1s=document.getElementsByName("td1");
    var td2s=document.getElementsByName("td2");
    var td3s=document.getElementsByName("td3");
    var tdArray4=[];
    var tdArray0=[];
    var tdArray1=[];
    var tdArray2=[];
    var tdArray3=[];
    for(var i=0;i<td4s.length;i++){
        tdArray4.push(td4s[i].innerHTML);
    }
    for(var i=0;i<td0s.length;i++){
        tdArray0.push(td0s[i].innerHTML);
    }
    for(var i=0;i<td1s.length;i++){
        tdArray1.push(parseInt(td1s[i].innerHTML));
    }
    for(var i=0;i<td2s.length;i++){
        tdArray2.push(parseInt(td2s[i].innerHTML));
    }
    for(var i=0;i<td3s.length;i++){
        tdArray3.push(parseInt(td3s[i].innerHTML));
    }
    var tds=document.getElementsByName("td"+obj.substr(0,1));
    var columnArray=[];
    for(var i=0;i<tds.length;i++){
        columnArray.push(parseInt(tds[i].innerHTML));
    }
    var orginArray=[];
    for(var i=0;i<columnArray.length;i++){
        orginArray.push(columnArray[i]);
    }



    //升序
    if(sessionStorage.getItem("sort")=="2")
    {
        columnArray.sort(sortNumberAS);
        sessionStorage.setItem("sort","1");
    }else {
        //降序
        columnArray.sort(sortNumberDesc);
        sessionStorage.setItem("sort","2");
    }


    for(var i=0;i<columnArray.length;i++){
        for(var j=0;j<orginArray.length;j++){
            if(orginArray[j]==columnArray[i]){
                document.getElementsByName("td4")[i].innerHTML=tdArray4[j];
                document.getElementsByName("td0")[i].innerHTML=tdArray0[j];
                document.getElementsByName("td1")[i].innerHTML=tdArray1[j];
                document.getElementsByName("td2")[i].innerHTML=tdArray2[j];
                document.getElementsByName("td3")[i].innerHTML=tdArray3[j];
                orginArray[j]=null;
                break;
            }
        }
    }

}
var tag=1;
function sortNumberAS(a, b)
{
    return a - b
}
function sortNumberDesc(a, b)
{
    return b-a
}


