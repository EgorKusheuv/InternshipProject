<#include "security.ftl">

<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Имя пользователя :</label>
        <div class="col-sm-4">
            <input type="text" name="username" class="form-control" placeholder=" " />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль :</label>
        <div class="col-sm-4">
            <input type="password" name="password" class="form-control" placeholder=" " />
        </div>
    </div>
    <#if isRegisterForm>
    <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control" placeholder="(Необязательно)" />
         </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/sign">Зарегистрироваться</a></#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit"><#if user??>Выйти<#else>Войти</#if></button>
</form>
</#macro>