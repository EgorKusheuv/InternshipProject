<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l >

<@c.page>
Регистрация
${message?ifExists}
<@l.login "/sign" true/>
</@c.page>