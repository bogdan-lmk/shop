<!DOCTYPE html>
<html {if $language->href_lang}lang="{$language->href_lang|escape}"{/if} prefix="og: http://ogp.me/ns#">
<head>
    {* Full base address *}
    <base href="{$config->root_url}/">

    {* Meta data *}
    {include "head.tpl"}

    {* Favicon *}
    <link href="design/{$settings->theme}/images/favicon.png" type="image/x-icon" rel="icon">
    <link href="design/{$settings->theme}/images/favicon.png" type="image/x-icon" rel="shortcut icon">

    {* JQuery *}
    <script src="design/{$settings->theme}/js/jquery-2.1.4.min.js{if $js_version}?v={$js_version}{/if}"></script>

    {* Slick slider *}
    <script src="design/{$settings->theme}/js/slick.min.js{if $js_version}?v={$js_version}{/if}"></script>

    {* Match height *}
    <script src="design/{$settings->theme}/js/jquery.matchHeight-min.js{if $js_version}?v={$js_version}{/if}"></script>

    {* Fonts *}
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i&amp;subset=cyrillic" rel="stylesheet">

    {* CSS *}
    <link href="design/{$settings->theme|escape}/css/main.css{if $css_version}?v={$css_version}{/if}" rel="stylesheet">
    {if $counters['head']}
        {foreach $counters['head'] as $counter}
            {$counter->code}
        {/foreach}
    {/if}

    {if $settings->captcha_type == "v2"}
        <script type="text/javascript">
            var onloadCallback = function() {
                mysitekey = "{$settings->public_recaptcha}";
                if($('#recaptcha1').size()>0){
                    grecaptcha.render('recaptcha1', {
                        'sitekey' : mysitekey
                    });
                }
                if($('#recaptcha2').size()>0){
                    grecaptcha.render('recaptcha2', {
                        'sitekey' : mysitekey
                    });
                }
            };
        </script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    {elseif $settings->captcha_type == "invisible"}
        <script>
            function onSubmit(token) {
                document.getElementById("captcha_id").submit();
            }
            function onSubmitCallback(token) {
                document.getElementById("fn_callback").submit();
            }
            function onSubmitBlog(token) {
                document.getElementById("fn_blog_comment").submit();
            }
        </script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
    {/if}

</head>

<body class="index-page">
  <div class="wrapper">
    <div class="content">
      <div class="overlay-body"></div>
{if $counters['body_top']}
    {foreach $counters['body_top'] as $counter}
        {$counter->code}
    {/foreach}
{/if}

<header class="header">
      <div class="container">
        <div class="content-row content-row--header">
            <div class="logo logo--header">
        {* Logo *}
        <a class="home-link" href="{if $smarty.get.module=='MainView'}javascript:;{else}{$lang_link}{/if}">
            <img class="img-logo img-logo--header"src="design/{$settings->theme|escape}/images/logo-head.png" alt="{$settings->site_name|escape}"/>
        </a>
        {*Если вам нужно загружать разные логотипы на разных языках, закомментируйте код выше, и пользуйтесь кодом ниже*}
        {*<a class="logo" href="{$lang_link}">
            <img src="design/{$settings->theme|escape}/images/logo{if $language->label}_{$language->label}{/if}.png" alt="{$settings->site_name|escape}"/>
        </a>*}
            </div>
            <a class="contact-link contact-link--header" href="tel:{$lang->company_phone_1}" data-language="company_phone_1" >{$lang->company_phone_1}</a>

            <a class="contact-link contact-link--header" href="tel:{$lang->company_phone_2}"  >{$lang->company_address}</a>
          <div class="mobile-menu-icon-wrap">
            <svg class="icon icon-menu ">
              <use xlink:href="/design/{$settings->theme}/img/svg/symbol/sprite.svg#menu"></use>
            </svg>
            <svg class="icon icon-close-menu ">
              <use xlink:href="/design/{$settings->theme}/img/svg/symbol/sprite.svg#close-menu"></use>
            </svg>
          </div>
          <div class="button-wrap"><a class="btn btn-request-call btn-request-call--white" data-button-call="1"> Заказать звонок</a></div>
            <div id="cart_informer" data-button-basket="1">
                {include file='cart_informer.tpl'}
            </div>
        </div>
    </div>
            <!-- <div class="categories">
                {* Catalog heading *}
                <div class="categories_heading fn_switch">
                    {include file="svg.tpl" svgId="menu_icon"}
                    <span class="small-hidden" data-language="index_categories">{$lang->index_categories}</span>
                </div>

                {include file="categories.tpl"}
            </div>
        </div>
    </div> -->
</header>
<nav class="navigation">
  <div class="container">
    {* Main menu *}
    {*<div class="content-row content-row--navigation ">
        {foreach $pages as $p}
            {if $p->menu_id == 1}
                <li class="menu_item">
                    <a class="menu_link" data-page="{$p->id}" href="{$lang_link}{$p->url}">{$p->name|escape}</a>
                </li>
            {/if}
        {/foreach}
    </div>*}
    {$menu_header}
  </div>
  <div class="button-wrap button-wrap--mobile">
    <div class="container">
      <a class="btn btn-request-call btn--mobile btn--black" data-button-call="1"> Заказать звонок</a></div>
  </div>
</nav>
{* Тело сайта *}


    {if $module == "MainView" || $page->url == '404'}
        <div class="fn_ajax_content">
            {$content}
        </div>
    {else}
            {include file='breadcrumb.tpl'}
            <div class="fn_ajax_content">
                {$content}
            </div>
    {/if}

<!-- <div class="to_top"></div> -->

{* Footer *}
<footer class="footer">
  <div class="container">
    <div class="content-row content-row--footer align-items-center justify-content-between">
      <div class="logo"><a class="home-link" href={if $smarty.get.module=='MainView'}javascript:;{else}{$lang_link}{/if}><img src="design/{$settings->theme|escape}/images/logo-footer.png"></a></div>
      <a class="contact-link contact-link--footer" href="tel:{$lang->company_phone_1}">{$lang->company_phone_1}</a>
      <a class="contact-link contact-link--footer" href="/">{$lang->company_address}</a>
      <a class="contact-link contact-link--footer" href="/">{$lang->company_email} </a>
      <div class="button-wrap"><a class="btn btn-request-call btn-request-call--black btn-footer" data-button-call="1">Заказать звонок</a><a class="btn btn-request-call btn--mobile btn--white" data-button-call="1"> Заказать звонок</a></div>
    </div>
  </div>
</footer>


{* <footer class="footer"> *}
    {* <div class="footer_top">
        <div class="container">
            <span class="payments_text tablet-hidden" data-language="index_payments">{$lang->index_payments}</span>
            <div class="footer_payment">
                <img src="design/{$settings->theme}/images/payments.png" alt="visa" title="visa">
            </div>
        </div>
    </div>
    <div class="footer_bottom">
        <div class="container">
            <div class="row">
                <div class="foot col-sm-6 col-lg-4"> *}
                    {* Social buttons *}
                    {* <div class="h3">
                        <span data-language="index_in_networks">{$lang->index_in_networks}</span>
                    </div>

                    <div class="foot_social">
                        <a class="fb" href="https://facebook.com/okaycms" target="_blank" title="Facebook"></a>
                        <a class="vk" href="https://vk.com/club72497645" target="_blank" title="В контакте"></a>
                        <a class="ok" href="{preg_replace('/^(.+)\/$/', '$1', $lang_link)}#" target="_blank" title="Одноклассники"></a>
                        <a class="tw" href="https://twitter.com/okaycms" target="_blank" title="Twitter"></a>
                        <a class="ins" href="{preg_replace('/^(.+)\/$/', '$1', $lang_link)}#" target="_blank"  title="Instagram"></a>
                    </div>

                </div> *}

                {* Main menu *}
                {* <div class="foot col-sm-6 col-lg-2">
                    <div class="h3">
                        <span data-language="index_about_store">{$lang->index_about_store}</span>
                    </div>

                    <div class="foot_menu"> *}
                        {*foreach $pages as $p}
                            {if $p->menu_id == 1}
                                <div class="foot_item">
                                    <a href="{$lang_link}{$p->url}">{$p->name|escape}</a>
                                </div>
                            {/if}
                        {/foreach*}
                        {* {$menu_footer}
                    </div>
                </div> *}

                {* Categories menu *}
                {* <div class="foot col-sm-6 col-lg-3">
                    <div class="h3">
                        <span data-language="index_categories">{$lang->index_categories}</span>
                    </div>

                    <div class="foot_menu">
                        {foreach $categories as $c}
                            {if $c->visible}
                                <div class="foot_item">
                                    <a  href="{$lang_link}catalog/{$c->url}">{$c->name|escape}</a>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                </div> *}

                {* Contacts *}
                {* <div class="foot col-sm-6 col-lg-3">
                    <div class="h3">
                        <span data-language="index_contacts">{$lang->index_contacts}</span>
                    </div>

                    <div class="footer_contacts">
                        <div class="foot_item">
                            <a href="tel:{$lang->company_phone_1}" data-language="company_phone_1" >{$lang->company_phone_1}</a>
                        </div>
                        <div class="foot_item">
                            <a href="tel:{$lang->company_phone_2}" data-language="company_phone_2" >{$lang->order_address}</a>
                        </div>
                        <div class="foot_item">
                            <span data-language="company_email">{$lang->company_email}</span>
                        </div>
                    </div>
                </div>

            </div> *}

            {* Copyright *}
{* </footer> *}
<div class="copyright">
    <span class="copyright-link">2009-{$smarty.now|date_format:"%Y"}</span>
    <a href="http://okay-cms.com" target="_blank">
        <span class="copyright-link" data-language="index_copyright">{$lang->index_copyright}</span>
    </a>
  </div>
</div>
</div>
{include file='cart.tpl'}
{*template scripts*}
{* JQuery UI *}
{* Библиотека с "Slider", "Transfer Effect" *}
<script src="design/{$settings->theme}/js/jquery-ui.min.js{if $js_version}?v={$js_version}{/if}"></script>

{* Fancybox *}
<link href="design/{$settings->theme|escape}/css/jquery.fancybox.min.css{if $css_version}?v={$css_version}{/if}" rel="stylesheet">
<script src="design/{$settings->theme|escape}/js/jquery.fancybox.min.js{if $js_version}?v={$js_version}{/if}" defer></script>

{* Autocomplete *}
<script src="design/{$settings->theme}/js/jquery.autocomplete-min.js{if $js_version}?v={$js_version}{/if}" defer></script>

{* Admin tooltips *}
{if $smarty.session.admin}
    <script>lang_id = {$language->id}</script>
    <script src ="backend/design/js/admintooltip/admintooltip.js{if $js_version}?v={$js_version}{/if}"></script>
    <link href="backend/design/js/admintooltip/styles/admin.css{if $css_version}?v={$css_version}{/if}" rel="stylesheet">
{/if}

{*JQuery Validation*}
<script src="design/{$settings->theme}/js/jquery.validate.min.js{if $js_version}?v={$js_version}{/if}" ></script>
<script src="design/{$settings->theme}/js/additional-methods.min.js{if $js_version}?v={$js_version}{/if}"></script>

{* Social share buttons *}
{if $smarty.get.module == 'ProductView' || $smarty.get.module == "BlogView"}

    <link href="design/{$settings->theme|escape}/css/jssocials.css{if $css_version}?v={$css_version}{/if}" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/jssocials-theme-flat.css{if $css_version}?v={$css_version}{/if}" rel="stylesheet">
    <script src="design/{$settings->theme|escape}/js/jssocials.min.js{if $js_version}?v={$js_version}{/if}" ></script>
{/if}

{* Okay *}
{include file="scripts.tpl"}
<script src="design/{$settings->theme}/js/okay.js{if $js_version}?v={$js_version}{/if}"></script>
{*template scripts*}
<script src="design/{$settings->theme}/js/main.js{if $js_version}?v={$js_version}{/if}"></script>
{if $counters['body_bottom']}
    {foreach $counters['body_bottom'] as $counter}
        {$counter->code}
    {/foreach}
{/if}
  </div>
    </div>
</body>
</html>
