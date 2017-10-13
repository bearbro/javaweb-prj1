package cn.edu.zjut;

import cn.edu.zjut.dao.UserDao;
import cn.edu.zjut.model.UserBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Bro、小熊 on 2017/10/1.
 */
@WebServlet(name = "registerServlet",urlPatterns = {"/register"})
public class registerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserBean user = new UserBean();
        user.setPassword(password);
        user.setUsername(username);
        user.setType("2");
        UserDao dao=new UserDao();
        boolean hadadd=dao.insert(user);
        if(hadadd){
            request.setAttribute("USER", user);
            request.getRequestDispatcher("loginSuccess.jsp").forward(request, response);
        }else{
            response.sendRedirect("registerFailed.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
