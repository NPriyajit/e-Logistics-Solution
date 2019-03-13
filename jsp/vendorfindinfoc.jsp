<html>
    <%@ page language="java" contentType="text/html" import="java.sql.* , java.lang.*" %>    

<head>
    <title>
        Find Information
    </title>
    <link rel="stylesheet" href="../css/style.css">
    <script language="javascript">
        function showdata()
        {
            var vendno,vendname,contactper,locality,city,state,phoneno,fax,date,gstno,ccode,emailid,website;
            vendname=new Array();
            contactper=new Array();
            locality=new Array();
            city=new Array();
            state=new Array();
            phoneno=new Array();
            fax=new Array();
            date=new Array();
            gstno=new Array();
            ccode=new Array();
            emailid=new Array();
            website=new Array();
            var j,k;
            j=0;
            <%
            i=0;
            while(i<names.length)
            {
            %>
            vendname[j]=<%=vendname[i] %>;
            contactper[j]=<%=contactper[i] %>;
            locality[j]=<%=locality[i] %>;
            city[j]=<%=city[i] %>;
            state[j]=<%= state[i] %>;
            phoneno[j]=<%= phoneno[i] %>;
            fax[j]=<%=fax[i] %>;
            date[j]=<%=date[i] %>;
            gstno[j]=<%=gstno[i] %>;
            ccode[j]=<%= ccode[i] %>;
            emailid[j] = <%= emailid %>;
            website[j] = <%= website %>;
            j=j+1;
            <%
            i=i+1;
            %>
            k=docuemt.f2.cmbvendcode.selectedIndex;
            document.f2.txtvendname.value=vendname[k-1];
            document.f2.txtcontper.value=contactper[k-1];
            document.f2.txtlocality.value=locality[k-1];
            document.f2.txtcity.value=city[k-1];
            document.f2.txtstate.value=state[k-1];
            document.f2.txtccode.value=ccode[k-1];
            document.f2.email.value=emailid[k-1];
            document.f2.urlvend.value=website[k-1];
            }
        }
    
    
    </script>
</head>
<body>
    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,reshow;
    String  vendorcode,vendname[],contactper[],locality[],city[],state[],phoneno[],fax[],date[],gstno[],ccode[],emailid[],website[]; 
    int i;
    public void doConncect()
    {
     try
      {
        Class.forName("sun.jdbc.odbc.JdbcodbcDriver");
      }
      catch(ClassNotFoundException e)
      {
        System.out.println("A error"+e);
      }
      try
      {
        conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
      }
      catch(SQLException e)
      {
        System.out.println("B error");
      }
    }
    %>
    <%
    i=0;
    vendname=new String[30];
    contactper=new String[30];
    locality=new String[30];
    city=new String[30];
    state=new String[30];
    phoneno=new String[30];
    fax=new String[30];
    date=new String[30];
    gstno=new String[30];
    ccode=new String[30];
    emailid=new String[30];
    website=new String[30];

    try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblvendorinfo");
        while(rsshow.next())
        {
            

            i++;
        }
    }
    catch(SQLException ses)
    {
        System.out.println("Error"+ses);
    }
    %>

    <header class="header">
        <h1 id="headertext">e-Logistics<sub id="subtext"> Solutions</sub></h1>
    </header>
    <fieldset>
          <legend>Change Details</legend>
          <form name="f2" action="vendorfindinfos.jsp">
                <table>
                        <tr>
                            <td>
                                Vendor Code:
                            </td>
                            <td>
                                <select name="cmbvendcode" onchange="showdata()">
                                    <option value=" ">-Select-</option>
                                    <%
                                    try
                                    {
                                        stmtfill=conn.createStatement();
                                        refill=stmtfill.executeQuery("select * from tblvendorinfo");                                   
                                        while(rsfill.next())
                                        {
                                            vendorcode=rsfill.getString("venddno");

                                            out.println("<option value=\"<%= vendorcode %>\"> <%= vendorcode %> </option>");
                                        }
                                     catch(SQLException es)
                                        {
                                            System.out.println("exception"+e);
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Vendor Name:
                            </td>
                            <td>
                                <input type="text" title="Enter your company Name" name="txtvendname" required>
                                <font color="red">*</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Contact Person:
                            </td>
                            <td>
                                <input type="text" name="txtcontper"  autocomplete="on">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Locality:
                            </td>
                            <td>
                                <input type="text" name="txtlocality"  list="cities">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:
                            </td>
                            <td>
                                <input type="text" name="txtcity" list="cities">
                                <font color="red">*</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State:
                            </td>
                            <td>
                                <input type="text" name="txtstate" list="states"  >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone no:
                            </td>
                            <td>
                                <select name="countrycode" id="ccode" onchange="unfocus()">
                                    <option>-CODE-</option>
                                    <option>+91</option>
                                </select>
                                <input type="number" maxlength="10" id="phno" name="numphno" title="enter your phone no" min="0"  required>
                                <font color="red">*</font>
                            </td>
                            <td>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                            </td>
                            
                            <td>
                                Fax:
                            </td>
                            <td>
                                <input type="number" min="0" name="numfax" id="bar"  title="enter fax number" required autocomplete="off"> 
                                <font color="red">*</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date:
                            </td>
                            <td>
                                <input type="date" name="date" required>
                                <font color="red">*</font>
                            </td>
                            <td>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                            </td>
                           
                            <td>
                                GST no:
                            </td>
                        
                            <td>
                                <input type="number" id="bar" name="numgst" required autocomplete="off">
                                <font color="red">*</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email-ID:
                            </td>
                            <td>
                                <input type="email" name="email" required title="enter a valid email">
                                <font color="red">*</font>
                            </td>
                            <td>
                                 &nbsp; &nbsp; &nbsp; &nbsp;
                            </td>
                            <td>
                                Website:
                            </td>
                            <td>
                                <select name="cmbssl" id="combossl" onchange="changessl()">
                                    <option>-SSL-</option>
                                    <option>HTTP</option>
                                    <option>HTTPS</option>
                                </select>
                                <input type="url" id="websitebar" name="urlvend" onfocus="getfocus()">
                            </td>
        
                        </tr>
                    </table>
                    <div class="button">
                        <input id="btn" type="submit" name="btnup" value="update">
                        <input id="btn" type="submit" name="btndel" value="delete">
                        <input id="btn" type="button" name="btnback" value="back">
                    </div>   
                </form>
            </fieldset>





</body>
</html>