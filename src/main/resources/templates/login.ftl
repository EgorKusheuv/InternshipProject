<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l >

<@c.page>
Пожалуйста,авторизируйтесь:
<@l.login "/login" />
<a href="/sign">Зарегистрироваться</a>

</@c.page>