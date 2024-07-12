#id {}
.class {}
element.class {}

三種 CSS 引用方式(@import 極少用，因為 import 會在 HTML 載入後再加載 css，用戶體驗不好)
external stylesheet 外部樣式 <link rel="stylesheet" type="text/css" href="styles.css">

**用途**：
共有樣式 internal stylesheet 內部樣式 <head><style>
p {
    color: blue;
    font-size: 18px;
}
</style></head>

**用途**：個別頁面會用到的樣式
inline stylesheet 行內樣式
<p style="color: red; font-size: 16px;">這是一段紅色文字</p>

**用途**：對於只出現一兩次且修改幅度小的樣式修改
the box model(padding, margin, board 不俱備繼承性) width and weight margin boarder padding 俱備繼承性有三類 文字相關: font-family,
font-size,
font-style,
font-weight,
font,
line-height,
text-align,
text-indent,
word-space 列表相關: list-style,
list-style-position,
list-style-type,
list-style 顏色相關: color

樣式衝突常見五種
引用方式衝突 比重 inline>(internal=external)
繼承方式衝突 離最近的 parent 獲勝
指定樣式衝突 (當前元素發生衝突，指的是 HTML 標籤元素, 並不能用於繼承樣式) inline 1000>id 100>class 10>tag 1 (least important)
繼承樣式和指定樣式衝突 指定樣式獲勝 !important margin,

padding 順時針
/*四個值，個別指定*/
margin: 上 右 下 左;

/*三個值，左右採用同一個值，上下則分開指定*/
margin: 上 [右左] 下;

/*二個值，【上下】採用同一值，【左右】採用同一值*/
margin: [上下] [右左];

/*一個值，【上下左右】都使用相同的值*/
margin: [上右下左];

linear 線性 gradient 坡度 linear-gradient 線性漸變 display:none(元素隱藏不占據原來位置) vs visibility:hidden(元素隱藏但占據原來位置)

<ul>unordered list
<ol>ordered list
<li>list item

inline 文字、圖片相關 <a>, <img>, <span>, <input>, <select>, <button>, <textarea>, <label>
block 排版相關 tag <div>, <video>, <h1~h6>, <p>, <form>,<hr>, <ol>, <ul>, <li>
inline-block
text-align 對文字、inline, inline-block 會起作用，block 則無

當一個元素定義了 float 就會變成 block而且可以使用 margin-left 或 margin-right 定義 與其他元素之間的間距

block 可以定義 width、height、padding 和 margin

###vertical-align###
inline, inline-block 的 vertical-align 會對周圍的元素起作用
table-cell 的 vertical-align 是對自身而言

textarea {
  resize:none;
  max-width:;
  max-height:;
  overflow:auto;
}

屬性書寫順序
| 屬性 | 列舉 |
|:-------------|:--------------:|
| 布局      | display、position、float、clear |
| box model | width、height、padding、margin、border、overflow |
| 文字屬性   | font、line-height、text-align、text-indent、vertical-align |
| 裝飾屬性   | color、background-color、opacity、cursor  |
| other     | content、list-style、quotes |


solid 實心線, dashed 虛線
清除浮動
clear:both, overflow:hidden, ::after

position: fixed, relative, absolute, static
absolute 會將元素轉成 block

transparent a.透明的；清澈的
skew a.斜的，歪的，偏的

border-width, border-style, border-color 簡化 border:1px solid red;
