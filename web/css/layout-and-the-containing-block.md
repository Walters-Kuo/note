#position:

當一個元素使用 position: absolute 屬性時，它會從正常的文件流中移除，這意味著它不再佔據文檔中的空間，並且對於其他元素來說，就像不存在一樣。這也就是說，這個元素會跳脫出 HTML 標籤的正常佈局流程。

1. 移除正常文件流：
  * 在正常的文件流中，HTML 元素會按順序從上到下、從左到右排列，並且會彼此影響它們的佈局。例如，一個 div 元素會在前一個 div 元素下面，並且會推動後面的元素往下排列。
  * 當一個元素被設置為 position: absolute 時，它會脫離這種排列方式，不再影響或被影響周圍的元素。其他元素會按照它們原來的位置排列，就好像這個絕對定位的元素不存在一樣。
2. 相對於最近的定位祖先：
  * 被設置為 position: absolute 的元素，其位置是相對於最近的已定位的祖先元素來決定的。所謂「已定位的祖先」是指這個祖先元素有 position 屬性且其值為 relative、absolute、fixed 或 sticky。
  * 如果找不到這樣的祖先元素，那麼這個絕對定位的元素就會相對於初始包含塊（通常是 html 或 body 元素）進行定位。

3. 位置的決定：
  * 絕對定位元素的最終位置由 top、right、bottom 和 left 屬性決定。這些屬性指定了元素相對於其包含塊（即最近的定位祖先或初始包含塊）的距離。
 
~~~
for example
<!DOCTYPE html>
<html>
<head>
    <style>
        .container {
            position: relative;
            width: 300px;
            height: 300px;
            background-color: lightblue;
        }

        .absolute-box {
            position: absolute;
            top: 50px;
            left: 50px;
            width: 100px;
            height: 100px;
            background-color: lightcoral;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="absolute-box"></div>
</div>

</body>
</html>
~~~
在這個例子中：

	•	container 元素有 position: relative 屬性，成為 .absolute-box 的定位祖先。
	•	.absolute-box 元素有 position: absolute 屬性，從正常文檔流中移除並相對於 .container 定位。
	•	.absolute-box 會在 .container 的左上角 (50px, 50px) 位置顯示。

透過這個示例可以看到，設置為 position: absolute 的元素不再佔據正常文檔流中的空間，但其位置可以通過 top、left 等屬性精確控制。

position:
static: 靜態定位, html預設值, 根據 html 佈局 but top, right, bottom, left, and z-index 屬性無效,
fixed: 固定定位　
relative: 相對定位
absolute: 絕對定位，會將元素轉成 block, 該元素將從正常文件流中刪除，並且不會在頁面佈局中為該元素建立空間。該元素相對於其最近定位的祖先（如果有）或初始包含區塊進行定位。它的最終位置由top、right、bottom、left的值決定
包含块是最近的 position 属性不为 static 的 祖先元素。这里的祖先元素可以是块元素，也可以是行内元素