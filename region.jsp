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
String query=null;
String theRegion = request.getParameter("region");
String theFeature = request.getParameter("features");
String theDateIn=request.getParameter("datein");
String theDateOut=request.getParameter("dateout");
String theTimeIn=request.getParameter("logintime");
String theTimeOut=request.getParameter("logouttime");
String theCustomer=request.getParameter("customertype");
String month=null;
String date = null;

	sqlR="select * from learner where region='"+theRegion+"' && customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && features='"+theFeature+"';";
	resultR=statement.executeQuery(sqlR);


	while(resultR.next()){
		String Name=resultR.getString("Name");
		String Feature=resultR.getString("Features");
		String Region=resultR.getString("Region");
	
		out.println(Name+" being a "+ theCustomer+ " customer used the "+Feature+" from "+Region+
				" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
				theTimeIn+ " and "+theTimeOut); 
	 	%><br></br>
	 	<%
	}


	if(theRegion.isEmpty() && theFeature.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" being a "+ theCustomer+ " customer logged in between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
				%><br></br>
				<%
		}
	}

	else if(theRegion.isEmpty() && theCustomer==null)
	{
		sqlR="select * from learner where features='"+theFeature+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" used the feature "+theFeature+ " between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
				%><br></br>
				<%
		}
	}
	
	else if(theFeature.isEmpty() && theCustomer==null)
	{
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" from  "+theRegion+ "logged in between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
				%><br></br>
				<%
		}
	}
	
	else if(theRegion.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && features='"+theFeature+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" being a "+ theCustomer+ " customer used the "+theFeature+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
			%><br></br>
			<%
		}	
	}
	
	
	else if(theFeature.isEmpty())
	{
		
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && region='"+theRegion+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" being a "+ theCustomer+ " customer logged in from the region "+theRegion+" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
			%><br></br>
			<%
		}
	}
	
	
	else if(theCustomer==null)
	{
	
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && features='"+theFeature+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';"; 
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next())
		{
			String Name=resultR.getString("Name");
			out.println(Name+" used the feature "+theFeature+ " from the region "+theRegion+" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					theTimeIn+ " and "+theTimeOut);
			%><br></br>
			<%
		}
	}
	
	
}		
catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>

