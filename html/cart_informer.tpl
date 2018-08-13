{* Cart informer (given by Ajax) *}
{if $cart->total_products > 0}
    <div  class="cart_info basket-wrap" data-button-basket="1">
      <svg class="icon icon-basket ">
        <use xlink:href="/design/{$settings->theme}/img/svg/symbol/sprite.svg#basket"></use>
        <span class="cart_counter items-amount">{$cart->total_products}</span>
        <!-- <span class="cart_title" data-language="index_cart">{$lang->index_cart}</span> -->
        <!-- <span class="cart_total">{($cart->total_price)|convert} {$currency->sign|escape}</span> -->
    </div >
{else}
    <div class="cart_info  basket-wrap" data-button-basket="1">
      <svg class="icon icon-basket ">
        <use xlink:href="/design/{$settings->theme}/img/svg/symbol/sprite.svg#basket"></use>
        <span class="cart_counter items-amount">{$cart->total_products}</span>
        <!-- <span class="cart_title" data-language="index_cart">{$lang->index_cart}</span> -->
        <!-- <span class="cart_total">{($cart->total_price)|convert} {$currency->sign|escape}</span> -->
    </div>
{/if}
