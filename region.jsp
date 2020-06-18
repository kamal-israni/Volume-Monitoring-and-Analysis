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
String theDateIn = request.getParameter("datein");
String theDateOut = request.getParameter("dateout");
String theTimeIn = request.getParameter("logintime");
String theTimeOut = request.getParameter("logouttime");
String theCustomer = request.getParameter("customertype");

	int count=0;
	
	sqlR="select * from learner where region='"+theRegion+"' && customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && features='"+theFeature+"';";
	resultR=statement.executeQuery(sqlR);

	while(resultR.next()){
		String Name=resultR.getString("Name");
		String Date=resultR.getString("DateLogIn");
		String TimeIn=resultR.getString("LoggedIn");
		String TimeOut=resultR.getString("LoggedOut");
		String AppId=resultR.getString("AppId");
				
		out.println("Date "+Date+" - ");
		out.println("Application ID "+ AppId + " - ");
		
		out.println(Name+" - "+theCustomer+ " customer used the "+theFeature+" from "+theRegion+
				" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
				TimeIn+ " and "+TimeOut);
		count++;
	 	%><br></br>
	 	<%
	}
	if(theRegion.isEmpty() && theFeature.isEmpty() && theCustomer==null && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String AppId=resultR.getString("AppId");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String Customer=resultR.getString("CustomerType");
			String Region=resultR.getString("Region");
			String Feature=resultR.getString("Features");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
				
			out.println(Name+" - "+Customer+ " customer used the "+Feature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	
	else if(theRegion.isEmpty() && theFeature.isEmpty() && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String AppId=resultR.getString("AppId");
			String Region=resultR.getString("Region");
			String Feature=resultR.getString("Features");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
				
			out.println(Name+" - "+theCustomer+ " customer used the "+Feature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	else if(theRegion.isEmpty() && theCustomer==null && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where features='"+theFeature+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String AppId=resultR.getString("AppId");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String Region=resultR.getString("Region");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
				
			out.println(Name+" - "+Customer+ " customer used the "+theFeature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	else if(theFeature.isEmpty() && theCustomer==null && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"';"; 
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String AppId=resultR.getString("AppId");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String Feature=resultR.getString("Features");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+Customer+ " customer used the "+Feature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}

	else if(theCustomer==null && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && features='"+theFeature+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+Customer+ " customer used the "+theFeature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
		 	%><br></br>
		 	<%
		}
	}
	
	else if(theRegion.isEmpty() && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && features='"+theFeature+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Region=resultR.getString("Region");		
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+theCustomer+ " customer used the "+theFeature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
		 	%><br></br>
		 	<%
		}
	}
	else if(theFeature.isEmpty() && theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && region='"+theRegion+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Feature=resultR.getString("Features");		
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+theCustomer+ " customer used the "+Feature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
		 	%><br></br>
		 	<%
		}
	}
	else if(theRegion.isEmpty() && theFeature.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Region=resultR.getString("Region");	
			String Feature=resultR.getString("Features");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
				
			out.println(Name+" - "+theCustomer+ " customer used the "+Feature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	else if(theRegion.isEmpty() && theCustomer==null)
	{
		sqlR="select * from learner where features='"+theFeature+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Region=resultR.getString("Region");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
					
			out.println(Name+" - "+Customer+ " customer used the "+theFeature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	else if(theFeature.isEmpty() && theCustomer==null)
	{
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';";
		resultR=statement.executeQuery(sqlR);
			
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Feature=resultR.getString("Features");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+Customer+ " customer used the "+Feature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	
	else if(theTimeIn.isEmpty() && theTimeOut.isEmpty())
	{
		sqlR="select * from learner where region='"+theRegion+"' && features='"+theFeature+"' && customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String AppId=resultR.getString("AppId");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
				
			out.println(Name+" - "+theCustomer+ " customer used the "+theFeature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
				%><br></br>
				<%
		}
	}
	else if(theRegion.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && features='"+theFeature+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Region=resultR.getString("Region");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+theCustomer+ " customer used the "+theFeature+" from "+Region+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
			%><br></br>
			<%
		}	
	}
	else if(theFeature.isEmpty())
	{
		sqlR="select * from learner where customertype='"+theCustomer+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"' && region='"+theRegion+"';";
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Feature=resultR.getString("Features");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+theCustomer+ " customer used the "+Feature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
			%><br></br>
			<%
		}
	}
	else if(theCustomer==null)
	{
		sqlR="select * from learner where region='"+theRegion+"' && DateLogIn >= '"+theDateIn+"' &&  DateLogIn <= '"+theDateOut+"' && features='"+theFeature+"' && LoggedIn >= '"+theTimeIn+"' && LoggedOut <= '"+theTimeOut+"';"; 
		resultR=statement.executeQuery(sqlR);
		
		while(resultR.next()){
			String Name=resultR.getString("Name");
			String Date=resultR.getString("DateLogIn");
			String TimeIn=resultR.getString("LoggedIn");
			String TimeOut=resultR.getString("LoggedOut");
			String AppId=resultR.getString("AppId");
			String Customer=resultR.getString("CustomerType");
			
			out.println("Date "+Date+" - ");
			out.println("Application ID "+ AppId + " - ");
			
			out.println(Name+" - "+Customer+ " customer used the "+theFeature+" from "+theRegion+
					" between dates "+theDateIn+" and "+theDateOut+ " and between times "+ 
					TimeIn+ " and "+TimeOut);
			count++;
			%><br></br>
			<%
		}
	}
	/*
	sqlDate="select * from learner where DateLogIn >= '"+theDateIn+"' && DateLogIn <= '"+theDateOut+"'; ";
	resultDate=statement.executeQuery(sqlDate);
	*/
	out.println("The total number of users logged in were "+count);
	
}		
catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>

