<?php 
$dbcon = mysqli_connect("localhost", "root", "", "excelfile");
if(!$dbcon) echo "Failed to connect".mysqli_error($dbcon);


include_once('PHPExcel/Classes/PHPExcel.php');
//include('../PHPExcel/Classes/PHPExcel/IOFactory.php');
if(isset($_POST['submit'])){
    $input = $_FILES['excel']['tmp_name'];
    $input_name = $_FILES['excel']['name'];
   
    $inputFileType = PHPExcel_IOFactory::createReaderForFile($input);
    
    $objPHPExcel = $inputFileType->load($input);

    $sheet =  $objPHPExcel->getActiveSheet();
    $highestRow = $sheet->getHighestRow();
    $highestCol = $sheet->getHighestColumn();

    for($row =1; $row <= $highestRow; $row++){
        $qstn =$sheet->getCell('B'.$row)->getValue();
        echo " ";

        $qns = mysqli_query($dbcon, "SELECT question_bank.*, questionnaire_category.question_category FROM question_bank JOIN questionnaire_category
        ON questionnaire_category.id = question_bank.questionnaire_category_id
        where question_bank.questions LIKE '%$qstn%'");
        //echo $qstn;
        //echo 'Hi-'.$qns;
        if(mysqli_num_rows($qns) > 0){
            echo 'This question already exists'.'<br>';
        
        } else{
            $string = $sheet->getCell('A'.$row)->getValue();
           // $string = preg_replace('/\s+/', '', $string); 
           $questions =  mysqli_real_escape_string($dbcon, $sheet->getCell('B'.$row)->getValue());
            $category = mysqli_fetch_assoc(mysqli_query($dbcon, "SELECT id FROM questionnaire_category WHERE question_category = '$string' "));
            $cs = $category['id'];
            $ins = "INSERT INTO question_bank(questionnaire_category_id, questions, option1, option2, option3,
            option4, answer) VALUES(
            '$cs', '$questions', '".$sheet->getCell('C'.$row)->getValue()."', 
            '".$sheet->getCell('D'.$row)->getValue()."', '".$sheet->getCell('E'.$row)->getValue()."',
            '".$sheet->getCell('F'.$row)->getValue()."', '".$sheet->getCell('G'.$row)->getValue()."')";
        
            if(mysqli_query($dbcon, $ins)){
                echo 'Success';
            }else{
                echo 'failed..'.mysqli_error($dbcon);
            }
        }
        
    }
   
}

?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Excel Uploader System</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.9.1/parsley.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- DataTables -->
        <link href="dataTable/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="dataTable/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="dataTable/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="dataTable/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="dataTable/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="dataTable/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <script src="dataTable/jquery.dataTables.min.js"></script>
        <script src="dataTable/dataTables.bootstrap4.min.js"></script>

        <style>
        .tableStyle{
            box-shadow: 0.5px 0.1rem 0.5rem rgba(0, 0, 0, 0.5);
            padding:2%;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="text-center text-primary">Simple Excel Upload System in Php & MySQL</h3>
            <form class="form-group mt-4" method="post" enctype="multipart/form-data" action="">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                        <label>Select Excel File</label>
                        <input class="form-control-sm" type="file" name="excel">
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                        <button class="btn btn-sm btn-success" type="submit" name="submit">Submit</button>
                    </div>
                </div>

            </form>
             <!--  -->
        <div class="tableStyle mb-4">
        <table id="dataId" class="table table-bordered">
            <thead>
                <th>Sr.No.</th>
                <th>Category</th>
                <th>Question</th>
                <th>OPT 1</th>
                <th>OPT 2</th>
                <th>OPT 3</th>
                <th>OPT 4</th>
                <th>Correct OPT</th>
                
            </thead>
            <tbody>
            <?php
                
                $s = 1;
                $qpost = mysqli_query($dbcon, "SELECT question_bank.*, questionnaire_category.question_category FROM question_bank JOIN questionnaire_category
                ON questionnaire_category.id = question_bank.questionnaire_category_id ORDER BY id DESC");
                
                while($dts = mysqli_fetch_assoc($qpost)){
                    echo '<tr>
                        <td>'.$s++.'</td>
                        <td>'.$dts['question_category'].'</td>
                        <td>'.$dts['questions'].'</td>
                        <td>'.$dts['option1'].'</td>
                        <td>'.$dts['option2'].'</td>
                        <td>'.$dts['option3'].'</td>
                        <td>'.$dts['option4'].'</td>
                        <td>'.$dts['answer'].'</td>
                        
                    </tr>';
                }
                    
            ?>
            </tbody>
        </table>
        </div>
        <!--  -->
        </div>
       
    </body>
</html>

<script>
$(document).ready(function() {
	$('#dataId').DataTable();
});
</script>