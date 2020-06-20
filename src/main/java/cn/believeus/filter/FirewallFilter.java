package cn.believeus.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import cn.believeus.model.Tuser;
import cn.believeus.variables.Variables;

public class FirewallFilter implements Filter {

	private List<String> nologinCanNotAccessUrl=new ArrayList<String>();
	@Override
	public void init(FilterConfig config) throws ServletException {
		nologinCanNotAccessUrl = Arrays.asList(config.getInitParameter("nologinCanNotAccessUrl").split(","));
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request= ((HttpServletRequest)req);
		HttpServletResponse response=(HttpServletResponse)resp;
		String uri = request.getRequestURI();
		if(nologinCanNotAccessUrl.contains(uri)){
			HttpSession session = request.getSession();
			Tuser user = (Tuser)session.getAttribute(Variables.SESSION_USER);
			if (user!=null) {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					String name = cookies[i].getName();
					String mail = DigestUtils.md5Hex(user.getMail());
					if (name.equals(mail)) {
						if (uri.equals("/keyview.jhtml")) {
							 chain.doFilter(req, resp);
						}else {
							response.sendRedirect("/");
						}
						 return;
					}
				}
				 chain.doFilter(req, resp);
			}else {
				response.sendRedirect("/");
			}
		}else {
			chain.doFilter(req,resp);
		}
	}

	@Override
	public void destroy() {
		
	}

}
