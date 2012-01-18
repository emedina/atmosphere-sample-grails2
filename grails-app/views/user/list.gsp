<%@ page import="atmo.sample.User" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
  <r:require modules="atmosphere"/>
  <r:script>

    function callback(response) {
      if (response.status == 200) {
        var data = response.responseBody;
        if (data.length > 0) {
            $('#messages').append('<div class="message" role="status">'+data+'</div>');
        }
      }
    }

    var url = '${createLink(uri:'/')}atmosphere/sample';
    $.atmosphere.subscribe(url, callback, $.atmosphere.request = {transport:'streaming'});
  </r:script>


  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="messages"></div>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
  <ul>
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
  </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table>
    <thead>
    <tr>

      <g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Name')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${userInstanceList}" status="i" var="userInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "name")}</g:link></td>

      </tr>
    </g:each>
    </tbody>
  </table>

  <div class="pagination">
    <g:paginate total="${userInstanceTotal}"/>
  </div>
</div>
</body>
</html>
