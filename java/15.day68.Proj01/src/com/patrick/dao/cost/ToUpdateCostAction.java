package com.patrick.dao.cost;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.patrick.dao.DAOException;
import com.patrick.dao.cost.ICostDAO;
import com.patrick.entity.Cost;

@Controller
@Scope("prototype")
public class ToUpdateCostAction {

	// input
	private int id;
	
	// output
	private Cost cost;
	@Resource
	private ICostDAO dao;

	public String execute() throws Exception{

		cost = dao.findByID(id);
		
		
		return "success";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cost getCost() {
		return cost;
	}

	public void setCost(Cost cost) {
		this.cost = cost;
	}
	
	
	
}
