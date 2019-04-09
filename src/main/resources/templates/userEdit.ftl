<#import "parts/common.ftl" as c>

<@c.page>
    <div class="mb-5">
        <h3>User editor</h3>
    </div>
    <form action="/user" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name:</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"
                       name="username" value="${user.username}">
            </div>
        </div>
        <div class="form-group row">
            <#list roles as role>
                <div class="custom-control custom-checkbox ml-3">
                    <input type="checkbox"
                           class="custom-control-input"
                           name="${role}" id="checkUser"
                            ${user.roles?seq_contains(role)
                            ?string("checked", "")}>
                    <label class="custom-control-label" for="checkUser">
                        ${role}
                    </label>
                </div>
            </#list>
        </div>
        <input type="hidden" name="userId" value="${user.id}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <button type="submit" class="btn btn-info">Сохранить</button>
        </div>
    </form>
</@c.page>