<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l >

<@c.page>
<div>
  <@l.logout />
  <span><a href = "/user">Список пользователей</a></span>
</div>
<div>
    <form method = "post" enctype = "multipart/form-data">
        <input type = "hidden" name = "_csrf" value = "${_csrf.token}" />
        <input type = "text" name = "text" placeholder="Текст поста" />
        <input type = "text" name = "tag" placeholder="Ключевое слово" >
        <input type = "file" name = "file">
        <button type = "submit">Запостить</button>

    </form>
</div>

<div>Список постов</div>
<form method = "get" action = "/main">
      <input type = "text" name = "filter" value="${filter!""}">
      <button type = "submit">Поиск по ключевому слову</button>
</form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        "<strong>${message.authorName}:</strong>"
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <div>
           <#if message.filename??>
                <img src = "/img/${message.filename}">
           </#if>
        </div>
    </div>
<#else>
Нет постов
</#list>

</@c.page>