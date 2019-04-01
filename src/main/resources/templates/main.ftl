<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" class="form-inline">
                <input type="text" name="filter" class="form-control mr-2"
                       placeholder="Фильтр по тэгу" value="${filter!}">
                <button class="btn btn-primary" type="submit">Найти</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample"
       role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить сообщение
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="/main" enctype="multipart/form-data">
                <input type="text" class="form-control mt-3" name="text" placeholder="Сообщение">
                <input type="text" class="form-control mt-3" name="tag" placeholder="Тэг">
                <div class="custom-file  mt-3">
                    <input type="file" class="custom-file-input" id="customFile" name="file">
                    <label class="custom-file-label" for="customFile">Выбор файла</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button class="btn btn-info  mt-3" type="submit">Добавить</button>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    <strong>${message.authorName}</strong>
                </div>
            </div>
        <#else >
            No message
        </#list>
    </div>
</@c.page>