package com.yingnuo.web.servlet;

import com.yingnuo.domain.Order;
import com.yingnuo.domain.User;
import com.yingnuo.service.OrderService;

import javax.security.auth.login.LoginException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userCenter")
public class UserCenterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null){
            // 用户
            System.out.println("session 中没有 user，没有登陆！");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req,resp);
            return;
        }
        // 获取 用户的全部订单
        OrderService orderService = new OrderService();
        try {
            List<Order> orderList = orderService.allOrderOfUser(user.getPhone());
            req.setAttribute("orderList",orderList);
            System.out.println("[UserCenterServlet]-获取用户："+ user.getUsername()+ " 的订单列表成功");
//            for (Order order : orderList){
//                System.out.println("订单号："+order.getOrder_id());
//                System.out.println("订单金额："+order.getActual_amount());
//                System.out.println("订单实付金额："+order.getPay_amount());
//                System.out.println("订单创建时间："+order.getCreate_date());
//            }
        } catch (LoginException e) {
            e.printStackTrace();
            req.setAttribute("orderList","error");
        }
//
        RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/client/userCenter.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
