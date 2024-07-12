<?php

class AntiPattern
{
    public function fetch($url)
    {
        // We can't test this!
        $file = new Filesystem();
        return $this->data = $file->get($url);
    }
}

//better:
class SomeClass
{
    protected $file;

    public function __construct(Filesystem $file)
    {
        $this->file = $file;
    }

    public function fetch($url)
    {
        return $this->data = $this->file->get($url);
    }
}

class Testing
{
    public function testFetchesData()
    {
        $file = Mockery::mock("Filesystem");
        $file->shouldReceive("get")->once()->andReturn("foo");

        $someClass = new SomeClass($file);
        $data = $someClass->fetch("https://example.com");

        $this->assertEquals("foo", $data);
    }
}
