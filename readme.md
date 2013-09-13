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

1. Create a simple login page using Servlet

1. Create a simple login page using plain jsp

1. Use the session

1. Use the session, request fields available in jsp page

1. Create a simple taglib for validation


#### Tomcat 7 installation (ubuntu 13.04):

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


