package com.fp.pet.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.Product;
import com.fp.pet.admin.service.ProductManageService;
import com.fp.pet.common.FileManager;
import com.fp.pet.common.MyUtilBootstrap;

@Controller
@RequestMapping("/admin/productManage/*")
public class ProductManageController {

	@Autowired
	public ProductManageService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtilBootstrap myUtil;

	@RequestMapping(value = "/")
	public String products(Model model) throws Exception {
		model.addAttribute("left", "productManage");
		model.addAttribute("sub", "icons");
		return ".admin.productManage.productManageList";
	}

	@RequestMapping(value = "list")
	public String productlist(Model model, @RequestParam(value = "sort", defaultValue = "100") int sort,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, @RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("sort", sort);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		List<Product> list = service.listProduct(map);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);

		return "admin/productManage/list";
	}

	@RequestMapping(value = "sublist")
	public String productsublist(Model model, @RequestParam(value = "subsort", defaultValue = "20") int subsort,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, @RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("subsort", subsort);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		String paging = myUtil.pagingMethod(current_page, total_page, "subsortpage");
		List<Product> list = service.sublistProduct(map);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);

		return "admin/productManage/list";
	}

	@RequestMapping(value = "stocklist")
	public String productstocklist(Model model, @RequestParam(value = "stocksort", defaultValue = "3") int stocksort,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd, @RequestParam(defaultValue = "all") String schType,
			HttpServletRequest req) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		map.put("stocksort", stocksort);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		String paging = myUtil.pagingMethod(current_page, total_page, "stockpage");

		List<Product> list = service.stocklistProduct(map);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);

		return "admin/productManage/list";
	}

	@RequestMapping(value = "addproduct")
	@ResponseBody
	public String insertProduct(HttpSession session, Product dto) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "product";

		try {
			service.insertProduct(dto, pathname);

		} catch (Exception e) {
		}

		return "redirect:/admin/productManage/list";
	}

	@GetMapping("productDetail")
	@ResponseBody
	public List<Product> ProductDetail(@RequestParam long sort) {
		List<Product> list = service.productDetail(sort);

		return list;
	}

	@GetMapping("update")
	public String updateForm(@RequestParam(defaultValue = "0") int special,
			@RequestParam(defaultValue = "0") long parentNum, @RequestParam(defaultValue = "0") long categoryNum,
			@RequestParam long productNum, @RequestParam(defaultValue = "1") String page, Model model) {

		Product dto = service.findById(productNum);
		if (dto == null) {
			String query = "parentNum=" + parentNum + "&categoryNum=" + categoryNum + "&page=" + page;
			if (special != 0) {
				query += "&special=" + special;
			}
			return "redirect:/admin/product/main?" + query;
		}
		// 카테고리
		List<Product> listCategory = service.listCategory();
		List<Product> listSubCategory = service.listSubCategory(parentNum);

		// 추가 이미지
		List<Product> listFile = service.listProductFile(productNum);
		// 상위/하위 옵션명
		List<Product> listOption = service.listProductOption(productNum);
		// 상위/하위 상세 옵션
		List<Product> listOptionDetail = null;
		List<Product> listOptionDetail2 = null;
		if (listOption.size() > 0) {
			dto.setOptionNum(listOption.get(0).getOptionNum());
			dto.setOptionName(listOption.get(0).getOptionName());
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
		}
		if (listOption.size() > 1) {
			dto.setOptionNum2(listOption.get(1).getOptionNum());
			dto.setOptionName2(listOption.get(1).getOptionName());
			listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOptionNum());
		}

		model.addAttribute("mode", "update");
		model.addAttribute("special", special);

		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listOptionDetail2", listOptionDetail2);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("parentNum", parentNum);

		model.addAttribute("page", page);

		return ".admin.productManage.productInfo";
	}

	@PostMapping("update")
	public String updateSubmit(Product dto, @RequestParam(defaultValue = "0") int special, @RequestParam String page,
			HttpSession session, Model model) {

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";

		try {
			service.updateProduct(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/admin/productManage/";
	}

	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, @RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "product" + File.separator + filename;

			service.deleteProductFile(fileNum, pathname);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@PostMapping("deleteOptionDetail")
	@ResponseBody
	public Map<String, Object> deleteOptionDetail(@RequestParam long detailNum) throws Exception {

		String state = "true";
		try {
			service.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@PostMapping("deleteProduct")
	@ResponseBody
	public Map<String, Object> deleteProduct(@RequestParam long productNum, Product dto, HttpSession session)
			throws Exception {

		String state = "true";

		// 상위/하위 옵션명
		List<Product> listOption = service.listProductOption(productNum);

		if (listOption.size() > 0) {
			dto.setOptionNum(listOption.get(0).getOptionNum());
			long OptionNum = dto.getOptionNum();
			service.deleteOptionDetailFinal(OptionNum);
		}
		if (listOption.size() > 1) {
			dto.setOptionNum2(listOption.get(1).getOptionNum());
			long OptionNum2 = dto.getOptionNum2();
			service.deleteOptionDetailFinal(OptionNum2);
		}

		String thumb = service.findThumb(productNum);
		if (thumb.length() > 0) {
			dto.setThumbnail(thumb);
			System.out.println(thumb);
			String rootthumb = session.getServletContext().getRealPath("/");
			String pathname = rootthumb + "uploads" + File.separator + "product" + File.separator + thumb;
			fileManager.doFileDelete(dto.getThumbnail(), pathname);

		}

		service.deleteProductOptionFinal(productNum);

		List<Product> listFile = service.listProductFile(productNum);
		int size = listFile.size();
		for (int i = 0; i < size; i++) {
			dto.setFilename(listFile.get(i).getFilename());
			dto.setFileNum(listFile.get(i).getFileNum());
			String filename = dto.getFilename();
			long fileNum = dto.getFileNum();
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "product" + File.separator + filename;
			service.deleteProductFile(fileNum, pathname);
		}

		try {
			service.deleteProduct(dto, productNum);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@ResponseBody
	@PostMapping("{productNum}/insertStock")
	public String insertStock(@RequestParam long detailNumber1, @RequestParam long detailNumber2,
			@RequestParam long sancMemo, @PathVariable long productNum) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detailNumber1", detailNumber1);
		map.put("detailNumber2", detailNumber2);
		map.put("productNum", productNum);

		try {
			Integer totalStock = service.findyByProNum(map);

			if (totalStock != null && totalStock >= 0) {
				sancMemo = totalStock + (int) sancMemo;
				service.updateStock(detailNumber1, detailNumber2, productNum, sancMemo);
			} else {
				service.insertStock(productNum, detailNumber1, detailNumber2, sancMemo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/productManage/";
	}

	@RequestMapping(value = "first")
	public String firstchart() {

		return "admin/productManage/firstChart";
	}

	@ResponseBody
	@RequestMapping(value = "chart1")
	public Map<String, Object> chart1(Product dto) {

		List<Product> chart1 = service.chart1();
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		model.put("chart1", chart1);
		
		return model;
	}

	@RequestMapping(value = "second")
	public String secondchart() {

		return "admin/productManage/secondChart";
	}
	
	@ResponseBody
	@RequestMapping(value = "chart2")
	public Map<String, Object> chart2(Product dto) {

		List<Product> chart2 = service.chart2();
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		model.put("chart2", chart2);
		
		return model;
	}
}
