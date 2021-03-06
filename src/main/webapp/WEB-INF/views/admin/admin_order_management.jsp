<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>樱诺商城-公告管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/bootstrap-table-1.15.1/bootstrap-table.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/font-awesome-4.7.0/css/font-awesome.min.css" >
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>

    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .clear{
            clear: both;
        }
        a,a:hover{
            text-decoration: none;
        }
        .text-bold{
            font-weight: bold;
        }
        .color-blue{
            color: #13DAFE;
        }
        .text-purple {
            color: #6164c1;
        }
        .active{
            background-color: #13DAFE !important;
            color: white !important;
        }
        body{
            background-color: #EAECF2;
        }

        .nav-top {
            padding: 0 16px 0 0;
            background-color: white;
            box-shadow:0 15px 10px -15px #ccc;
        }
        .nav-top .top-left-part{
            width: 220px;
            float: left;
            line-height: 56px;
            background: #3a3f51;
            padding-left: 16px;
        }
        .top-left-part .logo{
            color: white;
            font-size: 16px;
        }
        .nav-top .navbar-nav{
            position: absolute;
            right: 0;
            padding-right: 25px;
        }
        .navbar-nav .admin-btn:hover{
            background-color: #E5E5E5;
            border-radius: 50px;
        }
        .nav-top .navbar-nav img{
            border-radius: 50%;
            width: 36px;
            height: 36px;
            margin-top: 3px;
        }
        .nav-top .navbar-nav a{
            color: black;
            font-weight: bold;
        }

        .nav-left {
            width: 220px;
            height: 100vh;
            background-color: #3A3F51;
            color: #575B6A;
            position: fixed;
            left: 0;
            top: 56px;
        }
        .nav-left .nav-left-ul{

        }
        .nav-left-ul .nav-left-item{
            color: rgba(255, 255, 255, .4);
            height: 56px;
            padding-left: 16px;
        }
        .nav-left-ul .nav-left-item:hover{
            background-color: #3A3F51;
        }
        .nav-left-ul .nav-left-item a{
            line-height: 56px;
            color: rgba(255, 255, 255, .4);
        }

        .tip-head{
            position: absolute;
            top: 90px;
            left: 235px;
            padding-left: 20px;
        }
        .tip-head h5{
            font-weight: bold;
        }
        .tip-head .breadcrumb{
            padding-top: 0;
            padding-left: 0;

        }
        .main-bg {
            background-color: #F1F2F7;
            width: 1683px;
            height: 1080px;
            position: absolute;
            top: 168px;
            left: 220px;
            padding: 15px;
        }
        .table_show{
            background-color: white;
            margin: 0;
            width: 100%;
            padding-bottom: 75px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .table_show .show-data-item{
            height: 100px;
            border-right: #ba8b00 solid 1px;
            padding: 10px;
            margin-top: 75px;
            text-align: center;
        }
        .show-data-item h5{
            font-size: 14px;
        }
        .show-data-item h3{
            font-size: 48px;
            font-weight: 100;
        }
        .table_show .show-data-item:last-child{
            border-right: none;
        }
        .dosomething{
            margin: 0;
        }
        .dosomething .do-left{
            padding-left: 0;
            padding-right: 7px;
        }
        .dosomething .do-right{
            padding-right: 0;
            padding-left: 7px;
        }
        .do-left-in{
            background-color: white;
            border-radius: 5px;
            height: 100%;
            padding: 15px;
        }
        .do-right-in{
            background-color: white;
            border-radius: 5px;
            height: 100%;
            padding: 15px;
        }
        .new-order-list{
            list-style: none;
        }
        .new-order-list .new-order{
            border-bottom: 1px solid rgba(120, 130, 140, .13);;
        }
        .new-order-list .new-order:last-child{
            border-bottom: none;
        }
        .new-order-list .new-order img{
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .new-order .text-area{
            margin-left: 10px;
        }
        .new-order-list .new-order .text-area p{
            margin-bottom: 0;
        }
        .table-box{
            width: 100%;
            padding: 10px;
        }
        .btn-group{
            margin-bottom: 10px;
        }
        .btn{
            margin-right: 10px;
        }
    </style>
    <script>
        //窗口大小改变时，执行
        $(window).resize(function () {
            //执行代码块
            editMainBg();
        });
        function editMainBg() {
            let now_width = $(document.body).width()-220-30;
            $(".main-bg").width(now_width);
            console.log("动态更改 main-bg 的宽度" + now_width);
        }
    </script>
</head>
<body onload="editMainBg()">
<nav class="fixed-top fixed-top navbar navbar-expand-sm nav-top">
    <div class="top-left-part">
        <a class="logo" href="#"><i class="fa fa-fire color-blue"></i>&nbsp;
            <span class="hidden-xs">MY ADMIN</span>
        </a>
    </div>
    <ul class="navbar-nav">
        <li class="nav-item admin-btn">
            <img src="${pageContext.request.contextPath}/static/images/admin/admin-head.png" alt="" class="nav-img float-left">
            <a class="nav-link float-left" href="#">${sessionScope.admin.admin_name}</a>
            <a class="nav-link float-left text-danger" href="${pageContext.request.contextPath}/adminLogout">，注销</a>
            <div class="clear"></div>
        </li>
    </ul>
    <div class="clear"></div>
</nav>
<nav class="nav-left">
    <ul class="nav-left-ul">
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin">控制台</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageAnnounce">商城公告管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageUser">用户管理</a>
        </li>
        <li class="nav-left-item active">
            <a class="link active" href="${pageContext.request.contextPath}/admin/manageOrder">订单管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageVipRule">会员体系管理</a>
        </li>
        <li class="nav-left-item">
            <a class="link" href="${pageContext.request.contextPath}/admin/manageAdmin">管理员管理</a>
        </li>
    </ul>
</nav>
<div class="tip-head">
    <h5>欢迎来到商城管理中心</h5>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">控制台</a></li>
        <li class="breadcrumb-item">订单管理</li>
    </ol>
</div>
<div class="main-bg">
    <div class="table_show row">
        <div class="table-box">
            <div id="toolbar" class="btn-group operation">
                <button id="btn_add" type="button" class="btn bg-success text-white" data-toggle="modal" data-target="#addOrderModal">
                    <i class="fa fa-plus text-white" aria-hidden="true"></i>新增
                </button>
                <button id="btn_edit" type="button" class="btn bg-primary text-white">
                    <i class="fa fa-pencil text-white" aria-hidden="true"></i> 修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-danger">
                    <i class="fa fa-minus text-white" aria-hidden="true"></i> 删除
                </button>
            </div>
            <table id="table" class="my-table table-hover table-bordered"></table>
        </div>
    </div>
</div>
<!-- 新增模态框 -->
<div class="modal fade" id="addOrderModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">新建订单:</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <div class="container-fluid">
                    <form id="addOrderForm" action="" method="post">
                        <div class="form-group">
                            <label for="user_phone">用户手机号:</label>
                            <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="输入用户手机号">
                        </div>
                        <div class="form-group">
                            <label for="actual_amount">订单金额：</label>
                            <input type="text" class="form-control" id="actual_amount" name="actual_amount" placeholder="订单金额">
                        </div>
                        <div class="form-group">
                            <label for="pay_amount" id="pay_amount_label">实付金额：</label>
                            <button type="button" class="btn btn-success" id="getRebate-btn">获取折扣</button>
                            <input type="text" class="form-control" id="pay_amount" name="pay_amount" placeholder="输入用户实付金额">
                        </div>
                        <button type="button" class="btn btn-primary" id="createOrder-btn">新建订单</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 编辑模态框 -->
<div class="modal fade" id="editOrderModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">修改管理员信息:</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <div class="container-fluid">
                    <form id="editOrderForm" action="" method="post">
                        <div class="form-group">
                            <label for="edit-user_phone">用户手机号:</label>
                            <input type="text" class="form-control" id="edit-user_phone" name="user_phone" placeholder="输入用户手机号">
                        </div>
                        <div class="form-group">
                            <label for="edit-actual_amount">订单金额：</label>
                            <input type="text" class="form-control" id="edit-actual_amount" name="actual_amount" placeholder="订单金额">
                        </div>
                        <div class="form-group">
                            <label for="edit-pay_amount">实付金额：</label>
                            <input type="text" class="form-control" id="edit-pay_amount" name="pay_amount" placeholder="输入用户实付金额">
                        </div>
                        <button type="button" class="btn btn-primary" id="editOrder-btn">确认修改</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-table-1.15.1/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-table-1.15.1/bootstrap-table-zh-CN.min.js"></script>
<script>
    $('#table').bootstrapTable({
        striped:true,  // 是否显示行间隔色
        uniqueId: "order_id",  // 每行唯一标识
        pageSize:"10",  // 分页大小
        toolbar: '#toolbar', // 指定工具栏
        search: true,   // 搜索框
        pagination:true, // 开启分页
        showHeader: true,     //是否显示列头
        showLoading: true,   // 显示加载
        clickToSelect: true, //是否启用点击选中行
        singleSelect : true,// 单选
        columns: [{
            checkbox:true
        },{
            field: 'order_id',
            title: 'order_ID'
        }, {
            field: 'user_phone',
            title: '会员手机号'
        }, {
            field: 'actual_amount',
            title: '订单金额'
        },{
            field:'pay_amount',
            title:'实付金额'
        },{
            field:'create_date',
            title:'生成时间'
        }],
        data: [
            <c:forEach var="order" items="${orderList}">
            {
                order_id:'${order.order_id}',
                user_phone:'${order.user_phone}',
                actual_amount:'${order.actual_amount}',
                pay_amount:'${order.pay_amount}',
                create_date:'${order.create_date}'
            },
            </c:forEach>
        ]
    });
    // 新建
    $("#createOrder-btn").click(function () {
        if ($("#user_phone").val() === "" || $("#actual_amount").val() === "" || $("#pay_amount").val() === ""){
            alert("不能留空");
        }else {
            var data=$('#addOrderForm').serialize();
            data= decodeURIComponent(data,true)+"&create_date="+getFormatDate();
            console.log("addOrder:"+data);
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/addOrder",
                type: "POST",
                data: data,
                success:function (result) {
                    var obj = jQuery.parseJSON(result);
                    console.log( obj.msg);
                    if (obj.msg){
                        alert("新增订单成功");
                        window.location.reload()
                    }else {
                        alert("新增订单失败")
                    }
                },
                error:function () {
                    console.log(e.status);
                    console.log(e.responseText);
                    alert("新增订单失败")
                }
            })
        }
    });
    // 获取折扣
    $("#getRebate-btn").click(function () {
        if ($("#user_phone").val() === "" || $("#actual_amount").val() === ""){
            alert("用户手机号和订单原金额不能留空");
        }else {
            var data =  "phone="+$("#user_phone").val()+ "&actual_amount="+$("#actual_amount").val();
            console.log(data);
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/getRebate",
                type: "POST",
                data: data,
                success:function (result) {
                    var obj = jQuery.parseJSON(result);
                    console.log( obj.msg);
                    if (obj.msg === "true"){
                        alert("获取折扣成功");
                        console.log(result);
                        $("#pay_amount_label").html("实付金额：("+ "会员等级:"+ obj.is_rank +"所享折扣："+obj.rebate+")")
                        $("#pay_amount").val(obj.pay_amount)
                    }else {
                        alert("获取折扣失败")
                    }
                },
                error:function () {
                    console.log(e.status);
                    console.log(e.responseText);
                    alert("获取折扣失败")
                }
            });
        }
    });
    // 编辑
    $("#btn_edit").click(function () {
        var selectedRows = $("#table").bootstrapTable('getSelections');
        if (selectedRows.length === 0){
            alert("请先选中要编辑的数据");
        }else{
            $("#editOrderModal").modal("show");
            console.log("edit User :"+selectedRows[0]);
            $("#edit-user_phone").val(selectedRows[0].user_phone);
            $("#edit-actual_amount").val(selectedRows[0].actual_amount);
            $("#edit-pay_amount").val(selectedRows[0].pay_amount)
        }

    });
    $("#editOrder-btn").click(function () {
        if ($("#edit_admin_name").val() === "" || $("#edit_password").val() === "" || $("#edit_note").val() === ""){
            alert("不能留空")
        }else {
            var selectedRows = $("#table").bootstrapTable('getSelections');
            var order_id = selectedRows[0].order_id;
            var data=$('#editOrderForm').serialize();
            data= "order_id="+order_id+"&"+decodeURIComponent(data,true);
            console.log("editOrder:"+data);
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/editOrder",
                type: "POST",
                data: data,
                success:function (result) {
                    var obj = jQuery.parseJSON(result);
                    console.log( obj.msg);
                    if (obj.msg){
                        alert("修改订单信息成功")
                        window.location.reload()
                    }else {
                        alert("修改订单信息失败")
                    }
                },
                error:function () {
                    console.log(e.status);
                    console.log(e.responseText);
                    alert("修改订单信息失败")
                }
            })
        }
    });

    // 删除
    $("#btn_delete").click(function () {
        var selectedRows = $("#table").bootstrapTable('getSelections');
        if (selectedRows.length === 0){
            alert("请先选中要删除的数据");
        }else{
            $.ajax({
                url:"${pageContext.request.contextPath}/admin/delOrderByOrderId",
                type:"GET",
                data: {order_id:selectedRows[0].order_id},
                success:function (result) {
                    console.log(result);
                    var obj = jQuery.parseJSON(result);
                    console.log( obj.msg);
                    if (obj.msg){
                        alert("操作成功")
                    }
                    window.location.reload()
                },
                error:function (e) {
                    alert("操作失败");
                    console.log(e.status);
                    console.log(e.responseText);
                }
            })
        }

    });

    function getFormatDate() {
        var date = new Date();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentDate = date.getFullYear() + "-" + month + "-" + strDate
            + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        return currentDate;
    }
</script>
</body>
</html>
