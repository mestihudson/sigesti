<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <img src="\${resource(dir:'images/icons', file:'home_32.png')}"><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <img src="\${resource(dir:'images/icons', file:'list.png')}"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
            <img src="\${resource(dir:'images/icons', file:'add.png')}"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="body">
            <!--<h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
            <g:if test="\${flash.message}">
            <div class="message canhide">
							\${flash.message}
						</div>
            </g:if>
            <div class="dialog">
							<table id="myTable" class="tableview">
								<tbody>
								<%  excludedProps = Event.allEvents.toList() << 'version'
										allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
										props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
										Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
										props.each { p -> %>
										<tr class="prop odd">
											<td class="name"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></td>
											<%  if (p.isEnum()) { %>
											<td class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
											<%  } else if (p.oneToMany || p.manyToMany) { %>
											<td class="value">
												<ul>
													<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
														<li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
													</g:each>
												</ul>
											</td>
											<%  } else if (p.manyToOne || p.oneToOne) { %>
											<td class="value"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
											<%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
											<td class="value"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
											<%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
											<td class="value"><g:formatDate date="\${${propertyName}?.${p.name}}" /></td>
											<%  } else if(!p.type.isArray()) { %>
											<td class="value">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
											<%  } %>
										</tr>
								<%  } %>
								</tbody>
							</table>
            </div>
            <div class="buttons">
                <g:form>
										<g:hiddenField name="id" value="\${${propertyName}?.id}" />
										<g:actionSubmit class="button-edit" action="edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}" />
										<g:actionSubmit class="button-delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
            </div>
        </div>
    </body>
</html>
