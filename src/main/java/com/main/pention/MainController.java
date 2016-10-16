package com.main.pention;



import javax.annotation.*;
import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.*;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.di.*;
import com.model.*;


@Controller
@RequestMapping("pention/{menu}/{main}/{service}")
public class MainController {

	@Resource
	DataBean databean;


	Action action;

	@ModelAttribute("bean")
	public DataBean mainController(@PathVariable String menu, @PathVariable String main, @PathVariable String service, DataBean databean, HttpSession session) throws Throwable{
		this.databean.setMenu(menu);
		this.databean.setMain(main);
		this.databean.setService(service);
		this.databean.converting(databean);

		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		this.action = (Action)context.getBean(menu);
		this.action.execute();

		return this.databean;
	}



	@RequestMapping
	public String template(){
		return "template";
	}
}
