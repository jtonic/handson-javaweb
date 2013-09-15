### This project is for learning purposes. I hope it will be useful for IT fresh graduates.

#### This project:

1. is a web application deployed on Tomcat 7

1. build with maven

1. using java 1.7

1. servlet specification 2.5+

1. jsp specification 2.0

1. using standard taglibs


#### TODO:

1. [V] Create a hello servlet

    (in browser) http://localhost:8080/handson-javaweb/hello

1. [V] Create a hello jsp page

    (in browser) http://localhost:8080/handson-javaweb/hellojsp

1. [V] Create a hello jstl page

    (in browser) http://localhost:8080/handson-javaweb/hellojstl

1. [V] Create the login page and use jstl for if branches and getting the param values

    (in browser) http://localhost:8080/handson-javaweb/login

1. Create a simple login page using Servlet

1. Create a simple login page using plain jsp

1. Use the session

1. Use the session, request fields available in jsp page

1. Create a simple taglib for validation


#### Install jdk 1.7 oracle version on ubuntu:

1. Download jdk from http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

    Choose the right OS and architecture.

    For my machine I chosen:

    Linux x64	131.63 MB  	jdk-7u40-linux-x64.tar.gz

1. Untar it in a directory in user home, say ~/Development/jdks/java

    After un-archiving you will end up having the following folder

    /home/jtonic/Development/sdks/java/jdk1.7.0_25/

    This is known as a JAVA_HOME directory

1. Know we have to let linux know about the java installation.
    To o that add the following lines in both ~/.profiles and ~/.bashrc. If both or one of them do not exist create them with $ touch ~/.profiles or $ touch ~/.bashrc

    export JAVA_HOME=/home/jtonic/Development/sdks/java/jdk1.7.0_25
    export PATH=$JAVA_HOME/bin:$PATH

1. reload the files using
    $ . ~/.bashrc
    $ . ~/.profiles

1. check java installation

    $ java -version

#### Install maven 3 on ubuntu:

1. $ sudo apt-get install maven

1. Check installation

    $ mvn -v

#### Install Tomcat 7 on ubuntu 13.04:

1. Install tomcat

    $ sudo apt-get install tomcat7 tomcat7-admin tomcat7-examples

1. check if the tomcat server is started

    $ sudo service tomcat7 status

    if it is not started start it using:

    $ sudo service tomcat7 start

1. Check the tomcat installation

    $ telnet localhost 8080

    Point the browser to http://localhost:8080/

    You should be prompted with It works!!! message

1. In order to have the possibility to deploy a web application (servlets and jsp pages) we need to set the credentials for manager role (username/password)

    1. edit the tomcat-users.xml
        
        $ sudo gedit /var/lib/tomcat7/conf/tomcat-users.xml

    1. and make sure you have the following line (uncommented)

      <user username="manager" password="manager" roles="manager-gui,manager-script,manager-jmx,manager-status"/>

    1. restart tomcat
    
        $ sudo service tomcat7 restart

    1. Check if all is ok by pointing the browser to:

        http://localhost:8080/manager/html

    1. You should ne promoted to insert the credentials

    1. If they are ok a page with all installed applications and their management is shown.

1. So far so good, but in order to install the application through maven you need to add the credentials in pom.xml

    Find out the following lines and change the values of the properties accordingly.

    <blockquote>

        <properties>
            <tomcat.manager>manager</tomcat.manager>
            <tomcat.password>manager</tomcat.password>
        </properties>

    </blockquote>

1. deploy the web application

    1. $ cd %PATH_TO_APP_HOME

    1. $ mvn package

    1. point the browser to the urls in todo section


#### Theory

1. JSP syntax elements

    Comments <%--.. --%>

    Declarations <%! ..%>

    Directives <%@ include .. %>  <%@ page .. %> <%@ taglib .. %>

    Expressions <%= ..%>

    Scriptlets <% ..%>

1. JSP expressions are very powerful and expressive. So favor it over the java code or vanilla jsp syntax elements.

 Further details here: http://docs.oracle.com/javaee/1.4/tutorial/doc/JSPIntro7.html


1. Setting and getting session attributes using vanilla jsp:

    <% session.setAttribute( "theName", name ); %>

    <%= session.getAttribute( "theName" ) %>

1. In JSP there are 2 types of tags: loaded from external tag libs or predefined tags.

    1. Predefined tags start with jsp: See below the predefined tags

        <jsp:forward>

        <jsp:include>

        <jsp:param>

        <jsp:plugin>

        <jsp:useBean>

        <jsp:getProperty> // Used for Java Beans

        <jsp:setProperty> // Used for Java Beans


1. Import classes or all package classes in JSP

    <%@ page import="fully-qualified-classname, packagename.*" %>


1. Differences between forward and redirect

        Excerpts from http://javapapers.com/jsp/difference-between-forward-and-sendredirect/

 > Control can be forward to resources available within the server from where the call is made. This transfer of control is done by the container internally and browser / client is not involved. This is the major difference between forward and sendRedirect. When the forward is done, the original request and response objects are transfered along with additional parameters if needed.

        Example of forward in jsp/jstl/servlet:

        (jsp) <jsp:forward page="/hellojsp"/>

        (jsp el) "${ pageContext.forward('/hellojsp')}"

        (servlet) httpServletRequest.getRequestDispatcher("/hellojstl").forward(httpServletRequest, httpServletResponse);

        Note: for forward value can be used both the url-pattern in web.xml or the path to jsp files, i.e.: /pages/greeting.jsp

 > Control can be redirect to resources to different servers or domains. This transfer of control task is delegated to the browser by the container. That is, the redirect sends a header back to the browser / client. This header contains the resource url to be redirected by the browser. Then the browser initiates a new request to the given url. Since it is a new request, the old request and response object is lost.

        Example of redirect in jsp/servlet:

        (jsp) <% response.sendRedirect("http://www.google.com"); %>

        (servlet) httpServletResponse.sendRedirect("http://www.google.com");

1. A JSP is just a servlet in disguise.

