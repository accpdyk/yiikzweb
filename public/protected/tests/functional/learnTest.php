<?php

class learnTest extends WebTestCase
{
	public $fixtures=array(
		'learns'=>'learn',
	);

	public function testShow()
	{
		$this->open('?r=learn/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=learn/create');
	}

	public function testUpdate()
	{
		$this->open('?r=learn/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=learn/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=learn/index');
	}

	public function testAdmin()
	{
		$this->open('?r=learn/admin');
	}
}
