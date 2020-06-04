<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
img.one {
  height: auto;
  width: auto;
}
</style>
	<title>HTML Editor - Full Version</title>
</head>
<body>
<h1>Spring MVC Form Handling Tutorial and Example</h1>
<P>  The time on the server is ${serverTime}. </P>
<p>For most programmers, form handling is the day-to-day task in general web development as well as in Spring MVC development. A typical scenario would be like this: the user fills in a web form and click Submit button. The server receives the user&rsquo;s request, validates inputs, processes some business logic and finally returns a response/message back to the user. In this tutorial, we&rsquo;ll see how the Spring MVC framework supports form handling, and then build a sample application that handles a registration form which looks like this:</p>

<p>(1) ${webappRoot}</p>
<p>(2) ${pageContext.request.contextPath}</p>

<p><img class="one" src="images/registro1.png" /></p>

<p>First, let&rsquo;s see how form handling is supported in Spring MVC.</p>

<p><strong>1. Form Handling Support in Spring MVC</strong></p>

<p><br />
Spring MVC is a <em>Model-View-Controller</em> framework so it handles form submission by the three key components: model, view and controller.</p>

<ul>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Model</strong>: basically a POJO (Plain Old Java Object) class is created to bind form fields with properties of the object. This object will be put into the model (model object).</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>View</strong>: Spring MVC form tags are used to render the equivalent HTML form fields, and most importantly, bind the object in the model with the form.</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Controller</strong>: alongside with handling requests, the controller binds the model object with the view and vice-versa, and delegates processing to dedicated business/service class.</li>
</ul>

<p>Now let&rsquo;s walk through the steps of building a sample application (registration form).</p>

<p><br />
<strong>2. Coding Model Class (form-backing object)</strong></p>

<p><br />
Create <strong><span style="color:#800000;">User.java</span></strong> class with the following code:</p>

<p>File:<strong><span style="color:#8B4513;"> </span><span style="color:#800000;">src/main/java/net/codejava/spring/model/</span></strong><span style="color:#800000;">User.java</span></p>

<p><strong><span style="color:#0000FF;">package net.codejava.spring.model;<br />
&nbsp;<br />
import java.util.Date;<br />
&nbsp;<br />
public class User {<br />
&nbsp;&nbsp;&nbsp; private String username;<br />
&nbsp;&nbsp;&nbsp; private String password;<br />
&nbsp;&nbsp;&nbsp; private String email;<br />
&nbsp;&nbsp;&nbsp; private Date birthDate;<br />
&nbsp;&nbsp;&nbsp; private String profession;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; // getters and setters...<br />
&nbsp;<br />
}</span></strong></p>

<p><br />
As we can see, this model class has five fields (username, password, email, birthDate and profession) which bind to the corresponding fields in the view (JSP page). When an object of a model class is bound to a form, it is called form-backing object.</p>

<p><br />
<strong>3. Coding Registration Form using Spring Form Tags</strong></p>

<p><br />
Write code for the registration form (<strong><span style="color:#800000;">Registration.jsp</span></strong>) as follows:</p>

<p>File: <strong><span style="color:#800000;">src/main/webapp/WEB-INF/views/Registration.jsp</span></strong></p>

<p><br />
&nbsp;&nbsp; &nbsp;<br />
<strong><span style="color:#0000FF;">&lt;%@ page language=&quot;java&quot; contentType=&quot;text/html; charset=UTF-8&quot;<br />
&nbsp;&nbsp;&nbsp; pageEncoding=&quot;UTF-8&quot;%&gt;<br />
&lt;%@ taglib prefix=&quot;form&quot; uri=&quot;http://www.springframework.org/tags/form&quot;%&gt;&nbsp; &nbsp;<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD HTML 4.01 Transitional//EN&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;http://www.w3.org/TR/html4/loose.dtd&quot;&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;<br />
&lt;title&gt;Registration&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;div align=&quot;center&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;form:form action=&quot;register&quot; method=&quot;post&quot; commandName=&quot;userForm&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;table border=&quot;0&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;h2&gt;Spring MVC Form Demo - Registration&lt;/h2&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;User Name:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;&lt;form:input path=&quot;username&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;Password:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;&lt;form:password path=&quot;password&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;E-mail:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;&lt;form:input path=&quot;email&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;Birthday (mm/dd/yyyy):&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;&lt;form:input path=&quot;birthDate&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;Profession:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;&lt;form:select path=&quot;profession&quot; items=&quot;${professionList}&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;input type=&quot;submit&quot; value=&quot;Register&quot; /&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/table&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/form:form&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;</span></strong></p>

<p>The <strong><span style="color:#800000;">&lt;form:form&gt;</span></strong> tag plays an important role here. It&rsquo;s very similar to the regular HTLM <strong><span style="color:#800000;">&lt;form&gt;</span></strong> tag but the <strong><span style="color:#800000;">commandName</span></strong> attribute is the key which specifies name of the model class object that acts as a backing object for this form:</p>

<p><strong><span style="color:#0000FF;">&lt;form:form action=&quot;register&quot; method=&quot;post&quot; commandName=&quot;userForm&quot;&gt;</span></strong><br />
&nbsp;</p>

<p>We&rsquo;ll see how to set a model class object as the form-backing object when coding the controller class.</p>

<p>Also in this JSP page, we are using few Spring form tags to generate equivalent HTML form input tags and bind these form fields with corresponding properties of the model class Userabove, including:</p>

<ul>
	<li><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#0000FF;"> &lt;form:input&gt;: generates HTML &lt;input type=&rdquo;text&rdquo;&gt; tag.</span></strong></li>
	<li><strong><span style="color:#0000FF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;form:password&gt;: generates HTML &lt;input type=&rdquo;password&rdquo;&gt; tag.</span></strong></li>
	<li><strong><span style="color:#0000FF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;form:select&gt;: generates HTML &lt;select&gt; tag and its items in &lt;option&gt; tags.</span></strong></li>
</ul>

<p>Here, the noteworthy attribute of each tag is path - which specifies name of a property of the model class.</p>

<p><br />
<strong>4. Coding Controller Class</strong></p>

<p><br />
Write code for the controller class (<strong><span style="color:#800000;">RegisterController.java</span></strong>) as follows:</p>

<p>File: <strong><span style="color:#800000;">src/main/java/net/codejava/spring/controller/RegisterController.java</span></strong></p>

<p><br />
<strong><span style="color:#0000FF;">package net.codejava.spring.controller;<br />
&nbsp;<br />
import java.util.ArrayList;<br />
import java.util.List;<br />
import java.util.Map;<br />
&nbsp;<br />
import net.codejava.spring.model.User;<br />
&nbsp;<br />
import org.springframework.stereotype.Controller;<br />
import org.springframework.web.bind.annotation.ModelAttribute;<br />
import org.springframework.web.bind.annotation.RequestMapping;<br />
import org.springframework.web.bind.annotation.RequestMethod;<br />
&nbsp;<br />
@Controller<br />
@RequestMapping(value = &quot;/register&quot;)<br />
public class RegisterController {<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; @RequestMapping(method = RequestMethod.GET)<br />
&nbsp;&nbsp;&nbsp; public String viewRegistration(Map&lt;String, Object&gt; model) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User userForm = new User();&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.put(&quot;userForm&quot;, userForm);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List&lt;String&gt; professionList = new ArrayList&lt;&gt;();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; professionList.add(&quot;Developer&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; professionList.add(&quot;Designer&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; professionList.add(&quot;IT Manager&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.put(&quot;professionList&quot;, professionList);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;Registration&quot;;<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; @RequestMapping(method = RequestMethod.POST)<br />
&nbsp;&nbsp;&nbsp; public String processRegistration(@ModelAttribute(&quot;userForm&quot;) User user,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Map&lt;String, Object&gt; model) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // implement your own registration logic here...<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // for testing purpose:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(&quot;username: &quot; + user.getUsername());<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(&quot;password: &quot; + user.getPassword());<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(&quot;email: &quot; + user.getEmail());<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(&quot;birth date: &quot; + user.getBirthDate());<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(&quot;profession: &quot; + user.getProfession());<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;RegistrationSuccess&quot;;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</span></strong></p>

<p>We can see that this controller is designed to handle the request URL /register:</p>

<p><strong><span style="color:#0000FF;">@RequestMapping(value = &quot;/register&quot;)</span></strong><br />
&nbsp;</p>

<p>We implement two methods <strong><span style="color:#800000;">viewRegistration()</span></strong> and <span style="color:#800000;"><strong>processRegistration()</strong></span> to handle the GET and POST requests, respectively. Writing handler methods in Spring is very flexible, as we can freely choose our own method names and necessary parameters. Let&rsquo;s look at each method of the above controller class in details:</p>

<ul>
	<li>&nbsp;&nbsp;&nbsp; <strong><span style="color:#800000;">viewRegistration()</span></strong>: in this method we create a model object and put it into the model map with the key &ldquo;userForm&rdquo;:</li>
</ul>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />
<strong><span style="color:#0000FF;">&nbsp;&nbsp;&nbsp; User userForm = new User();<br />
&nbsp;&nbsp;&nbsp; model.put(&quot;userForm&quot;, userForm);</span></strong><br />
&nbsp;&nbsp; &nbsp;<br />
This creates a binding between the specified object with the form in the view returned by this method (which is the registration form). Note that the key &ldquo;userForm&rdquo; must match value of the <strong><span style="color:#800000;">commandNameattribute</span></strong> of the &lt;form:form&gt; tag.</p>

<p>Another interesting point is that we create a list of Strings and put it into the model map with the key &ldquo;professionList&rdquo;:</p>

<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />
<strong><span style="color:#0000FF;">&nbsp;&nbsp;&nbsp; List&lt;String&gt; professionList = new ArrayList&lt;&gt;();<br />
&nbsp;&nbsp;&nbsp; professionList.add(&quot;Developer&quot;);<br />
&nbsp;&nbsp;&nbsp; professionList.add(&quot;Designer&quot;);<br />
&nbsp;&nbsp;&nbsp; professionList.add(&quot;IT Manager&quot;);<br />
&nbsp;&nbsp;&nbsp; model.put(&quot;professionList&quot;, professionList);</span></strong></p>

<p><br />
&nbsp;&nbsp;&nbsp; This collection will be used by the &lt;form:select&gt; tag in the Registration.jsp page in order to render the profession dropdown list dynamically.</p>

<p>Finally this method returns a view name (&ldquo;Registration&rdquo;) which will be mapped to the registration form page above.</p>

<p>&nbsp;&nbsp; &nbsp;<strong><span style="color:#800000;">processRegistration()</span></strong>: this method handles the form submission (via POST request). The important parameter here is:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;<strong><span style="color:#0000FF;"> @ModelAttribute(&quot;userForm&quot;) User user</span></strong><br />
&nbsp;&nbsp; &nbsp;<br />
This will make the model object which is stored under the key &ldquo;userForm&rdquo; in the model map available to the method body. Again, the key &ldquo;userForm&rdquo; must match value of the <strong><span style="color:#800000;">commandNameattribute</span></strong> of the &lt;form:form&gt; tag.</p>

<p>When the form is submitted, Spring automatically binds the form&rsquo;s field values to the backing object in the model, thus we can access the form values inputted by the user through this backing object like this:<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;<strong><span style="color:#0000FF;">&nbsp; System.out.println(&quot;username: &quot; + user.getUsername());</span></strong></p>

<p>For demo purpose, this method only prints out details of the Userobject, and finally returns a view name of the success page (&ldquo;RegistrationSuccess&rdquo;).</p>

<p><br />
<strong>5. Coding Registration Success Page</strong></p>

<p><br />
Write code for the success page <strong><span style="color:#800000;">(RegistrationSuccess.jsp)</span></strong> as follows:</p>

<p>File:<strong><span style="color:#800000;"> src/main/webapp/WEB-INF/views/RegistrationSuccess.jsp</span></strong><br />
&nbsp;&nbsp; &nbsp;<br />
<strong><span style="color:#0000FF;">&lt;%@ page language=&quot;java&quot; contentType=&quot;text/html; charset=UTF-8&quot;<br />
&nbsp;&nbsp;&nbsp; pageEncoding=&quot;UTF-8&quot;%&gt;<br />
&lt;%@ taglib prefix=&quot;form&quot; uri=&quot;http://www.springframework.org/tags/form&quot;%&gt;&nbsp; &nbsp;<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD HTML 4.01 Transitional//EN&quot;<br />
&nbsp;&nbsp;&nbsp; &quot;http://www.w3.org/TR/html4/loose.dtd&quot;&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;<br />
&lt;title&gt;Registration Success&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;div align=&quot;center&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;table border=&quot;0&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;&lt;h2&gt;Registration Succeeded!&lt;/h2&gt;&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td colspan=&quot;2&quot; align=&quot;center&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;h3&gt;Thank you for registering! Here&#39;s the review of your details:&lt;/h3&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;User Name:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;${userForm.username}&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;E-mail:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;${userForm.email}&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;Birthday:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;${userForm.birthDate}&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tr&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;Profession:&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;${userForm.profession}&lt;/td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tr&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/table&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;</span></strong><br />
&nbsp;</p>

<p>This JSP page simply uses EL expressions to display values of properties of the Userobject in the model.<br />
&nbsp;</p>

<p><strong><span style="color:#0000FF;">6. Reviewing Eclipse project structure and pom.xml</span></strong></p>

<p><br />
We use Eclipse IDE and Maven to build this application so the project structure would look like this:</p>

<p><img class="one" src="resources/registro2.png" /></p>

<p><strong><span style="color:#0000FF;">Here&rsquo;s the Maven&rsquo;s pom.xml file used:<br />
&nbsp;&nbsp; &nbsp;<br />
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;<br />
&lt;project xmlns=&quot;http://maven.apache.org/POM/4.0.0&quot;<br />
&nbsp;&nbsp;&nbsp; xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;<br />
&nbsp;&nbsp;&nbsp; xsi:schemaLocation=&quot;http://maven.apache.org/POM/4.0.0<br />
&nbsp;&nbsp;&nbsp; http://maven.apache.org/xsd/maven-4.0.0.xsd&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;groupId&gt;SpringMvcFormExample&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;SpringMvcFormExample&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;version&gt;1.0&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;packaging&gt;war&lt;/packaging&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;name&gt;SpringMvcFormExample&lt;/name&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;url&gt;http://maven.apache.org&lt;/url&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;properties&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;java.version&gt;1.7&lt;/java.version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;spring.version&gt;3.2.4.RELEASE&lt;/spring.version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;cglib.version&gt;2.2.2&lt;/cglib.version&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/properties&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;dependencies&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;!-- Spring core &amp; mvc --&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;dependency&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;spring-context&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;version&gt;${spring.version}&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/dependency&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;dependency&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;groupId&gt;org.springframework&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;version&gt;${spring.version}&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/dependency&gt;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;!-- CGLib for @Configuration --&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;dependency&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;groupId&gt;cglib&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;cglib-nodep&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;version&gt;${cglib.version}&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;scope&gt;runtime&lt;/scope&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/dependency&gt;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;!-- Servlet Spec --&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;dependency&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;groupId&gt;javax.servlet&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;javax.servlet-api&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;version&gt;3.0.1&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;scope&gt;provided&lt;/scope&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/dependency&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/dependencies&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;repositories&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repository&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;id&gt;springsource-milestones&lt;/id&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;name&gt;SpringSource Milestones Proxy&lt;/name&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;url&gt;https://oss.sonatype.org/content/repositories/springsource-milestones&lt;/url&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repository&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/repositories&gt;<br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp; &lt;build&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;finalName&gt;SpringMvcFormExample&lt;/finalName&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;plugins&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;plugin&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;version&gt;2.0.2&lt;/version&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;configuration&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;source&gt;${java.version}&lt;/source&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;target&gt;${java.version}&lt;/target&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/configuration&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/plugin&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/plugins&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/build&gt;<br />
&lt;/project&gt;</span></strong></p>

<p>That indicates we are using Spring 3.2.4.RELEASE, Java 1.7 and Servlet 3.0 - the latest technologies at time of this writing.</p>

<p><br />
<strong>7. Testing the Application</strong></p>

<p>Suppose the application is deployed on Tomcat under the context path /SpringMvcFormExample, type the following URL to access the registration page:</p>

<p><strong><span style="color:#FF0000;">http://localhost:8080/SpringMvcFormExample/register</span></strong></p>

<p><br />
Enter some dummy data into the registration form as seen below:</p>

<p><img class = "one" src="/resources/images/registro3.png" /></p>

<p>Click Register button, we would see the registration success page as shown below:</p>

<p><img class="one" src="/resources/images/registro4.png" /></p>

<p>That&rsquo;s all! So far we have learnt how form handling is supported Spring MVC and built a sample application, and seen that Spring makes that really easy and flexible.</p>

<h1>&nbsp;</h1>
</body>
</html>
