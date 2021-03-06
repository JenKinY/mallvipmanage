package com.yingnuo.web.servlet.admin;

import com.yingnuo.domain.Order;
import com.yingnuo.service.OrderService;
import com.yingnuo.service.UserService;

import javax.security.auth.login.LoginException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/11/30
 * Time: 15:13
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@WebServlet("/admin")
public class AdminLoginPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 判断是否有 session
        if (req.getSession().getAttribute("admin") == null){
            //
            System.out.println("session 中没有 admin，没有管理员登陆！请登录...");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/admin_login.jsp");
            dispatcher.forward(req,resp);
            return;
        }
        // 获取最新 5 条订单
        OrderService orderService = new OrderService();
        UserService userService = new UserService();
        try {
            List<Order> newFiveOrderList = orderService.findNewFiveOrder();
            req.setAttribute("newFiveOrderList",newFiveOrderList);
        } catch (LoginException e) {
            e.printStackTrace();
            req.setAttribute("newFiveOrderList",null);

        }
        // 获取 订单量 会员数 成交额 积分池
        try {
            req.setAttribute("countOrder",orderService.countOrder());
            req.setAttribute("allPoint",userService.allPoint());
            req.setAttribute("allPayAmount",orderService.allPlayAmount());
            req.setAttribute("countUser",userService.countUser());
        } catch (LoginException e) {
            e.printStackTrace();
            req.setAttribute("countOrder",null);
            req.setAttribute("countUser",null);
            req.setAttribute("allPayAmount",null);
            req.setAttribute("allPoint",null);
        }

        // 如果有 session ，表示有管理已经登录了
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/admin_index.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}