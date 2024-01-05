package com.fp.pet.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.pet.admin.domain.Product;
import com.fp.pet.admin.mapper.ProductManageMapper;
import com.fp.pet.common.FileManager;

@Service
public class ProductManageServiceImpl implements ProductManageService {

	@Autowired
	public ProductManageMapper mapper;

	@Autowired
	private FileManager fileManager;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list = null;

		try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> productDetail(long sort) {

		List<Product> list = null;
		try {
			list = mapper.productDetail(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertProduct(Product dto, String pathname) {

		try {
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);

			// 상품 저장
			long productNum = mapper.productSeq();

			dto.setProductNum(productNum);
			mapper.insertProduct(dto);

			// 추가 이미지 저장
			if (!dto.getAddFiles().isEmpty()) {
				for (MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
						continue;
					}
					dto.setFilename(filename);

					mapper.insertProductFile(dto);
				}
			}

			// 상위 옵션 저장
			long optionNum = mapper.optionSeq();
			dto.setOptionNum(optionNum);
			dto.setParent(null);
			mapper.insertProductOption(dto);

			// 상위 옵션 값 저장
			long detailNum;
			dto.setDetailNums(new ArrayList<Long>());
			for (String optionValue : dto.getOptionValues()) {
				detailNum = mapper.detailSeq();
				dto.setDetailNum(detailNum);
				dto.setOptionValue(optionValue);

				mapper.insertOptionDetail(dto);

				dto.getDetailNums().add(detailNum);
			}

			// 하위 옵션 저장
			long optionNum2 = mapper.optionSeq();
			dto.setOptionNum(optionNum2);
			dto.setOptionName(dto.getOptionName2());
			dto.setParent(optionNum);
			mapper.insertProductOption(dto);

			// 하위 옵션 값 저장
			dto.setDetailNums2(new ArrayList<Long>());
			for (String optionValue2 : dto.getOptionValues2()) {
				detailNum = mapper.detailSeq();
				dto.setDetailNum(detailNum);
				dto.setOptionValue(optionValue2);
				mapper.insertOptionDetail(dto);

				dto.getDetailNums2().add(detailNum);
			}

			/*
			 * // 재고 테이블 저장 ProductStock stock = new ProductStock();
			 * stock.setProductNum(productNum); for(long dn : dto.getDetailNums()) {
			 * for(long dn2 : dto.getDetailNums2()) { stock.setDetailNum(dn);
			 * stock.setDetailNum2(dn2);
			 * 
			 * mapper.insertProductStock(stock); } }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Product> sublistProduct(Map<String, Object> map) {
		List<Product> list = null;

		try {
			list = mapper.sublistProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Product findById(long productNum) {
		Product dto = null;

		try {
			dto = mapper.findById(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<Product> listCategory() {
		List<Product> list = null;

		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> listSubCategory(long parent) {
		List<Product> list = null;

		try {
			list = mapper.listSubCategory(parent);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> listProductFile(long productNum) {
		List<Product> list = null;

		try {
			list = mapper.listProductFile(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> listProductOption(long productNum) {
		List<Product> list = null;

		try {
			list = mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> listOptionDetail(long optionNum) {
		List<Product> list = null;

		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateProduct(Product dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			if(filename != null) {
				// 이전 파일 지우기
				if (dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				
				dto.setThumbnail(filename);
			}
			
			// 상품 수정
			mapper.updateProduct(dto);
			
			// 추가 이미지
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if(filename == null) {
						continue;
					}
					dto.setFilename(filename);
					
					mapper.insertProductFile(dto);
				}
			}
			
			// 상위 옵션 수정
			mapper.updateProductOption(dto);
			
			// 기존 상위 옵션값 수정
				
				int size = dto.getDetailNums().size();		
				
				for(int i = 0; i < size; i++) {
					dto.setDetailNum(dto.getDetailNums().get(i));
					dto.setOptionValue(dto.getOptionValues().get(i));
					mapper.updateOptionDetail(dto);
				}
			
			// 새로운 상위 옵션값 추가
			long detailNum;
			dto.setDetailNums(new ArrayList<Long>());
				for(int i = size; i < dto.getOptionValues().size(); i++) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(dto.getOptionValues().get(i));
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums().add(detailNum);
				}
			

			// 하위 옵션 수정
			dto.setOptionNum(dto.getOptionNum2());
			dto.setOptionName(dto.getOptionName2());
			mapper.updateProductOption(dto);
			
			// 기존 하위 옵션값 수정
				int size2 = dto.getDetailNums2().size();
				
				for(int i = 0; i < size2; i++) {
					dto.setDetailNum(dto.getDetailNums2().get(i));
					dto.setOptionValue(dto.getOptionValues2().get(i));
					mapper.updateOptionDetail(dto);
				}

			// 새로운 하위 옵션값 추가
			dto.setDetailNums2(new ArrayList<Long>());
				for(int i = size2; i < dto.getOptionValues2().size(); i++) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(dto.getOptionValues2().get(i));
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums2().add(detailNum);
				}

			/*
			// 재고 테이블 저장
			ProductStockManage stock = new ProductStock();
			stock.setProductNum(dto.getProductNum());
			for(long dn : dto.getDetailNums()) {
				for(long dn2 : dto.getDetailNums2()) {
					stock.setDetailNum(dn);
					stock.setDetailNum2(dn2);
					
					mapper.insertProductStock(stock);
				}
			}
			*/			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteProduct(Product dto, long productNum) throws Exception {
		try {
			mapper.deleteProduct(productNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteProductFile(long fileNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteProductFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteOptionDetail(long detailNum) throws Exception {
		try {
			mapper.deleteOptionDetailStock(detailNum);
			mapper.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteOptionDetailFinal(long optionNum) {
		try {
			mapper.deleteOptionDetailFinal(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteProductOptionFinal(long productNum) {
		try {
			mapper.deleteProductOptionFinal(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String findThumb(long productNum) {
		String thumb=null;
		try {
			thumb=mapper.findThumb(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thumb;
	}

	@Override
	public void insertStock(long productNum,
			long detailNumber1, long detailNumber2, 
			long sancMemo) {
		
		try {
			mapper.insertStock(productNum,detailNumber1, detailNumber2,  sancMemo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	@Override
	public void updateStock(long detailNumber1, long detailNumber2, long productNum, long sancMemo) {
		try {
			mapper.updateStock(detailNumber1, detailNumber2, productNum, sancMemo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Integer findyByProNum(Map<String, Object> map) {
			Integer totalStock=0;
		try {
			totalStock=mapper.findyByProNum(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalStock;
	}

	@Override
	public List<Product> stocklistProduct(Map<String, Object> map) {
		List<Product> list = null;

		try {
			list = mapper.stocklistProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	
}
