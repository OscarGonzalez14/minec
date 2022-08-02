<?php ob_start();
use Dompdf\Dompdf;

require_once('../dompdf/autoload.inc.php');
require_once('../config/conexion.php');
require_once('../modelos/Reporteria.php');

require "vendor/autoload.php";
$Bar = new Picqer\Barcode\BarcodeGeneratorHTML();

$reporteria= new Reporteria;

$codigos = $_GET["orders"];
$array_codigos=explode(",", $codigos);

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <style>
  html{
    margin-top: 2;
    margin-left: 8px;
    margin-right:8px; 
    margin-bottom: 0;
  }
  body{
    font-family: Helvetica, Arial, sans-serif;
    font-size: 11px;
  }
  .stilot1{
    border: 1px solid black;
    padding: 2px;
    font-size: 11px;
    font-family: Helvetica, Arial, sans-serif;
    text-align: center;

  }
  .table2 {
    border-collapse: collapse;
  }
  .encabezado{
    background: #E8E8E8;
  }
</style>
</head>

</body>
<?php
echo '<table width="100%">';  
  for($i=0;$i<count($array_codigos);$i++){
    $item = $array_codigos[$i];
    $code = $Bar->getBarcode($item, $Bar::TYPE_CODE_128,'1','45');
    $resultado = $reporteria->print_orden($item);
    if($i % 2 == 0){
      echo "<tr>";
    }
    foreach ($resultado as $key) {
    echo "<td>";
     
    echo "<table class='table2' width='100%' style='margin-top;0px !important'>";
    echo "
     <tr>
      <td colspan='25'>
        <img src='../dist/img/minec_transp.png' width='150' height='55'>
      </td>
      <td colspan='50' style='text-align:left;'>";
      echo date("d-m-Y",strtotime($key["fecha"]))."".$code; echo $item." - Id:<b>". $key["id_orden"]."</b>";
      echo "</td>
      <td colspan='25' align='right' style='text-align:right'>
        <img src='../dist/img/logooficial.jpg' width='50' height='25'>
      </td>
     </tr>";




      echo "
      <tr>
      <td class='stilot1' colspan='100' style='text-align:center;text-transform:uppercase'>".$key["tipo_lente"]." - ".$key["lente_man"]."</td>
      </tr>
      <tr>
      <td class='stilot1' colspan='60' style='text-align:center;text-transform:uppercase'>".$key["usuario"]."</td>
      <td class='stilot1' colspan='40' style='text-align:center;text-transform:uppercase'>".$key["laboratorio"]."</td>
      </tr>
      <tr style='height: 14px'>
        <td class='stilot1 encabezado' colspan='60'><b style='padding: 0px'>Paciente:</b></td>
        <td class='stilot1 encabezado' colspan='25'><b style='padding: 0px'>DUI</b></td>
        <td class='stilot1 encabezado' colspan='15'><b style='padding: 0px'>Edad:</b></td>
      </tr>
      <tr>
        <td class='stilot1' colspan='60' style='text-transform:uppercase;font-size:10px'>".$key["paciente"]."</td>
        <td class='stilot1' colspan='25'>".$key["dui"]."</td>
        <td class='stilot1' colspan='15'>".$key["edad"]."</td>
      </tr>

      <tr class='encabezado'>
      <th style='text-align: center;' colspan='20' class='stilot1'><b>OJO</b></th>
        <th style='text-align: center;' colspan='20' class='stilot1'><b>Esfera</b></th>
        <th style='text-align: center;' colspan='20' class='stilot1'><b>Cilindro</b></th>
        <th style='text-align: center;' colspan='20' class='stilot1'><b>Eje</b></th>
        <th style='text-align: center;' colspan='20' class='stilot1'><b>Adición</b></th>
      </tr>
      <tr>
        <td colspan='20' class='stilot1'><b>OD</b></td>
        <td colspan='20' class='stilot1'>".$key["od_esferas"]."</td>
        <td colspan='20' class='stilot1'>".$key["od_cilindros"]."</td>
        <td colspan='20' class='stilot1'>".$key["od_eje"]."</td>
        <td colspan='20' class='stilot1'>".$key["od_adicion"]."</td>
      </tr>
    <tr>
      <td colspan='20' class='stilot1'><b>OI</b></td>
      <td colspan='20' class='stilot1'>".$key["oi_esferas"]."</td>
      <td colspan='20' class='stilot1'>".$key["oi_cilindros"]."</td>
      <td colspan='20' class='stilot1'>".$key["oi_eje"]."</td>
      <td colspan='20' class='stilot1'>".$key["oi_adicion"]."</td>
    </tr>
    <tr>
    <td colspan='30' class='stilot1 encabezado' style='height:10px'>Dist. Pupilar</td>
    <td colspan='30' class='stilot1 encabezado' style='height:10px'>Altura de lente</td>
    <td colspan='40' class='stilot1 encabezado' style='height:10px'>Agudeza visual</td>
    </tr>
    
    <tr>
      <td colspan='15' class='stilot1'><b>OD</b></td>
      <td colspan='15' class='stilot1'><b>OI</b></td>
      <td colspan='15' class='stilot1'><b>OD</b></td>
      <td colspan='15' class='stilot1'><b>OI</b></td>
      <td colspan='20' class='stilot1'><b>AVsc</b></td>
      <td colspan='20' class='stilot1'><b>AVfinal</b></td>
    </tr>
    
    <tr>
      <td colspan='15' class='stilot1'>".$key["pupilar_od"]." mm</td>
      <td colspan='15' class='stilot1'>".$key["pupilar_oi"]." mm</td>
      <td colspan='15' class='stilot1'>".$key["lente_od"]." mm</td>
      <td colspan='15' class='stilot1'>".$key["lente_oi"]." mm</td>
      <td colspan='20' class='stilot1'>".$key["avsc"]."</td>
      <td colspan='20' class='stilot1'>".$key["avfinal"]."</td>
    </tr>
  
    <tr class='encabezado'>
      <td colspan='15' class='stilot1'><b>Mod. aro</b></td>
      <td colspan='25' class='stilot1'><b>Marca Aro</b></td>
      <td colspan='15' class='stilot1'><b>AR.</b></td>
      <td colspan='15' class='stilot1'><b>Photo</b></td>
      <td colspan='15' class='stilot1'><b>Transit.</b></td>
      <td colspan='15' class='stilot1'><b>Blueuv</b></td>
    </tr>
    <tr>
      <td colspan='15' class='stilot1'>".$key["modelo_aro"]."</td>
      <td colspan='25' class='stilot1' style='font-size:9px'>".$key["marca_aro"]."</td>
      <td colspan='15' class='stilot1'>".$key["ar"]."</td>
      <td colspan='15' class='stilot1'>".$key["photo"]."</td>
      <td colspan='15' class='stilot1'>".$key["transition"]."</td>
      <td colspan='15' class='stilot1'>".$key["blueuv"]."</td>
    </tr>
    <tr>
      <td colspan='100' class='stilot1' style='text-align:left;padding:2px'>".$key["observaciones"]."</td>
    </tr>
    </tr>


      ";
    }
  

    echo "</table><br>";
    
    echo "</td>";

    if ($i % 2 != 0) {
      echo "</tr>";
    }
  }
  echo '</table>';
  
?>

</body>
</html>

<?php
$salida_html = ob_get_contents();

ob_end_clean();
$dompdf = new Dompdf();
$dompdf->loadHtml($salida_html);
$dompdf->setPaper('letter', 'portrait');
$dompdf->render();
$dompdf->stream('document', array('Attachment'=>'0'));
?>