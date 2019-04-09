<#import "parts/common.ftl" as c>

<@c.page>
    List users
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>#</th>
        </tr>
        </thead>
        <body>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td>
                    <#list user.roles as role>
                        ${role}<#sep>,
                    </#list>
                </td>
                <td><a href="/user/${user.id}">Edit</a></td>
            </tr>
        </#list>
        </body>
    </table>
</@c.page>