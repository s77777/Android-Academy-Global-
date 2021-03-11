<?php

class Filter extends FilterIterator
{
    private $userFilter;
    private $currentField;
   
    public function __construct(Iterator $iterator , $filter, $currentField=Null)
    {
        parent::__construct($iterator);
        $this->userFilter = $filter;
        $this->currentField = $currentField;
        
    }
   
    public function accept()
    {
        $current = $this->getInnerIterator()->current();
        if (is_array($current) && !empty($current[$this->currentField]))
            $var_search = $current[$this->currentField];
        else
            $var_search = $current;
        if( $this->userFilter != $var_search) {
            return false;
        }       
        return true;
    }
}
