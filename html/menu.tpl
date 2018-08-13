{if $menu_items}
    <div class="content-row content-row--navigation">
        {function name=menu_items_tree}
            {if $menu_items}
                    {foreach $menu_items as $item}
                        {if $item->visible == 1}
                            <li class="nav-list nav-list--main">
                                <a class="nav-link nav-link--main" href="{if $item->url}{$item->url}{else}javascript:;{/if}" {if !$item->submenus && $item->is_target_blank}target="_blank"{/if}>
                                    <span>{$item->name|escape}</span>
                                 </a>
                                {menu_items_tree menu_items=$item->submenus level=$level + 1}
                            </li>
                        {/if}
                    {/foreach}
            {/if}
        {/function}
        {menu_items_tree menu_items=$menu_items level=1}
    </div>
{/if}
