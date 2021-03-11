<?php
/*
 * Класс загрузки фото на сервер
 *
 */
namespace app\Classes;

class FileUpload extends Page {

    function initialize()
    {
        $this->SetViewDisable();
        try
        {
            $data= $this->getPostData();
            $data['success']=false;
            if ($_SESSION['secret']==md5($this->secret.$_COOKIE['PHPSESSID']))
            {
                if (is_uploaded_file($_FILES['file']['tmp_name'])) {
                    $fname=$_FILES['file']['name'];
                    $res = move_uploaded_file($_FILES['file']['tmp_name'], APP_PATH_UPLOAD.$fname);
                    if ($res) {
                        $fnewname= $this->translit($fname);
                        rename(APP_PATH_UPLOAD.$fname, APP_PATH.'public/download/'.$fnewname);
                        $data['success']=true;
                        $data['filename']=$fnewname;
                        $sql='UPDATE users SET foto="'.$fnewname.'" WHERE id=?';
                        $this->db->InsertUpdateData($sql,array($data['id']));
                    }
                }
            }
            return $data;
        }
        catch ( Exception $e )
        {
            die ( $e->getMessage().'**FileUpload');
        }
    }

    /*
     * Транслит имен файлов
     */

    function renameFiles($pathDir)
    {
        $it = new DirectoryIterator($pathDir);
        foreach ($it as $finfo) {
            if (!$finfo->isDot()) {
                $fname = $finfo->getFilename();
                if ($finfo->isDir()) {
                    $this->renameFiles($pathDir.'/'.$fname);
                }
                $fnewname= $this->translit($fname);
                rename($pathDir.'/'.$fname, $pathDir.'/'.$fnewname);
            }
        }
        return true;
    }

    function  translit($fname)
    {
        if(!preg_match ("/[А-Яа-я]/u", $fname)) {
            $fname=iconv('cp866','UTF-8//IGNORE',
                    iconv('cp437', 'cp865//IGNORE',
                     iconv('UTF-8', 'cp437//IGNORE',$fname)));
        }
        $translit=['а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'j','з'=>'z','и'=>'i','й'=>'y','к'=>'k','л'=>'l',
                    'м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c',
                    'ч'=>'ch','ш'=>'sh','щ'=>'shch','ы'=>'y','э'=>'e','ю'=>'yu','я'=>'ya','ъ'=>'','ь'=>''];
        $cyr= array_keys($translit);
        $lat= array_values($translit);
        return str_replace($cyr,$lat,mb_strtolower($fname));
    }
}


