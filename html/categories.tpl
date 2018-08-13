<div class="drop-menu-body">
    {function name=categories_tree}
        {if $categories}
            <ul class="level_{$level} {if $level == 1}categories_menu {else}subcategory drop-menu-body-content  {/if}">
                {foreach $categories as $c}
                    {if $c->visible}
                        {if $c->subcategories && $c->has_children_visible}
                            <div class="category_item has_child drop-menu-body ">
                              <div class="drop-menu-body-name ">
                                {if $c->image} <img class="icon icon-women-ugg drop-menu-body-icon" src="../files/categories/{$c->image}">{/if}
                                {* <a class="category_link{if $category->id == $c->id} selected{/if}" href="{$lang_link}catalog/{$c->url}" data-category="{$c->id}"> *}
                                    <span class="drop-menu-body-heading">{$c->name|escape}</span>
                                {* </a> *}
                                </div>
                                <i class="fn_switch cat_switch lg-hidden"></i>
                                {categories_tree categories=$c->subcategories level=$level + 1}
                            </div>
                        {else}
                            <div  class="category_item drop-link-row">
                                <a class="drop-link category_link{if $category->id == $c->id} selected{/if}" href="{$lang_link}catalog/{$c->url}" data-category="{$c->id}">{$c->name|escape}</a>
                                <svg class="icon icon-chevron-right drop-link-icon">
                                  <use xlink:href="/design/{$settings->theme}/img/svg/symbol/sprite.svg#chevron-right">
                                </svg>
                            </div >
                        {/if}
                    {/if}
                {/foreach}
            </ul>
        {/if}
    {/function}
    {categories_tree categories=$categories level=1}
</div>
