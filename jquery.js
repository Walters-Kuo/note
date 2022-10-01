$("#login").click(function(e) {
    console.log( "You clicked a paragraph!" );
    e.preventDefault();
});
jQuery.validator.addMethod("pwcheck", function(value) {
    return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
        && /[a-z]/.test(value) // has a lowercase letter
        && /\d/.test(value) // has a digit
 });
$(function()
{
    /* 常用檢測屬性
       required:必填
       noSpace:空白
       minlength:最小長度
       maxlength:最大長度
       email:信箱格式
       number:數字格式
       url:網址格式https://www.minwt.com
       */        
    $('#form').validate({
        onkeyup: function(element, event) {
            var value = this.elementValue(element).replace(/^\s+/g, ""); //去除左側空白
            $(element).val(value);
        },
        rules: {
          fname: {
            required: true
          },
          phone:{
            required: true,
            minlength: 8,
            number: true
          },
          address: 'required',
          url:{
            url: true
          },
          email: {
            required: true,
            email: true
          }
        },
        messages: {
          fname: {
            required:'必填'
          },
          phone: {
            required:'必填',
            minlength:'不得少於8位',
            number:'電話需為數字'
          },
          address: '必填',
          email: {
            required:'必填',
            email:'Email格式不正確'
          },
          url:'網址格式不正確'
        },
        submitHandler: function(form) {
          form.submit();
        }
  });


});