import jakarta.servlet.*;

import java.io.IOException;

@jakarta.servlet.annotation.WebFilter(urlPatterns = "/*")
public class WebFilter implements Filter {
    int compt;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        compt=0;
        System.out.println("bonjour le filtre");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("Passage numéro "+compt+" dans le filtre");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("Instance du filtre détruite");
        Filter.super.destroy();
    }
}
