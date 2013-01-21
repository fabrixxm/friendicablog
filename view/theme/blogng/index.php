<?php
include 'ttfInfo.class.php'; 

define("FONT_DIR", "/media/nas/1_dati/fonts/");
define("CACHE_DIR","/media/nas/1_dati/fonts/.cache/");
define("LIST_PERPAGE", 40);

$file_db = new PDO('sqlite:data/fonts.sqlite3');
$file_db->setAttribute(PDO::ATTR_ERRMODE, 
                            PDO::ERRMODE_EXCEPTION);
// Create table messages
$file_db->exec("CREATE TABLE IF NOT EXISTS fonts (
                    name TEXT,
                    style TEXT,
                    file TEXT, 
                    hash TEXT,
                    PRIMARY KEY (file, hash))");
                    

/**
 * walk dir tree, call $callback on files
 * callback($dir, $file)
*/
function walk_for_file($dir, $callback){
    $cdir = scandir($dir);
    foreach ($cdir as $key => $value) { 
       if (!in_array($value,array(".",".."))) { 
          if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) { 
            walk_for_file($dir . DIRECTORY_SEPARATOR . $value, $callback); 
          } else { 
            call_user_func_array($callback, array($dir,$value));
          } 
       } 
    } 
   
}

function update_cb($dir, $file){
    global $file_db;
    $fullpath = $dir.DIRECTORY_SEPARATOR .$file;
    $stmt= $file_db->prepare('SELECT count(hash) FROM fonts WHERE file=:file');
    $stmt->bindValue(":file", $fullpath, PDO::PARAM_STR);
    if ($stmt->execute()){
        if ($stmt->fetchColumn() == 0) {
            $fontinfo = getFontInfo($fullpath);
            $hash = hash('md5', $fontinfo[1]);
            $insert = $file_db->prepare('INSERT INTO fonts (name, style, file, hash) VALUES (:name, :style, :file, :hash);');
            $insert->bindValue(":name", $fontinfo[1], PDO::PARAM_STR);
            $insert->bindValue(":style", $fontinfo[2], PDO::PARAM_STR);
            $insert->bindValue(":file", $fullpath, PDO::PARAM_STR);
            $insert->bindValue(":hash", $hash, PDO::PARAM_STR);
            $insert->execute();
        }
    }
    $stmt = null;

}

function get_abc(){
    global $file_db;
    $res = array("Tutti");
    $result = $file_db->query("SELECT name FROM fonts GROUP BY name ORDER BY name");
    foreach ($result as $row) {
        $char = strtoupper($row['name'][0]);
        if (!$char==""){
            if (!in_array($char, $res)) $res[] = $char;
        }
    }
    return $res;
}

function get_list($filter, $search, $page){
    global $file_db;
    if ($filter == "Tutti") $filter="%";
    $filter .= '%';
    $sqlextra = "name LIKE :filter";

    if (!is_null($search) && $search!="") {
        $search = '%'.$search.'%';
        $sqlextra .= " AND (name LIKE :search OR style LIKE :search)";
    }

    // pagination
    $stm = $file_db->prepare("SELECT count(hash) FROM fonts WHERE " . $sqlextra . " GROUP BY name");
    $stm->bindValue(":filter", $filter, PDO::PARAM_STR);
    if (!is_null($search) && $search!="") $stm->bindValue(":search", $search, PDO::PARAM_STR);
    $stm->execute();
    $totalcount = count($stm->fetchAll(PDO::FETCH_ASSOC));
    $totalpages = ceil($totalcount / LIST_PERPAGE);
    $start = $page * LIST_PERPAGE;
    
    

    $query = "SELECT *, count(name) as variations FROM fonts WHERE " . $sqlextra . " GROUP BY name ORDER BY name LIMIT :start,:len";
    $stm = $file_db->prepare($query);
    $stm->bindValue(":filter", $filter, PDO::PARAM_STR);
    if (!is_null($search) && $search!="") $stm->bindValue(":search", $search, PDO::PARAM_STR);
    $stm->bindValue(":start", $start, PDO::PARAM_INT);
    $stm->bindValue(":len", LIST_PERPAGE, PDO::PARAM_INT);
    $stm->execute();
    return array(
        'pagination' => array(
            'totalcount' => $totalcount,
            'totalpages' => $totalpages,
            'currentpage' => $page
        ),
        'items' => $stm->fetchAll(PDO::FETCH_ASSOC)
    );
}
function get_fonts($hash, $style=Null){
    global $file_db;
    $sqlextra = "";
    if (!is_null($style)) $sqlextra = "AND style = :style";
    
    $stm = $file_db->prepare("SELECT * FROM fonts WHERE hash = :hash ".$sqlextra);
    $stm->bindValue(":hash", $hash, PDO::PARAM_STR);
    if (!is_null($style)) $stm->bindValue(":style", $style, PDO::PARAM_STR);
    $stm->execute();
    return $stm->fetchAll(PDO::FETCH_ASSOC);
}

if (isset($_GET['op'])){
    switch($_GET['op']){
        case "update":
            walk_for_file(FONT_DIR, 'update_cb');
            echo '"Ok"';
            break;
        case "navbar":
            echo json_encode(get_abc());
            break;
        case "list":
            echo json_encode(get_list($_GET['filter'], $_GET['search'], $_GET['page']));
            break;
        case "font";
            $hash = $_GET['hash'];
            echo json_encode(get_fonts($hash));
            break;
        case "image":
            header('Content-Type: image/png');  
            
            $hash = $_GET['hash'];
            $style = $_GET['style'];
            $type = $_GET['type'];
            if (is_null($type) || ( $type!="big" && $type!="regular" ) ) $type="regular";
            /*if (is_file(CACHE_DIR.DIRECTORY_SEPARATOR.$hash.$type){
                echo file_get_contents(CACHE_DIR.DIRECTORY_SEPARATOR.$hash);
                die();
                }*/
            
            $fonts = get_fonts($hash, $style);
            
            if ($type=="big"){
                // Create the image
                $im = imagecreatetruecolor(600, 100);

                // Create some colors
                $white = imagecolorallocate($im, 255, 255, 255);
                $grey = imagecolorallocate($im, 128, 128, 128);
                $black = imagecolorallocate($im, 0, 0, 0);
                imagefilledrectangle($im, 0, 0, 600, 100, $white);

                // Replace path by your own font path
                $font = $fonts[0]['file'];

                // Add the text
                $text = "ABCDEFGHIJKLMNOPQERTUVWXYZ";
                imagettftext($im, 20, 0, 5, 20, $black, $font, $text);            
                $text = "abcdefghijklmnopqrstuvwxyz";
                imagettftext($im, 20, 0, 5, 50, $black, $font, $text);            
                $text = ".,:;-_!\"£$%&/()=?^";
                imagettftext($im, 20, 0, 5, 80, $black, $font, $text);            


            } else {
                // Create the image
                $im = imagecreatetruecolor(200, 50);

                // Create some colors
                $white = imagecolorallocate($im, 255, 255, 255);
                $grey = imagecolorallocate($im, 128, 128, 128);
                $black = imagecolorallocate($im, 0, 0, 0);
                imagefilledrectangle($im, 0, 0, 200, 50, $white);

                // The text to draw
                $text = $fonts[0]['name'];
                // Replace path by your own font path
                $font = $fonts[0]['file'];

                // Add the text
                imagettftext($im, 20, 0, 5, 30, $black, $font, $text);
            }
            // Using imagepng() results in clearer text compared with imagejpeg()
            imagepng($im);
            imagedestroy($im);
            break;
        case "dwl":
            $hash = $_GET['hash'];
            $style = $_GET['style'];
            $fonts = get_fonts($hash, $style);  
          
            header('Content-Type:font/truetype'); 
            header("Cache-Control: public");
            header("Content-Description: File Transfer");
            header("Content-Disposition: attachment; filename= " . basename($fonts[0]['file']));
            header("Content-Transfer-Encoding: binary");
            
            echo file_get_contents($fonts[0]['file']);
            break;
            
    }
    die();   
}


?>
<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Fonts</title>
  
  
  <!-- Included CSS Files (Compressed) -->
  <link rel="stylesheet" href="stylesheets/foundation.min.css">
  <link rel="stylesheet" href="stylesheets/app.css">

  <script src="javascripts/modernizr.foundation.js"></script>

  <!-- IE Fix for HTML5 Tags -->
  <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body>
    <div class="row">
        <div class="twelve columns">
            <h2>Fontology</h2>
        </div>
    </div>
    <div class="row">
        <div class="eight columns">
            <dl class="sub-nav">
                <dt data-bind="text: pagination().totalcount"></dt>
                <!-- ko foreach: navbar -->
                <dd data-bind="css: { active : $parent.currentNav() == $data }"><a href="#" data-bind="text: $data, click: $parent.changeFilter "></a></dd>
                <!-- /ko -->
            </dl>
        </div>
        <div class="four columns">
                    <input type="text" placeholder="Cerca..." data-bind="value: search"/>
        </div>
    </div>

    <div class="row">
        <div class="twelve columns">
            <ul class="pagination">
                  <li class="arrow" data-bind="css: {unavailable: pagination().firstpage }"><a href="#" data-bind="click:  pagination().prev">&laquo;</a></li>
                  <!-- ko foreach: pagination().pages -->
                  <li data-bind="css: { current : is_current }"><a href="#" data-bind="text: label, click: changeto"></a></li>
                  <!-- /ko -->
                  <li class="arrow" data-bind="css: {unavailable: pagination().lastpage }"><a href="#" data-bind="click:  pagination().next">&raquo;</a></li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="twelve columns">
            <ul class="block-grid four-up" data-bind="foreach: fontlist">
                <li>
                    <ul class="pricing-table">
                        <li class="title" data-bind="text: name"></li>
                        <li class="description"><img data-bind="attr: { src: image }"></img></li>
                        <li class="description" data-bind="text: vartext"></li>
                        <li class="cta-button"><a class="button" href="#"  data-bind="click: $parent.showDetails">Dettagli &raquo;</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>


    <div class="row">
        <div class="twelve columns">
            <ul class="pagination">
                  <li class="arrow" data-bind="css: {unavailable: pagination().firstpage }"><a href="#" data-bind="click: pagination().prev">&laquo;</a></li>
                  <!-- ko foreach: pagination().pages -->
                  <li data-bind="css: { current : is_current }"><a href="#" data-bind="text: label, click: changeto"></a></li>
                  <!-- /ko -->
                  <li class="arrow" data-bind="css: {unavailable: pagination().lastpage }"><a href="#" data-bind="click:  pagination().next">&raquo;</a></li>
            </ul>
        </div>
    </div>
    
    
    <div id="fontDetail" class="reveal-modal large">
        <h2 data-bind="text: currentfontname()"></h2>
        <!-- ko  foreach: currentfont -->
        <div class="row">
            <div class="twelve columns"><img data-bind="attr: { src: imagebig }"></img></div>
        </div>
        <div class="row panel">
            <div class="nine columns" data-bind="text: style"></div>
            <div class="three columns"><a href="#" class="button" data-bind="attr: { href: url }">Download &raquo;</a></div>            
        </div>
        <!-- /ko -->
        <a class="close-reveal-modal">&#215;</a>
    </div>
  <!-- Included JS Files (Compressed) -->
  <script src="javascripts/jquery.js"></script>
  <script src="javascripts/foundation.min.js"></script>
  <script src="javascripts/knockout-2.2.0.js"></script>
  
  <!-- Initialize JS Plugins -->
  <script src="javascripts/app.js"></script>

  
    <script>
    function FontModel(data){
        this.name =  ko.observable(data.name);
        this.style = ko.observable(data.style);
        this.hash = ko.observable(data.hash);
        this.file = ko.observable(data.file);
        this.variations = ko.observable(data['variations']);
        this.vartext =  ko.computed(function() {
            var t = "variant";
            if (this.variations()==1) { t+="e"; } else { t+="i"; }
            return this.variations() + " " + t;
        }, this);
        this.image = ko.computed(function() {
            return "index.php?op=image&hash=" + encodeURIComponent(this.hash())+"&style="+ encodeURIComponent(this.style());
        }, this);
        this.imagebig = ko.computed(function() {
            return "index.php?op=image&type=big&hash=" + encodeURIComponent(this.hash())+"&style="+ encodeURIComponent(this.style());
        }, this);
        this.url =  ko.computed(function() {
            return "index.php?op=dwl&hash=" + encodeURIComponent(this.hash()) + "&style="+ encodeURIComponent(this.style());
        }, this);
    }
    
    function PaginationModel(data) {
        var self = this;
        self.totalcount = ko.observable(data.totalcount);
        self.currentpage = ko.observable(data.currentpage);
        self.totalpages = ko.observable(data.totalpages);
        self.update = function(data) {
            self.totalcount(data.totalcount);
            self.currentpage(data.currentpage);
            self.totalpages(data.totalpages);
        }
        self.pages =  ko.computed(function() {
            var pages = [];
            for(k=1; k<=self.totalpages(); k++) {
                pages.push({
                    label:k,
                    page:k-1,
                    is_current: (k-1 == self.currentpage()),
                    changeto : self.changeto
                });
            }
            return pages
        });
        
        self.firstpage = ko.computed(function() {
            return (self.currentpage()==0);
        });
        self.lastpage = ko.computed(function() {
            return (self.currentpage()==self.totalpages()-1);
        });

        self.changeto = function(page) {
            self.currentpage(page.page);
        }
        
        self.next = function () {
            if (!self.lastpage()) self.currentpage( 1 + parseInt(self.currentpage()) );
        }

        self.prev = function () {
            if (!self.firstpage()) self.currentpage(parseInt(self.currentpage()) - 1 );
        }

    }
    
    function FontListModel(){
        var self = this;
        
        self.currentNav = ko.observable("");
        self.navbar = ko.observableArray([]);
        self.fontlist = ko.observableArray([]);
        self.pagination = ko.observable(new PaginationModel({
            totalcount: 0,
            totalpages: 0,
            currentpage: 0
        }));
        self.currentfont = ko.observableArray([]);
        self.currentfontname = ko.computed(function(){
            if (self.currentfont().length>0)
                return self.currentfont()[0].name;
            return "";
        });
        
        self.searchterm = "";
        this.search = ko.computed({
            read: function() { return self.searchterm; },
            write: function(value) {
                console.log(value);
                self.searchterm = value;
                self.updateList();
            },
        });
        
    
        self.updateList = ko.computed(function() {
            $.getJSON("index.php", {op:'list', filter: self.currentNav, page: self.pagination().currentpage(), search : self.searchterm }, function(allData) {
                self.pagination().update(allData['pagination']);
                self.fontlist.removeAll();
                $.map(allData['items'], function(item) { 
                    self.fontlist.push(new FontModel(item));
                });
            });
        });


        self.changeFilter = function(filter) {
            self.pagination().currentpage(0);
            self.currentNav(filter);
            
        }
    
        self.showDetails = function(font) {
            $.getJSON("index.php", {op:'font', hash: font.hash()}, function(allData) {
                self.currentfont.removeAll();   
                $.map(allData, function(item) { 
                    self.currentfont.push(new FontModel(item));
                });
                $("#fontDetail").reveal();
            });            
        }
    
    
        // load navbar
        $.getJSON("index.php", {op:'navbar'}, function(allData) {
            self.navbar(allData);
            self.currentNav(allData[0]);
            self.updateList();
        }); 

    }
    
    ko.applyBindings(new FontListModel()); 
    
    
    /*$(window).load(function(){
      $("#featured").orbit();
    });*/
    </script> 
  
</body>
</html>




<?php
$file_db = null;
?>


