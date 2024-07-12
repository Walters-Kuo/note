以下是各種 CSS 選擇器及其權重的說明和用法：

優先等級高的樣式覆蓋優先等級低的樣式
同一優先等級的樣式，後定義的 覆蓋 先定義的，即 "後來居上" 原則

CSS selector specificity
- Universal selector: 0
- Pseudo-element: 1
- Element selector: 1
- Class selector: 10
- Pseudo-class: 10
- Attribute selector: 10
- ID selector: 100
- Inline style: 1000

### 1. 通配符 (Universal Selector)
**權重**：0
**用法**：通配符選擇器選擇所有元素
**用途**：
- **全局重置**：用於全局重置樣式，通常用於清除所有元素的默認邊距和內距

**範例**：
```css
* {
    margin: 0;
    padding: 0;
}
```

### 2. 伪元素 (Pseudo-element)
**權重**：1
**用法**：
伪元素選擇器用於選擇元素的一部分，例如選擇首字母或首行。
::before
::after
::first-letter
::first-line
**用途**：
- **文本修飾**：用於修飾文本的特定部分，如首行、首字母
- **添加內容**：可以用來在元素之前或之後插入內容
- 
**範例**：
```css
p::first-line {
    font-weight: bold;
}

p::before {
    content: "Note: ";
    color: red;
}
```

### 3. 元素選擇器 (Element Selector)
**權重**：1
**用法**：元素選擇器選擇指定的 HTML 標籤元素
**用途**：
- **基本樣式**：用於為特定標籤元素設置基本樣式
- 
**範例**：
```css
p {
    color: blue;
}
```

### 4. 類選擇器 (Class Selector)
**權重**：10
**用法**：類選擇器選擇具有特定類屬性的元素
**用途**：
- **重複使用**：用於多個元素共享相同的樣式，便於重複使用
- 
**範例**：
```css
.my-class {
    font-size: 14px;
}
```

### 5. 伪类 (Pseudo-class)
**權重**：10
**用法**：伪類選擇器用於選擇特定狀態的元素
hover
:first-child
**用途**：
- **互動效果**：用於設置元素在特定狀態（如懸停、訪問過）下的樣式
- 
**範例**：
```css
a:hover {
    color: red;
}
```

### 6. 屬性選擇器 (Attribute Selector)
**權重**：10
**用法**：屬性選擇器選擇具有特定屬性的元素
**用途**：
- **表單樣式**：常用於根據表單元素的屬性設置樣式
- 
**範例**：
```css
input[type="text"] {
    border: 1px solid #000;
}
```

### 7. ID 選擇器 (ID Selector)
**權重**：100
**用法**：ID 選擇器選擇具有特定 ID 屬性的元素
**用途**：
- **唯一標識**：用於唯一標識單個元素，樣式具有高優先級
- 
**範例**：
```css
#my-id {
    background-color: yellow;
}
```

### 8. 行內樣式 (Inline Style)
**權重**：1000
**用法**：行內樣式直接在 HTML 標籤的 `style` 屬性中設置樣式
**用途**：
- **臨時調整**：用於臨時、一次性的樣式調整，具有最高優先級
- 
**範例**：
```html
<p style="color: green;">這是一段文字</p>
```

### 總結
CSS 選擇器的權重決定了當多個選擇器作用於同一元素時，哪個樣式規則最終會生效。權重越高，優先級越高。行內樣式權重最高，通配符權重最低。理解這些選擇器的用法及其權重有助於更有效地管理和應用樣式。

CSS 組合選擇器 
後代選擇器 (Descendant combinator) M N {}
    範例: div span 套用所有 <div> 元素內部的所有 <span> 元素
子代選擇器 (Child combinator) M > N {}
    範例: ul > li 套用所有 <li> 元素內部的 <ul> 子元素
一般兄弟選擇器 (General sibling combinator) M ~ N {}
    這意味著第二個元素緊跟著第一個元素（儘管不一定緊隨其後），並且兩者共享相同的父元素(同一層)
    範例: p ~ span 套用所有與 <p> 同一層且之後的 <span> 元素，之前的或是在 <p> 底下的 <span> 元素不包括在內
相鄰兄弟選擇器 (Adjacent sibling combinator) M + N {}
    範例: h2 + p 套用所有 緊接在 <h2> 元素後的 <p> 元素，並擁有 <h2> 的父元素
列組合器 (column combinator) M || N {}
    範例: col || td 將匹配屬於 <col> 範圍的所有 <td> 元