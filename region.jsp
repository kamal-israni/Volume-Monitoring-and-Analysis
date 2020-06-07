<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.util.*"%>

<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "web_student_tracker";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
java.sql.Connection connection = null;
java.sql.Statement statement = null;
ResultSet resultR= null;
ResultSet resultFeature=null;
ResultSet resultDate=null;
ResultSet resultTime=null;
ResultSet resultCustomer=null;
%>


<!DOCTYPE html>
<html>
<body>
<head> 

</head>
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sqlR =null;
String theRegion = request.getParameter("region");
String theFeature = request.getParameter("features");
String theDateIn=request.getParameter("datein");
String theDateOut=request.getParameter("dateout");
String theTimeIn=request.getParameter("logintime");
String theTimeOut=request.getParameter("logouttime");
String theCustomer=request.getParameter("customer");
String month=null;
String date = null;

	
	
	sqlR="select * from learner where region='"+theRegion+"' && customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && features='"+theFeature+"';";
	resultR=statement.executeQuery(sqlR);

	/*
	sqlDate="select * from learner where DateLogIn >= '"+theDateIn+"' && DateLogIn <= '"+theDateOut+"'; ";
	resultDate=statement.executeQuery(sqlDate);
	*/
	/*
	sqlTime="select * from learner where LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"'; ";
	resultTime=statement.executeQuery(sqlTime);
	*/
	
	while(resultR.next()){
		String Name=resultR.getString("Name");
		String Feature=resultR.getString("Features");
		String Region=resultR.getString("Region");
		
		out.println(Name+" being a "+ theCustomer+ " customer used the "+Feature+" from "+Region+
				" between dates "+theDateIn+" and "+theDateOut+ " between times "+ 
				theTimeIn+ " and "+theTimeOut); 
		 %><br></br>
		 <%
	}
}		
catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>

