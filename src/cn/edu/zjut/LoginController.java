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
 * Servlet implementation class LoginController
 */
@WebServlet(name = "/LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        UserBean user = new UserBean();
        user.setPassword(password);
        user.setUsername(username);
        user.setType(type);
        if (checkUser(user)) {
            request.setAttribute("USER", user);
            request.getRequestDispatcher("loginSuccess.jsp").forward(request, response);
            //localhost:8080/javaweb-prj1/login
            //localhost:8080/javaweb-prj1/loginSuccess.jsp
        } else {
            response.sendRedirect("loginFailed.jsp");
        }


    }

    private boolean checkUser(UserBean user) {
        UserDao ud = new UserDao();

        if (ud.searchUser(user)) {
            return true;
        } else {
            return false;
        }
    }

}
