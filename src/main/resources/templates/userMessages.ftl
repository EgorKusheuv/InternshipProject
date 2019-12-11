<#import "parts/common.ftl" as c>

<@c.page>
<h5>Посты пользователя</h5>
<#if isCurrentUser>
    <#include "parts/messageEdit.ftl" />
</#if>
<#include "parts/messageList.ftl" />
</@c.page>