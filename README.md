#puppet-wkhtmltopdf

Puppet module to install wkhtmltopdf

##Example usage:
```
wkhtmltopdf { '0.11.0_rc1': }
```

##Available options
```
wkhtmltopdf { '0.11.0_rc1': 
  'version' => '0.11.0_rc1'
  'arch' => 'amd64',
  'target_dir' => '/usr/local/bin',
}
```