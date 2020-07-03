
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title> </title>
    <style type="text/css">
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #cdcdcd;
        }

        table th,
        table td {
            padding: 5px;
            text-align: left;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".add-row").click(function() {
            	var patientid = $("#patientid").val();
            	var patientssnid = $("#patientssnid").val();
            	
                var testname = $("#testname").val();
                
                var rate = $("#rate").val();
                var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + patientid+"</td><td>"  + patientssnid + "</td><td>""</td><td>" + testname + "</td><td>"+ rate + "</td></tr>";
                $("table tbody").append(markup);
            });
            /* Find and remove selected table rows */
            $(".delete-row").click(function() {
                $("table tbody").find('input[name="record"]').each(function() {
                    if ($(this).is(":checked")) {
                        $(this).parents("tr").remove();
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form name="form" action="<%=request.getContextPath()%>/testservlet" method="post">
     <input type="text" id="patientid" name="patientid" >
     <input type="text" id="patientssnid" name="patientssnid" >
     
        <input type="text" id="testname" name="testname" >
         <input type="text" id="rate" name="rate">
        
        <input type="submit" class="add-row" value="Add Row">
    </form>
    <table>
        <thead>
            <tr>
                <th>Select</th>
                <th>patientid</th>
                <th>patientssnid</th>
                 <th>testname</th>
                
                <th>rate</th>
                 
            </tr>
        </thead>
        <tbody>
            <tr>
                
            </tr>
        </tbody>
    </table>
    <button type="button" class="delete-row">Delete Row</button>
    <a href="test.jsp">add medicine</a>
    <a href="Login.jsp">GO BACK</a>
</body>
</html>