<#include "security.ftl">
<#list messages as message>


    <div class="card my-3" style = "width: 24rem;">


        <div class="m-2">
            <ins>${message.title}</ins><br/>
            <span>${message.text}</span><br/>

        </div>
        <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
        <i>#${message.tag}</i>
        </div>
        <div class="card-footer text-muted">
           <a href = "/user-messages/${message.author.id}">${message.authorName}</a>
           <#if message.author.id == currentUserId>
           <a class="btn btn-primary" href = "/user-messages/${message.author.id}?message=${message.id}">
           Редактировать
</a>
           </#if>
        </div>
    </div>
    <#else>
    Нет постов
    </#list>
    </div>