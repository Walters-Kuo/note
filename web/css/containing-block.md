#containing block 包含塊  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元素的大小和位置通常受其包含塊的影響。大多數情況下，包含塊是元素最接近的塊級祖先的內容區域，但情況並非總是如此。在本文中，我們將研究確定元素包含塊的因素。
當使用者代理（如瀏覽器）對文檔進行佈局時，它會為每個元素生成一個框。每個盒子分為四個區域：

1. Content area 內容區
2.  Padding area 填充區域
3. Border area 邊境地區
4. Margin area 邊距區域

![Alt Image Text](./box-model.png "Optional Title")

許多開發人員認為元素的包含塊始終是其父元素的內容區域，但事實並非如此。讓我們研究一下決定一個元素的包含塊的因素是什麼。

在了解是什麼決定了元素的包含塊之前，首先瞭解它為什麼重要是很有用的。元素的大小和位置通常受其包含塊的影響。應用於絕對定位元素（即，其 position 設置為 absolute 或 fixed ）的 width 、 height padding 、 margin 、 和 偏移屬性的百分比值是從元素的包含塊計算得出的。

標識包含塊的過程完全取決於元素 position 屬性的值：

1. 如果 position 屬性為 static 、 relative 或 sticky ，則包含塊由最接近的祖先元素的內容框的邊緣組成，該元素要麼是塊容器（如內聯塊、塊或清單項元素），要麼是建立格式設置上下文（如表容器、flex 容器、網格容器或塊容器本身）。
2. 如果 position 屬性為 absolute ，則包含塊由值 position 不是 static （ fixed ， ， absolute relative 或 sticky ） 的最近祖先元素的填充框的邊緣組成。
3. 如果 position 屬性為 fixed ，則包含塊由視口（對於連續媒體）或頁面區域（對於分頁媒體）建立。
4. 如果 position 屬性為 absolute 或 fixed ，則包含塊也可以由具有以下任何一項的最近祖先元素的填充框的邊緣形成：

* transform 或 perspective 值 none
* will-change 的值是 transform 或 perspective
* filter 的值不是 none 或 will-change 的值是 filter（僅適用於 Firefox）
* contain 值、 layout paint 或 strict content （例如 contain: paint; ）
* container-type 除 normal
* 除 none （例如）之外的 backdrop-filter: blur(10px); backdrop-filter

> 註： 根元素 （ <html> ） 所在的包含塊是一個稱為初始包含塊的矩形。它具有視口（對於連續媒體）或頁面區域（對於分頁媒體）的尺寸

> 注意：瀏覽器與 perspective 包含塊形成不一致並 filter 導致其原因。
