<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body style="background: darkgray">
<div>
    <form method="post">
        <input type="text" name="text" placeholder="Сообщение">
        <input type="text" name="tag" placeholder="Тэг">
        <button type="submit">Добавить</button>
    </form>
</div>
<div>
    <form method="post" action="filter">
        <input type="text" name="filter" placeholder="Фильтр по тэгу">
        <button type="submit">Найти</button>
    </form>
</div>
<div>Список сообщений</div>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
    </div>
</#list>
</body>
</html>