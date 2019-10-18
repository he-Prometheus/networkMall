package com.ithe.web.action;

import org.springframework.stereotype.Controller;

import com.ithe.domain.Payment;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class BuyGoodsAction extends ActionSupport implements ModelDriven<Payment>{

	private static final long serialVersionUID = 1L;
	private Payment payment = new Payment();
	public Payment getModel() {
		return payment;
	}
	
	public String add(){
	    System.out.println("ass+++++++++++++++++");
		
		return "Test";
	}

}
