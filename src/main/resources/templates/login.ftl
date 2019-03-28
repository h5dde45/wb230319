<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/login" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name:</label>
            <div class="col-sm-6">
                <input class="form-control" type="text"
                       name="username" placeholder="User name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password:</label>
            <div class="col-sm-6">
                <input class="form-control" type="password"
                       name="password" placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <a href="/registration" class="btn btn-success mr-1">Add user</a>
        <button type="submit" class="btn btn-info">Sign In</button>
    </form>
</@c.page>