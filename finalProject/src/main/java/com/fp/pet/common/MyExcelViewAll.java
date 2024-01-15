package com.fp.pet.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractXlsxView;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;


// AbstractExcelView는 spring 4.2 부터  deprecated 됨
// 높은 버전의 엑셀은 AbstractXlsxView 구현클래스로 작성(확장자는 xlsx) 
// 낮은 버전의 엑셀은 AbstractXlsView 구현클래스로 작성(확장자는 xls) 

@Service("excelViewAll")
public class MyExcelViewAll extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
        response.setContentType("application/ms-excel");
        
        List<SheetData> sheets = (List<SheetData>) model.get("sheets");

     // 시트를 반복하며 만든다
        for (int sheetIndex = 0; sheetIndex < sheets.size(); sheetIndex++) {
            SheetData sheetData = sheets.get(sheetIndex);
            Sheet sheet = createSheet(workbook, sheetIndex, sheetData.getSheetName());

            if (sheetData.getColumnLabels() != null) {
                createColumnLabel(sheet, sheetData.getColumnLabels());
            }

            if (sheetData.getColumnValues() != null) {
                createColumnValue(sheet, sheetData.getColumnValues());
            }
        }
	}

	// sheet 생성
	/**
	 * @param workbook
	 * @param sheetIdx  : sheet 인덱스(0부터 시작)
	 * @param sheetName
	 * @return
	 */
	protected Sheet createSheet(Workbook workbook, int sheetIdx, String sheetName) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(sheetIdx, sheetName);
		return sheet;
	}

	// 
	// 제목(첫번째 row)
	protected void createColumnLabel(Sheet sheet, List<String> columnLabels) {
		Row labelRow = sheet.createRow(0);
		
		// 헤더 행에 대한 배경색 설정
	    CellStyle headerStyle = sheet.getWorkbook().createCellStyle();
	    headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		Cell cell;
		for(int idx = 0; idx < columnLabels.size(); idx++) {
			sheet.setColumnWidth(idx, 256 * 15); // 컬럼폭
			
			cell = labelRow.createCell(idx);
			cell.setCellValue(columnLabels.get(idx));
	        cell.setCellStyle(headerStyle); // 셀에 헤더 스타일 적용

		}
	}

	// 내용(두번째 row 부터)
	protected void createColumnValue(Sheet sheet, List<Object[]> columnValues) {
		Row row;
		Cell cell;
		
		for(int idx = 0; idx < columnValues.size(); idx++) {
			row = sheet.createRow(idx + 1);
			
			Object[] values = columnValues.get(idx);
			
			for(int col = 0; col < values.length; col++) {
				try {
					cell = row.createCell(col);
					
					if(values[col] instanceof Byte) {
						cell.setCellValue((Byte)values[col]);
					} else if(values[col] instanceof Short) {
						cell.setCellValue((Short)values[col]);
					} else if(values[col] instanceof Integer) {
						cell.setCellValue((Integer)values[col]);
					} else if(values[col] instanceof Long) {
						cell.setCellValue((Long)values[col]);
					} else if(values[col] instanceof Float) {
						cell.setCellValue((Float)values[col]);
					} else if(values[col] instanceof Double) {
						cell.setCellValue((Double)values[col]);
					} else if(values[col] instanceof Character) {
						cell.setCellValue((Character)values[col]);
					} else if(values[col] instanceof Boolean) {
						cell.setCellValue((Boolean)values[col]);
					} else if(values[col] instanceof String) {
						cell.setCellValue((String)values[col]);
					} else {
						cell.setCellValue(values[col].toString());
					}
					
				} catch (Exception e) {
				}
			}
			
		}
		
	}
	
	
	// 각 시트의 데이터를 나타내기 위한 SheetData 클래스를 추가
    public static class SheetData {
        private String sheetName;
        private List<String> columnLabels;
        private List<Object[]> columnValues;

        public SheetData(String sheetName, List<String> columnLabels, List<Object[]> columnValues) {
            this.sheetName = sheetName;
            this.columnLabels = columnLabels;
            this.columnValues = columnValues;
        }

        public String getSheetName() {
            return sheetName;
        }

        public List<String> getColumnLabels() {
            return columnLabels;
        }

        public List<Object[]> getColumnValues() {
            return columnValues;
        }
    }
}
