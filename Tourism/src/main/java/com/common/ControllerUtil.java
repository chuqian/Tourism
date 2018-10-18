package com.common;

import com.entity.Role;

public class ControllerUtil {
	
	
	/**
	 * 根据员工信息返回要跳转的路径
	 */
	public static String pagePath(Role role){
		if(role == null){
			return "index";
		}
		else{
			String page = null;
			switch (role.getRoleId().intValue()) {
			case 101:
				page="SuperAdmin";	 //超级管理员界面
				break;
			case 102:
				page="SystemManager";//管理员界面
				break;
			case 103:
			case 104:
			case 105:
				page="Satrap";		 //主管管理界面
				break;
			case 106:
				page="Assistant";	 //电销助理界面
				break;
			case 107:
				page="Telemarketing";//电话销售员页面
				break;
			case 108:
				page="WebConsultant";//网络咨询员页面
				break;
			case 109:
				page="Counselor";	 //咨询师页面
				break;
			default:
				page="index";		 //登录界面
				break;
			}
			return page;
		}
	}
	
	
	//将role属性String null转换为 null
		/*public static Role roleNull(Role role){
			
			if("".equals(role.getroleNumber())){
				role.setroleNumber(null);
			}
			if("".equals(role.getroleName())){
				role.setroleName(null);
			}
			if("".equals(role.getrolePassword())){
				role.setrolePassword(null);
			}
			if("".equals(role.getroleTel())){
				role.setroleTel(null);
			}
			if("".equals(role.getroleType())){
				role.setroleType(null);
			}
			
			if("".equals(role.getHireDate())){
				role.setHireDate(null);
			}
			if("".equals(role.getQuitDate())){
				role.setQuitDate(null);
			}
			
			return role;
			
		}*/
		
		//将equals属性String null转换为 null
		/*public static QueryCondition  queryConditionNull(QueryCondition qc){
			if("".equals(qc.getStatus())){
				qc.setStatus(null);
			}
			if("".equals(qc.getHire())){
				qc.setHire(null);
			}
			if("".equals(qc.getQuit())){
				qc.setQuit(null);
			}
			return qc;
		}*/
}
