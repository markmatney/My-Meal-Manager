package MyMealManager;

import java.lang.Integer;
import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public class SearchServlet extends HttpServlet implements Servlet {
	public SearchServlet() {}
	protected void doGet (HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
			IOException{
	       String[] ingredNames = request.getParameterValues("ingredients");
		int arrLen = ingredNames.length;	
		Ingredient[] ingreds = new Ingredient[arrLen];
		for (int j = 0; j < arrLen; j++){
			ingreds[j] = new Ingredient(ingredNames[j]);
		}
                Recipe[] results = new Recipe

	}
}
