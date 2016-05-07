<?php
  class korektebla_kurso extends Db {
    var $id;
    var $korektanto;
    var $kurso;
    var $kiom_lernantoj=0;
    
  function get_id() {
      return $this->id;
    }

    function set_id($id) {
      $this->id = $id;
    }    
    
    function get_korektanto() {
      return $this->korektanto;
    }

    function set_korektanto($korektanto) {
      $this->korektanto = $korektanto;
    }

    function get_kurso() {
      return $this->kurso;
    }

    function set_kurso($kurso) {
      $this->kurso = $kurso;
    }

    function get_kiom_lernantoj() {
      return $this->kiom_lernantoj;
    }

    function set_kiom_lernantoj($kiom_lernantoj) {
      $this->kiom_lernantoj = $kiom_lernantoj;
    }

    function store() {
      if($this->get_id() !="") {
        return $this->update();
      }
      return $this->insert();
    }

    function insert() {
      $sql = sprintf("insert into korektebla_kurso (korektanto,kurso,kiom_lernantoj) values ('%s','%s','%s')",addslashes($this->get_korektanto()),addslashes($this->get_kurso()),addslashes($this->get_kiom_lernantoj()));
      $qid = mysql_query($sql,$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      $this->set_id(mysql_insert_id());
      return 1;
    }

    function update() {
      $sql = sprintf("update korektebla_kurso set kiom_lernantoj = '%s' where korektanto = '%s' and kurso = '%s'",addslashes($this->get_kiom_lernantoj()),$this->get_korektanto(),$this->get_kurso());
      $qid = mysql_query($sql,$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      $this->set_id(mysql_insert_id());
      return 1;
    }

    function delete() {
      $sql = sprintf("delete from korektebla_kurso where id = '%s'",
                     addslashes($this->get_id()));
      $qid = mysql_query($sql,$this->get_dbh());
      if(TRUE!=$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      return 1;
    }

    function load_by_korektanto($k) {
      $recs;
      $sql = sprintf("select korektebla_kurso.korektanto,korektebla_kurso.kurso,korektebla_kurso.kiom_lernantoj from korektebla_kurso where korektanto = '%s'",$k);
      $qid = mysql_query($sql,$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      while($row = mysql_fetch_array($qid)) {
    	$obj = new korektebla_kurso;
    	$obj->set_id($row[1].$row[0]);
	$obj->set_korektanto($row[0]);
	$obj->set_kurso($row[1]);
        	$obj->set_kiom_lernantoj($row[2]);
        	$recs[] = $obj;
    }      
     mysql_free_result($qid);
      return $recs;
    }
    
    function load_by_kurso($kurso,$lingvo) {
      $recs;
      $sql = sprintf("select korektebla_kurso.korektanto,korektebla_kurso.kurso,korektebla_kurso.kiom_lernantoj from korektebla_kurso,personoj where korektebla_kurso.kurso = '%s' and personoj.lingvo='%s' and personoj.id=korektebla_kurso.korektanto",$kurso,$lingvo);
      $qid = mysql_query($sql,$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      while($row = mysql_fetch_array($qid)) {
    	$obj = new korektebla_kurso;
    	$obj->set_id($row[1].$row[0]);
	$obj->set_korektanto($row[0]);
	$obj->set_kurso($row[1]);
        	$obj->set_kiom_lernantoj($row[2]);
        	$recs[] = $obj;
    }      
     mysql_free_result($qid);
      return $recs;
    }    
    
    function load_by_korektanto_kaj_kurso($korektanto,$kurso) {
      $sql = sprintf("select korektanto,kurso,kiom_lernantoj from korektebla_kurso where korektanto = '%s' and kurso = '%s'",$korektanto,$kurso);
      $qid = mysql_query($sql,$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return 0;
      }
      $row = mysql_fetch_array($qid); 
      $this->set_id($row[1].$row[0]);
      $this->set_korektanto($row[0]);
      $this->set_kurso($row[1]);
      $this->set_kiom_lernantoj($row[2]);
     mysql_free_result($qid);
      return 1;
    }        

    function get_all_objects() {
      $recs;
      $qid = mysql_query('select korektanto,kurso,kiom_lernantoj from korektebla_kurso',$this->get_dbh());
      if(0==$qid) {
        $this->set_errno(mysql_errno());
        $this->set_errstr(mysql_error());
        return $recs;
      }
      while($row = mysql_fetch_array($qid)) {
        $obj = new korektebla_kurso;
        $obj->set_id($row[1].$row[0]);
        $obj->set_korektanto($row[0]);
        $obj->set_kurso($row[1]);
        $obj->set_kiom_lernantoj($row[2]);
        $recs[] = $obj;
      }
      mysql_free_result($qid);
      return $recs;
    }

  }

?>
