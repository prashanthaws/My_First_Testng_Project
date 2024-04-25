package support;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;

public class readjavafun
{
    public  static String create_json_body_for_job_call(String name, String job)
    {
        String flag = null;
        try
        {
            flag = " {\n" +
                    "          \"name\": \""+name+"\",\n" +
                    "          \"job\": \""+job+"\"\n" +
                    "        }";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    public static void readingXLFileAsPerTestData(String testcaseName, String colName)
    {
        try
        {
            String xlFile = "C:\\Users\\prashanthram\\Desktop\\Testdata.csv";
            FileInputStream myxlfile1 = new FileInputStream(xlFile);
            Workbook workbook = new XSSFWorkbook(myxlfile1);
            Sheet sheet = workbook.getSheet("Sheet1");
            int lastrow = sheet.getLastRowNum();
            System.out.println("The last row number which has data is:"+lastrow);

            //loop for row iteration
            for(int i = 0; i<=lastrow; i++){
                Row row = sheet.getRow(i);
                //get the  last column which has data
                int lastCell = row.getLastCellNum();
                Cell cell = row.getCell(0);
                String runTimeTestCaseName = cell.getStringCellValue();

                if(runTimeTestCaseName.equals(testcaseName)) {

                    //Loop for column iteration
                    Row rowNew = sheet.getRow(0);
                    for (int j = 1; j < lastCell; j++) {
                        Cell cell1 = rowNew.getCell(j);
                        String runTimeCellValue = cell1.getStringCellValue();
                        if (runTimeCellValue.equals(colName)) {
                            String value = sheet.getRow(i).getCell(j).toString();
                            System.out.println("The title value is :" + value);
                        }
                    }
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();

        }
    }

}
