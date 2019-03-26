<#import "parts/common.ftl" as c>
<#import "parts/logout.ftl" as l>

<@c.page>
    <div>
        <@l.logout/>
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" action="/main" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Сообщение">
            <input type="text" name="tag" placeholder="Тэг">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>
        <form method="get">
            <input type="text" name="filter"
                   placeholder="Фильтр по тэгу" value="${filter!}">
            <button type="submit">Найти</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
        <#else >
        No message
    </#list>
</@c.page>