#
class brl::users {

  group { 'yabidemo':
    gid => 1002,
  } ->

  user { 'yabidemo':
    uid        => 1002,
    gid        => 1002,
    shell      => '/bin/bash',
    home       => '/yabidata/home/yabidemo',
    managehome => true,
  }

  group { 'yabiccg':
    gid => 1003,
  } ->

  user { 'yabiccg':
    uid        => 1003,
    gid        => 1003,
    shell      => '/bin/bash',
    home       => '/yabidata/home/yabiccg',
    managehome => true,
  }

  group { 'yabiother':
    gid => 1004,
  } ->

  user { 'yabiother':
    uid        => 1004,
    gid        => 1004,
    shell      => '/bin/bash',
    home       => '/yabidata/home/yabiother',
    managehome => true,
  }

  group { 'ccgstaff':
    gid => 1005,
  } ->

  user { 'ccgstaff':
    uid        => 1005,
    gid        => 1005,
    shell      => '/bin/bash',
    home       => '/brldata/home',
    managehome => true,
  }

  group { 'pbcrc2002':
    gid => 1006,
  } ->

  user { 'pbcrc2002':
    uid        => 1006,
    gid        => 1006,
    shell      => '/bin/bash',
    home       => '/pbcrc2002data/home',
    managehome => true,
  }
}
