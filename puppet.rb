node 'ploneconf.puppet' {
    package { 'apache2': ensure => installed }
    appie::app { "ploneconfapp":
        envs => {
            prd => { uid => 3011 },
            acc => { uid => 3012 },
            tst => { uid => 3013 },
         },
        webserver => 'apache2',
        accountinfo => $gw20e::user_accounts,
    }
    class { 'ssh':
        server_options => {
            'PasswordAuthentication' => 'no',
            'PermitRootLogin' => 'no',
        },
    }
}
