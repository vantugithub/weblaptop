package com.laptrinhjavaweb.controller.admin;



import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.Description;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.paging.PageRequest;
import com.laptrinhjavaweb.service.impl.ProductServiceImpl;

@Controller(value ="NewControllerOfAdmin")
public class NewController {
	private static final String UPLOAD_DIRECTORY ="/allfile"; 


	@Autowired
	private ProductServiceImpl productServiceImpl;

	@RequestMapping(value="/admin/listproduct",method = RequestMethod.GET)
	public ModelAndView listProduct(@RequestParam("page") int page, 
			@RequestParam("limit") int limit,
			@RequestParam(name="notice",required = false) String notice)
	{
		ModelAndView mav  = new ModelAndView("admin/new/list");
		Product model = new Product();
		Catalog catalog = new Catalog();
		model.setPage(page);
		model.setLimit(limit);
		PageRequest pageable = new PageRequest(page, limit);
		model.setListResult(productServiceImpl.findAll(pageable));
		model.setTotalItem(productServiceImpl.countProduct());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		List<Catalog> lisCatalog = new ArrayList<Catalog>();
		lisCatalog = productServiceImpl.getAllCatalog();
		mav.addObject("lisCatalog",lisCatalog);
		mav.addObject("catalog",catalog);
		mav.addObject("model", model);
		mav.addObject("notice",notice);
		return mav;
	}

	@RequestMapping(value="/admin/editproduct/{id}",method= RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable(name="id") int id,Model model1) 
	{
		ModelAndView mav = new ModelAndView("admin/new/edit");
		Product model = new Product();
		model.setListResult(productServiceImpl.findOneProductById(id));
		mav.addObject("model",model);
		Product product = new Product();
		model1.addAttribute("product", product);
		return mav;
	}

	@RequestMapping(value="/admin/editproductid/{id}",method=RequestMethod.GET)
	public RedirectView updateProduct(@PathVariable(name="id") long id,
			@ModelAttribute("product") Product product,
			@RequestParam("description") String description,
			@RequestParam("content") String content,
			RedirectAttributes redirectAttributes) 
	{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		String strDate = formatter.format(date);  
		formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");  
		strDate = formatter.format(date);
		product.setId(id);
		product.setContent(content);
		product.setDescription(description);
		product.setDateModified(strDate);

		String notice="";
		if(productServiceImpl.updateProduct(product)!=0) 
		{
			notice+="Update Cussess";
		}
		else notice+="Update Faild";
		redirectAttributes.addAttribute("notice", notice);

		return new RedirectView("forward:/admin/editproductid/{id}");
	}

	@RequestMapping(value="/admin/editfile/{id}",method = RequestMethod.GET)
	public ModelAndView editFile(@PathVariable(name="id") long id) 
	{
		ModelAndView mav = new ModelAndView("admin/new/editfile");
		Product product  = new Product();
		product.setListResult(productServiceImpl.editFile(id));
		mav.addObject("product",product);
		return mav;
	}

	@RequestMapping(value="/admin/uploadfile/{id}",method = RequestMethod.POST)
	public ModelAndView uploadFile(@PathVariable(name="id") long id,
			@RequestParam("files") List<MultipartFile> filess,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request,
			HttpSession session
			)
	{
		List<MultipartFile> tempFile = new ArrayList<MultipartFile>();

		ServletContext context = session.getServletContext();  
		String path = context.getRealPath(UPLOAD_DIRECTORY); 

		ModelAndView mav = new ModelAndView("success");

		String strFiles = "";
		if(filess != null && filess.size() > 0) 
		{
			for (MultipartFile multipartFile : filess) 
			{
				String fileName = multipartFile.getOriginalFilename();
				if(!fileName.equals("")) 
				{
					tempFile.add(multipartFile);
				}
			}
		}
		for (MultipartFile multipartFile : tempFile ) 
		{
			try {
				File newFile = new File(path + File.separator + multipartFile.getOriginalFilename());
				File uploadedFile = new File(path + File.separator + multipartFile.getOriginalFilename());
				if(!uploadedFile.exists())
				{
					FileOutputStream fileOutputStream;
					fileOutputStream = new FileOutputStream(newFile);
					fileOutputStream.write(multipartFile.getBytes());
					fileOutputStream.close();
					strFiles=strFiles+multipartFile.getOriginalFilename()+";";
				}
				else {
					strFiles=strFiles+multipartFile.getOriginalFilename()+";";
				}
			} catch (FileNotFoundException e) 
			{
				e.printStackTrace();
			}
			catch (IOException e) 
			{
				e.printStackTrace();
			}
		}

		int check  = productServiceImpl.updateFile(id, strFiles);
		String notice = "";
		if(check!=0) 
		{
			notice+="Upload Success";
		}
		else notice+="Upload faild";
		request.setAttribute("notice", notice);
		return  mav;
	}
	
	@RequestMapping(value="/admin/editdescription/{id}" ,method = RequestMethod.GET)
	public ModelAndView descriptionPage(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("admin/new/editdescription");
		Product product = new Product();
		product.setListResult(productServiceImpl.findOneProductById(id));
		mav.addObject("productDescription",product);
		return mav;
	}
	
	
	@RequestMapping(value="/admin/editdescriptionid/{id}",method=RequestMethod.POST)
	public ModelAndView uploadDescriptionProduct(@PathVariable("id") long id,
			@RequestParam("titles") List<String> titles,
			@RequestParam("headContents") List<String> headContents,
			@RequestParam("files") List<MultipartFile> filess,
			@RequestParam("footContents") List<String> footContents,
			HttpSession session
			)
	{
		ModelAndView mav  = new ModelAndView("success");
		List<MultipartFile> tempFile = new ArrayList<MultipartFile>();
		List<String> tempName = new ArrayList<String>();
		ServletContext context = session.getServletContext();  
		String path = context.getRealPath(UPLOAD_DIRECTORY); 
		if(filess != null && filess.size() > 0) 
		{
			for (MultipartFile multipartFile : filess) 
			{
				String fileName = multipartFile.getOriginalFilename();
				tempName.add(fileName);
				if(!fileName.equals("")) 
				{
					tempFile.add(multipartFile);
				}
			}
		}
		for (MultipartFile multipartFile : tempFile ) 
		{
			try {
				File newFile = new File(path + File.separator + multipartFile.getOriginalFilename());
				File uploadedFile = new File(path + File.separator + multipartFile.getOriginalFilename());
				if(!uploadedFile.exists())
				{
					FileOutputStream fileOutputStream;
					fileOutputStream = new FileOutputStream(newFile);
					fileOutputStream.write(multipartFile.getBytes());
					fileOutputStream.close();
				}
				else continue;
			} 
			catch (FileNotFoundException e) 
			{
				e.printStackTrace();
			}
			catch (IOException e) 
			{
				e.printStackTrace();
			}
		}
		String result="";
		for(int i = 0 ; i < tempName.size() ; i++) 
		{
			result=result+titles.get(i)+";";
			result=result+headContents.get(i)+";";
			result=result+tempName.get(i)+";";
			result=result+footContents.get(i)+";";
		}
		Description description = new Description();
		description.setContent(result);
		description.setId(id);
		@SuppressWarnings("unused")
		int check = productServiceImpl.updateDescriptionProduct(description);
		return mav;
	}
	
	@RequestMapping(value="/admin/createNewProduct",method = RequestMethod.POST)
	public RedirectView  createNewProduct(@ModelAttribute("catalog") Catalog catalog,
			RedirectAttributes redirectAttributes) {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		String strDate = formatter.format(date);
		formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		strDate = formatter.format(date);
		catalog.setDateCreated(strDate);
		String auth = SecurityContextHolder.getContext().getAuthentication().getName();
		catalog.setUserCreated(auth);
		String notice="";
		if(productServiceImpl.addNewProduct(catalog)!=0) {
			notice = "Add product cuccess";
		}
		else notice = "Add product faild";
		redirectAttributes.addAttribute("notice",notice);
		redirectAttributes.addAttribute("page", 1);
		redirectAttributes.addAttribute("limit",2);
		return new RedirectView("/spring-mvc/admin/listproduct");
	}
	
	@RequestMapping(value="/admin/createNewModel",method = RequestMethod.POST)
	public RedirectView createNewModel(@RequestParam("name") String name,
			RedirectAttributes redirectAttributes) {
		String notice = "";
		if(productServiceImpl.createNewModel(name)!=0) {
			notice="Create success";
		}else notice = "Create faild";
		
		redirectAttributes.addAttribute("notice",notice);
		redirectAttributes.addAttribute("page",1);
		redirectAttributes.addAttribute("limit",2);
		return new RedirectView("/spring-mvc/admin/listproduct");
	}

}
