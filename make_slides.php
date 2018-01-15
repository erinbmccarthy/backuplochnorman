<?php

function has_no_emailheaders($text)
{
   return preg_match("/(%0A|%0D|\\n+|\\r+)(content-type:|to:|cc:|bcc:)/i", $text) == 0;
}
foreach ($_POST as $field)
if(!has_no_emailheaders($field))
exit("invalid content");

//require('FirePHPCore/fb.php');
//ob_start();
//fb('Hello World');

$slide_directory            = filter_var($_POST["slide_directory"], FILTER_SANITIZE_STRING);
$alt_attributes             = filter_var($_POST["alt_attributes"], FILTER_SANITIZE_STRING);
$custom_data                = filter_var($_POST["custom_data"], FILTER_SANITIZE_STRING);
$first_last_buttons         = filter_var($_POST["first_last_buttons"], FILTER_SANITIZE_STRING);
$first_slide_is_intro       = filter_var($_POST["first_slide_is_intro"], FILTER_SANITIZE_STRING);
$hover_next_prev_buttons    = filter_var($_POST["hover_next_prev_buttons"], FILTER_SANITIZE_STRING);
$target_attributes          = filter_var($_POST["target_attributes"], FILTER_SANITIZE_STRING);
$next_prev_buttons          = filter_var($_POST["next_prev_buttons"], FILTER_SANITIZE_STRING);
$pause_button               = filter_var($_POST["pause_button"], FILTER_SANITIZE_STRING);
$path_to_slides             = filter_var($_POST["path_to_slides"], FILTER_SANITIZE_STRING);
$slide_buttons              = filter_var($_POST["slide_buttons"], FILTER_SANITIZE_STRING);
$doctype                    = filter_var($_POST["doctype"], FILTER_SANITIZE_STRING);
$slide_links_list           = filter_var($_POST["slide_links"], FILTER_SANITIZE_STRING);
$slide_number_display       = filter_var($_POST["slide_number_display"], FILTER_SANITIZE_STRING);
$slide_captions             = filter_var($_POST["slide_captions"], FILTER_SANITIZE_STRING);
$water_mark                 = filter_var($_POST["water_mark"], FILTER_SANITIZE_STRING);
$carousel_html              = '';

// validate included file

//make sure path to incuded is relative
$custom_data_url_test  = parse_url($custom_data);
if (isset($custom_data_url_test['scheme']) || isset($custom_data_url_test['host'])) {
$custom_data = NULL;
}
//make sure the file name contains 'agile_carousel'
$custom_data_name_test = preg_split('_[\\\\/]_', $custom_data);
$custom_data_name_test = end($custom_data_name_test);
$custom_data_name_test = strpos($custom_data_name_test,'agile_carousel');
if ($custom_data_name_test === false) {
$custom_data = NULL;
}
//make sure the path does not contain '..'
$custom_data_dot_dot_test = strpos($custom_data,'..');
if ($custom_data_dot_dot_test == TRUE || $custom_data_dot_dot_test === 0) {
$custom_data = NULL;
}

// include custom_data file if available

ob_start();
if($custom_data != 'no' && $custom_data != null){
include($custom_data);
}
ob_end_clean();

// the included file should follow this format and contain at least one of the below array members
/*
$custom_data_arr = array(
	'custom_slide_files'       => "dogs_agile_carousel/00_agile_carousel_intro.swf,dogs_agile_carousel/slide_01.jpg,dogs_agile_carousel/slide_02.jpg,dogs_agile_carousel/slide_03.jpg,dogs_agile_carousel/slide_04.jpg,dogs_agile_carousel/slide_05.jpg",
	'custom_slide_links'       => "NA,http://www.ibm.com,http://www.apple.com,http://www.dell.com,http://www.gateway.com,http://www.sonystyle.com",
	'custom_target_attributes' => "NA,_blank,_blank,_blank,_blank,_blank",
	'custom_slide_captions'    => "Slide 1x|Slide 2x|Slide 3x|Slide 4x|Slide 5x",
	'custom_alt_attributes'    => "NA,Slide 1,Slide 2,Slide 3,Slide 4,Slide 5"
);
*/

//validate slide directory

//make sure path to directory is relative
$slide_directory_url_test  = parse_url($slide_directory);
if (isset($foo_url_test['scheme']) || isset($foo_url_test['host'])) {
$slide_directory = NULL;
}
//make sure the directory name contains 'agile_carousel'
$slide_directory_name_test = preg_split('_[\\\\/]_', $slide_directory);
$slide_directory_name_test = end($slide_directory_name_test);
$slide_directory_name_test = strpos($slide_directory_name_test,'agile_carousel');
if ($slide_directory_name_test === false) {
$slide_directory = NULL;
}
//make sure the path does not contain '..'
$slide_directory_dot_dot_test = strpos($slide_directory,'..');
if ($slide_directory_dot_dot_test == TRUE || $slide_directory_dot_dot_test === 0) {
$slide_directory = NULL;
}

$carousel_html .= "<div id='slide_holder_inner'>";

if ($hover_next_prev_buttons == "yes") {
    $carousel_html .= "<div id='hover_prev_button' class='prev_button hover_button'><span>prev</span></div>";
    $carousel_html .= "<div id='hover_next_button' class='next_button hover_button'><span>next</span></div>";
}
if ($water_mark != "no") {
    $carousel_html .= "<div id='water_mark' class='water_mark'><span>". $water_mark ."</span></div>";
}
$carousel_html .= "<div id='row_of_slides'>";

if($doctype == 'html'){
	$close_tag = '>';
} elseif($doctype == 'xhtml'){
	$close_tag = '/>';
} else {
	$close_tag = '>';
}

if($custom_data_arr['custom_slide_links'] == null){
	$slide_links              = (explode(",",$slide_links_list));
} else {
	$slide_links              = (explode(",",$custom_data_arr['custom_slide_links']));
}
if($custom_data_arr['custom_target_attributes'] == null){
	$link_target_attributes   = (explode(",",$target_attributes));
} else {
	$link_target_attributes   = (explode(",",$custom_data_arr['custom_target_attributes']));	
}
if($custom_data_arr['custom_alt_attributes'] == null){
	$img_alt_attributes       = (explode(",",$alt_attributes));
} else {
	$img_alt_attributes       = (explode(",",$custom_data_arr['custom_alt_attributes']));		
}
if($custom_data_arr['custom_slide_files'] == null){
	$slide_files               = scandir($slide_directory);
} else {
	$slide_files               = $custom_data_arr['custom_slide_files'];
	$slide_files               = (explode(",",$slide_files));
}
if($custom_data_arr['custom_slide_captions'] != null){
	$slide_captions           = $custom_data_arr['custom_slide_captions'];
}

$counter    = 1;
$slide_type = "";

foreach ($slide_files as $slide_file) {
	
	if($custom_data_arr['custom_slide_files'] != null) {
		$path_to_slide = $slide_file;
	} else {
		$path_to_slide = $path_to_slides."/".$slide_file;
	}
	
    if (preg_match('/^.*\.jpe?g$|^.*\.gif$|^.*\.png$/i', $slide_file)) {
        $slide_type = 'image_slide';
    }
    else if (preg_match('/^.*\.htm$|^.*\.html$/i', $slide_file)) {
        $slide_type = 'html_slide';
    }
    else if (preg_match('/^.*\.swf$/i', $slide_file)) {
        $slide_type = 'swf_slide';
    } else {}
    switch ($slide_type) {
        case 'image_slide':
        $curr_index = $counter - 1;
        $link_value = $slide_links[$curr_index];
		$target_attribute_value = $link_target_attributes[$curr_index];
		$alt_attribute_value = $img_alt_attributes[$curr_index];
            if ($first_slide_is_intro == 'yes') {
	        if ($counter == 1) {
     	        $carousel_html .= "<div class='intro' id='intro'>";
            } else {
     	        $counter_w_intro = $counter - 1;
		        $carousel_html .= "<div class='slide' id='slide_$counter_w_intro'>";
            }}  else if ($first_slide_is_intro != 'yes') {
                $carousel_html .= "<div class='slide' id='slide_$counter'>";	} // else if		
			if($slide_links_list != 'no') {
                if($link_value != null){
                    $carousel_html .= "<a href='$link_value'";
					if($include_target_attributes != 'no'){
					$carousel_html .= " target='".$target_attribute_value."'";
					}
					$carousel_html .= ">";
                };
            }
        $carousel_html .= "<img src='$path_to_slide'";
		if($alt_attributes != 'no'){
			$carousel_html .= " alt='".$alt_attribute_value."'";
		}
		$carousel_html .= $close_tag;
            if($slide_links_list != 'no') {
                if($link_value != null){
                    $carousel_html .= "</a>";
                };
            }
        $carousel_html .= "</div>";
        $counter++;
        break;

        case 'html_slide':
        // had to repeat regex to make it work. was accepting .php, .js. why???
            if ((preg_match('/^.*\.htm$|^.*\.html$/i', $slide_file))){
			if ($first_slide_is_intro == 'yes') {
	            if ($counter == 1) {
     	            $carousel_html .= "<div class='intro' id='intro'>";
                } else  {
     	            $counter_w_intro = $counter - 1;
		            $carousel_html .= "<div class='slide' id='slide_$counter_w_intro'>";
            }}  else if ($first_slide_is_intro != 'yes') {   
			$carousel_html .= "<div class='slide' id='slide_$counter'>";} // else if
                $carousel_html .= file_get_contents("$path_to_slide");
                $carousel_html .= "</div>";
                $counter++;
            } //if
        break;

        case 'swf_slide':
            $size = getimagesize("$path_to_slide");			
				if ($first_slide_is_intro == 'yes') {
	                
					if ($counter == 1) {
 		            $carousel_html .= "<div class='intro' id='intro'>";
     	              	           
                    } else { 
					$counter_w_intro = $counter - 1; 
					$carousel_html .= "<div class='slide' id='slide_$counter_w_intro'>"; 
					}
		             
                 } else if ($first_slide_is_intro != 'yes') {   
            $carousel_html .= "<div class='slide' id='slide_$counter'>"; } //else if
            $carousel_html .= "<object type='application/x-shockwave-flash' data='$path_to_slide' width='$size[0]' height='$size[1]'>";
            $carousel_html .= "<param name='movie' value='$path_to_slide'$close_tag<param name='WMode' value='opaque'$close_tag</object>";
            $carousel_html .= "</div>";
            $counter++;
            break;

        default:
        break;
    } // switch
} // foreach

$carousel_html .= "</div><div id='carousel_controls'>";

if($slide_number_display == "yes"){
$carousel_html .= "<div class='slide_number_display' id='slide_number_display'><span></span></div>";
}

// make buttons

if($pause_button == "yes") { 
    $carousel_html .= "<div class='pause_button' id='pause_button'><span>pause</span></div>";
};
if($slide_buttons == "yes") { 
    $carousel_html .= "<ul id='slide_buttons'>";
$button_number = 1;
	if ($first_slide_is_intro != 'yes') {
	
		while ($button_number <= ($counter -1 ) ) {
		    $carousel_html .= "<li class='slide_$button_number'><span>$button_number</span></li>";
		    $button_number++;
		} // while
	} // if
	if ($first_slide_is_intro  == 'yes') {
		$button_counter_w_intro = $counter - 1;
		while ($button_number <= ($button_counter_w_intro -1 ) ) {
	    $carousel_html .= "<li class='slide_$button_number'><span>$button_number</span></li>";
	    $button_number++;
		} // while
	} // if
$carousel_html .= "</ul>";
};
if ($next_prev_buttons == "yes") {
    $carousel_html .= "<div id='prev_button' class='prev_button'><span>&lt; prev</span></div>";
    $carousel_html .= "<div id='next_button' class='next_button'><span>next &gt;</span></div>";
}
if ($first_last_buttons == "yes") {
    $carousel_html .= "<div id='first_button' class='first_button'><span>first &gt;&gt;</span></div>";
    $carousel_html .= "<div id='last_button' class='first_button'><span>&lt;&lt; last</span></div>";
}
if ($slide_captions != "no") {
    $carousel_html .= "<div id='slide_captions' class='slide_captions'><span></span></div>";
}
$carousel_html .= "</div></div>";
$carousel_html = json_encode($carousel_html);
echo "{";
echo "\"html_output\":$carousel_html,";
echo "\"slide_captions\":\"$slide_captions\"";
echo "}";

?>