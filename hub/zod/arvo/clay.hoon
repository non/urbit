!:
::  clay (4c), revision control
::
|=  pit=vase
^-  vane
=>
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              section 4cA, filesystem logic         ::
  ::
  |%
  ::
  ++  un                                                ::  per ship
    |=  [who=@p now=@da ruf=raft]
    =+  ^=  yar  ^-  room
        =+  yar=(~(get by fat.ruf) who)
        ?~(yar *room u.yar)
    =|  yel=(list ,[p=duct q=card])
    =|  byn=(list ,[p=duct q=riot]) 
    =|  vag=(list ,[p=duct q=card])
    =|  say=(list ,[p=duct q=ship r=[p=@ud q=riff]])
    |%
    ++  abet
      ^-  [(list move) raft]
      :_  ruf(fat (~(put by fat.ruf) who yar))
      ;:  weld
        %+  turn  (flop yel)
        |=([a=duct b=card] [[~ %gold who] hun.yar b])
      ::
        %+  turn  (flop byn) 
        |=([a=duct b=riot] [[~ %gold who] a [%writ b]])
      ::
        %+  turn  (flop vag) 
        |=([a=duct b=card] [[~ %gold who] a b])
      ::
        %+  turn  (flop say) 
        |=([a=duct b=ship c=*] [[~ %gold who] [/a a] [%want b %re c]])
      ==
    ::
    ++  doze
      =+  saz=(turn (~(tap by dos.yar) ~) |=([a=@tas b=*] a))
      =|  nex=(unit ,@da)
      |-  ^+   nex
      ?~  saz  nex
      $(saz t.saz, nex (hunt nex doze:(di i.saz)))
    ::
    ++  wake
      ^+  .
      =+  saz=(turn (~(tap by dos.yar) ~) |=([a=@tas b=*] a))
      |-  ^+  ..wake
      ?~  saz  ..wake
      $(saz t.saz, ..wake abet:wake:(di i.saz))
    ::
    ++  de                                              ::  per desk
      |_  [for=@p syd=@ta rede]
      ::
      ++  abet
        ?:  =(for who)
          %_(..de dos.yar (~(put by dos.yar) syd qyx dom))
        %_    ..de
            rid.yar
          =+  ^=  rob   ^-  (map ,@tas rede)
              =+  rob=(~(get by rid.yar) for)
              ?~(rob ~ u.rob)
          (~(put by rid.yar) for (~(put by rob) syd `rede`+<+>.abet))
        ==
      ++  aeon                                          ::  act count through
        |=  lok=case
        ^-  (unit ,@ud)
        ?-    -.lok
            %da
          ?:  (gth p.lok lim)  ~
          |-  ^-  (unit ,@ud)
          ?~  hit.dom  [~ let.dom]
          ?:  (gte p.lok p.i.hit.dom)  [~ let.dom]
          $(hit.dom t.hit.dom, let.dom (dec let.dom))
        :: 
            %tas  (~(get by lab.dom) p.lok)
            %ud   ?:((gth p.lok let.dom) ~ [~ p.lok])
        ==
      ::
      ++  ache                                          ::  arch report
        ^-  arch
        :+  p.ank.dom
          ?~(q.ank.dom ~ [~ p.u.q.ank.dom])
        |-  ^-  (map ,@ta ,~)
        ?~  r.ank.dom  ~
        [[p.n.r.ank.dom ~] $(r.ank.dom l.r.ank.dom) $(r.ank.dom r.r.ank.dom)]
      ::
      ++  amor                                          ::  endpoint query
        |=  ren=?(%x %y %z)
        ^-  (unit ,*)
        ?-  ren
          %x  ?~(q.ank.dom ~ [~ q.u.q.ank.dom])
          %y  [~ ache]
          %z  [~ ank.dom]
        ==
      ::
      ++  ante                                          ::  rewind by change
        |=  lem=maki
        ^+  +>
        ?-    -.lem
            &
          %_  +>
            ank.dom  ?.  ?=(& -.p.lem)  ank.dom
                     ank:(dusk:(zu ank.dom) p.p.lem)
            lab.dom  ?.  ?=(| -.p.lem)  lab.dom
                     (~(del by lab.dom) p.p.lem)
          ==
        ::
            |
          |-  ^+  +>.^$
          ?~  s.p.lem  +>.^$
          $(s.p.lem t.s.p.lem, +>.^$ ^$(lem i.s.p.lem))
        ==
      ::
      ++  argo                                          ::  rewind to aeon
        |=  oan=@ud
        ^+  +>
        ?:  =(let.dom oan)  +>
        ?>  ?=(^ hit.dom)
        ?>  ?=(& -.q.i.hit.dom)
        =>  .(+> (ante q.i.hit.dom))
        $(let.dom (dec let.dom), hit.dom t.hit.dom)
      ::
      ++  auto                                          ::  read at point
        |=  mun=mood
        ^-  (unit)
        ?:  ?=(%v p.mun)
          [~ dom]
        ?:  &(?=(%w p.mun) !?=(%ud -.q.mun))
          ?^(r.mun ~ [~ let.dom])
        ?:  ?=(%w p.mun)
          ?>  ?=(^ hit.dom)  ?^(r.mun ~ [~ i.hit.dom])
        (amor(ank.dom ank:(deny:(zu ank.dom) r.mun)) p.mun)
      ::
      ++  aver                                          ::  domestic read 
        |=  mun=mood
        ^-  (unit (unit ,*))
        =+  ezy=?~(ref ~ (~(get by haw.u.ref) mun))
        ?^  ezy  [~ ezy]
        =+  nao=(aeon q.mun)
        ?~(nao ~ [~ (avid u.nao mun)])
      ::
      ++  avid                                          ::  seek and read
        |=  [oan=@ud mun=mood]
        ^-  (unit)
        ?:  &(?=(%w p.mun) !?=(%ud -.q.mun))            ::  NB optimization
          ?^(r.mun ~ [~ oan])
        (auto:(argo oan) mun)
      ::
      ++  balk                                          ::  read and send
        |=  [hen=duct oan=@ud mun=mood]
        ^+  +>
        =+  vid=(avid oan mun)
        ?~  vid  (blob hen)  (blab hen mun u.vid)
      ::
      ++  blab                                          ::  ship result
        |=  [hen=duct mun=mood dat=*]
        ^+  +>
        +>(byn [[hen ~ [p.mun q.mun syd] r.mun dat] byn])
      ::
      ++  bleb                                          ::  ship sequence
        |=  [hen=duct ins=@ud hip=(list frog)]
        ^+  +>
        ?~  hip  +>
        %=  $
          hip  t.hip
          ins  +(ins)
          +>   (blab hen [%w [%ud ins] ~] i.hip)
        == 
      ::
      ++  blob                                          ::  ship stop
        |=  hen=duct
        %_(+> byn [[hen ~] byn])
      ::
      ++  doze                                          ::  sleep until
        =+  xiq=(~(tap by qyx) ~)
        =|  nex=(unit ,@da)
        |-  ^+  nex
        ?~  xiq  nex
        =+  ^=  zis  ^+  nex
            ?-    -.q.i.xiq
                &  ?.(?=(%da -.q.p.q.i.xiq) ~ [~ p.q.p.q.i.xiq])
            ::
                |
              =+  mot=`moat`p.q.i.xiq
              %+  hunt
                ?.(&(?=(%da -.p.mot) (lth now p.p.mot)) ~ [~ p.p.mot])
              ?.(&(?=(%da -.q.mot) (lth now p.q.mot)) ~ [~ p.q.mot])
            ==
        $(xiq t.xiq, nex (hunt nex zis))
      ::
      ++  duce                                          ::  produce request
        |=  [hen=duct rav=rave]
        ^+  +>
        =.  qyx  (~(put by qyx) hen rav)
        ?~  ref  +>
        =+  ^=  vaw  ^-  rave
          ?.  ?=([%& %v *] rav)  rav
          [%| [%ud let.dom] `case`q.p.rav]
        ~&  [%duce-rave vaw]
        =+  inx=nix.u.ref
        %=  +>.$
          nix.u.ref  +(nix.u.ref)
          bom.u.ref  (~(put by bom.u.ref) inx [hen vaw])
          fod.u.ref  (~(put by fod.u.ref) hen inx)
        ==
      ::
      ++  ease                                          ::  release request
        |=  hen=duct
        ^+  +>
        =.  qyx  (~(del by qyx) hen)
        ?~  ref  +>
        =+  nux=(~(get by fod.u.ref) hen)
        ?~  nux  +>.$
        %=  +>.$
          say        [[[[%c (scot %ud u.nux) ~] hen] for [u.nux syd ~]] say]
          fod.u.ref  (~(del by fod.u.ref) hen)
          bom.u.ref  (~(del by bom.u.ref) u.nux)
        ==
      ::
      ++  eave                                          ::  subscribe
        |=  [hen=duct rav=rave]
        ^+  +>
        ?-    -.rav
            &
          =+  ver=(aver p.rav)
          ?~  ver  
            (duce hen rav)
          ?~  u.ver
            (blob hen)
          (blab hen p.rav u.u.ver)
        ::
            |
          =+  nab=(aeon p.p.rav)
          ?~  nab
            ?>  =(~ (aeon q.p.rav))
            (duce hen rav)
          =+  huy=(aeon q.p.rav)
          ?:  &(?=(^ huy) |((lth u.huy u.nab) &(=(0 u.huy) =(0 u.nab))))
            (blob hen)
          =+  top=?~(huy let.dom u.huy)
          =+  seb=(slag (sub let.dom top) hit.dom)
          =+  wid=(sub top u.nab)
          =+  fud=(flop (scag wid seb))
          =.  +>.$  (bleb hen u.nab fud)
          ?^  huy 
            (blob hen)
          =+  ^=  ptr  ^-  case
              ?:  =(0 u.nab)  [%da @da]
              =+(old=(slag wid seb) ?>(?=(^ old) `case`[%da p.i.old]))
          (duce hen `rave`[%| ptr q.p.rav])
        ==
      ::
      ++  edit                                          ::  apply changes
        |=  [hen=duct wen=@da lem=maki]
        ^+  +>
        ?-    -.lem
            & 
          %=    +>.$
              ank.dom  ?.  ?=(& -.p.lem)  ank.dom 
                       ank:(durn:(zu ank.dom) p.p.lem)
              let.dom  +(let.dom)
              hit.dom  :_(hit.dom [wen lem])
              lab.dom  ?.  ?=(| -.p.lem)  lab.dom
                       ?<  (~(has by lab.dom) p.p.lem)
                       (~(put by lab.dom) p.p.lem let.dom)
              vag      
            ?~(hez.yar vag :_(vag [u.hez.yar [%ergo who syd +(let.dom)]]))
          ::
              yel      
            =+  pre=`path`~[(scot %p for) syd (scot %ud +(let.dom))]
            ?-  -.p.lem
              |  :_  yel
                 [hen %note '=' %leaf :(weld (trip p.p.lem) " " (spud pre))]
              &  |-  ^+  yel
                 ?~  q.p.p.lem  yel
                 :_  $(q.p.p.lem t.q.p.p.lem)
                 :-  hen
                 :+  %note
                   ?-(-.q.i.q.p.p.lem %del '-', %ins '+', %mut ':')
                 [%leaf (spud (weld pre p.i.q.p.p.lem))]
            ==
          ==
        ::
            |  
          |-  ^+  +>.^$
          ?~  s.p.lem  +>.^$
          $(s.p.lem t.s.p.lem, +>.^$ ^$(lem i.s.p.lem))
        ==
      ::
      ++  exec                                          ::  change and update
        |=  [hen=duct wen=@da lem=maki]
        ^+  +>
        wake:(edit hen wen lem)
      ::
      ++  knit                                          ::  external change
        |=  [hen=duct inx=@ud rot=riot]
        ^+  +>
        =+  ruv=(~(get by bom.u.ref) inx)
        ?~  ruv  +>.$
        =>  ?.  |(?=(~ rot) ?=(& -.q.u.ruv))  .
            %_  . 
              bom.u.ref  (~(del by bom.u.ref) inx)
              fod.u.ref  (~(del by fod.u.ref) p.u.ruv)
            ==
        ?~  rot
          =+  rav=`rave`q.u.ruv
          ?.  &(?=(| -.rav) ?=(%da -.q.p.rav))  +>.$
          +>.$(lim `@da`p.q.p.rav)
        ?<  ?=(%v p.p.u.rot)
        =.  haw.u.ref
          (~(put by haw.u.ref) [p.p.u.rot q.p.u.rot q.u.rot] r.u.rot)
        ?.  ?=(%w p.p.u.rot)  +>.$
        |-  ^+  +>.^$
        =+  nez=[%w [%ud let.dom] ~]
        =+  nex=(~(get by haw.u.ref) nez)
        ?~  nex  +>.^$
        %=  $
          haw.u.ref  (~(del by haw.u.ref) nez)
          +>.^$      (edit hen ((hard frog) u.nex))
        ==
      ::
      ++  wake                                          ::  update subscribers
        ^+  .
        =+  xiq=(~(tap by qyx) ~)
        =|  xaq=(list ,[p=duct q=rave])
        |-  ^+  ..wake
        ?~  xiq  ..wake(qyx (~(gas by *cult) xaq))
        ?-    -.q.i.xiq
            &
          =+  cas=?~(ref ~ (~(get by haw.u.ref) `mood`p.q.i.xiq))
          ?^  cas  (blab p.i.xiq p.q.i.xiq u.cas)
          =+  nao=(aeon q.p.q.i.xiq)
          ?~  nao  $(xiq t.xiq, xaq [i.xiq xaq])
          $(xiq t.xiq, ..wake (balk p.i.xiq u.nao p.q.i.xiq))
        ::
            |
          =+  mot=`moat`p.q.i.xiq
          =+  nab=(aeon p.mot)
          ?:  |(?=(~ nab) =(let.dom u.nab))
            $(xiq t.xiq, xaq [i.xiq xaq])
          ?>  (gte let.dom u.nab)
          ?>  ?=(^ hit.dom)
          =+  huy=(aeon q.mot)
          ?~  huy
            =+  ptr=[%da p.i.hit.dom]
            =+  fud=(flop (scag (sub let.dom u.nab) `(list frog)`hit.dom))
            %=  $
              xiq     t.xiq
              xaq     [[p.i.xiq [%| ptr q.mot]] xaq]
              ..wake  (bleb p.i.xiq let.dom fud)
            ==
          =+  yad=(slag (sub let.dom u.huy) `(list frog)`hit.dom)
          =+  fud=(flop (scag (sub u.huy u.nab) yad))
          %=  $
            xiq     t.xiq
            ..wake  (blob:(bleb p.i.xiq +(u.nab) fud))
          ==
        ==
      --
    ::
    ++  di
      |=  syd=@ta
      =+  ^=  saq  ^-  desk
          =+  saq=(~(get by dos.yar) syd)
          ?~(saq *desk u.saq)
      ~(. de who syd now p.saq ~ q.saq)
    ::
    ++  do
      |=  [him=ship syd=@tas]
      =+  ^=  red  ^-  rede
          =+  roy=(~(get by rid.yar) him)
          =+  yit=?~(roy ~ (~(get by u.roy) syd))
          ?^(yit u.yit `rede`[now ~ [~ *rind] *dome])
      ~(. de him syd red)
    --
  --
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              section 4cA, filesystem vane          ::
  ::                                                    ::
  =|                                                    ::  instrument state
      $:  ruf=raft                                      ::  revision tree
      ==                                                ::
  |=  [now=@da eny=@ sky=||(* (unit))]                  ::  activate
  ^?                                                    ::  opaque core
  |%                                                    ::
  ++  beat                                              ::  update
    |=  [wru=(unit writ) tea=wire hen=duct fav=curd]
    =>  .(fav ((hard card) fav))
    ^-  [p=(list move) q=vane]
    ?+    -.fav  [[[wru hen fav] ~] ..^$]
        %crud
      [[[wru [/d hen] %flog fav] ~] ..^$]
    ::
        %deem
      =.  wru  
          ?^  wru  wru
          ?.  =(%gold (adit hen))  ~
          [~ %gold p.fav] 
      $(fav q.fav)
    ::
        %init
      ::  [[%tell %0 %leaf "clay: home for {~(rend co ~ %p q.u.wru)}"] ~]
      [~ ..^$(fat.ruf (~(put by fat.ruf) q.u.wru [hen ~ ~ ~]))]
    ::
        ?(%into %info)
      =.  wru  
          ?^  wru  wru
          ?.  =(%gold (adit hen))  ~
          [~ %gold p.fav] 
      ?>  =(q.u.wru p.fav)
      ?:  =(%$ q.fav)
        ?.  ?=(%into -.fav)  [~ ..^$]
        =+  yar=(need (~(get by fat.ruf) p.fav))
        [~ ..^$(fat.ruf (~(put by fat.ruf) p.fav yar(hez [~ hen])))]
      =^  mos  ruf  
        =+  ^=  zot
          abet:(exec:(di:wake:(un q.u.wru now ruf) q.fav) hen now [%& r.fav])
        abet:zot(hez.yar ?.(=(%into -.fav) hez.yar.zot [~ hen]))
      [mos ..^$]
    ::
        %warp
      ?>  ?=(^ wru)
      =^  mos  ruf
        =<  abet
        =+  une=(un q.u.wru now ruf)
        =+  wex=?.(=(q.u.wru p.fav) (do:une p.fav p.q.fav) (di:une p.q.fav))
        ?~  q.q.fav
          abet:(ease:wex hen)
        abet:(eave:wex hen u.q.q.fav)
      [mos ..^$]
    ::
        %wart
      ?>  ?=(%ru q.fav)
      ?~  s.fav  [~ ..^$]
      =^  mos  ruf
        =<  abet
        =<  abet
        %.  [hen ((hard ,[@ud riot]) u.s.fav)]
        knit:(do:(un q.u.wru now ruf) p.fav q.fav)
      [mos ..^$]
    ::
        %went                             ::  XX should actually propagate
      ?:  =(%good q.fav)  [~ ..^$]
      ~&  [%clay-lost tea]
      [~ ..^$]
    ::
        %wake
      =+  dal=(turn (~(tap by fat.ruf) ~) |=([a=@p b=room] a))
      =|  mos=(list move)
      |-  ^-  [p=(list move) q=vane]
      ?~  dal  [mos ..^^$(las.ruf now)] 
      =^  som  ruf  abet:wake:(un i.dal now ruf)
      $(dal t.dal, mos (weld som mos))
    ==
  ::
  ++  come  
    |=  old=vase
    ^-  vane
    ~|(%load-nest-clay !!)
  ::
  ++  doze
    |=  [now=@da hen=duct]
    =|  nex=(unit ,@da)
    =+  dal=(turn (~(tap by fat.ruf) ~) |=([a=@p b=room] a))
    |-  ^+  nex
    ?~  dal  nex
    $(dal t.dal, nex (hunt nex doze:(un i.dal now ruf)))
  ::
  ++  flee  stay
  ::
  ++  load
    |=  new=vase
    ^-  vane
    ?.  (~(nest ut -:!>(ruf)) & p.new)
      (come new) 
    ..^$(ruf (raft q.new))
  ::
  ++  raze
    ^-  vane
    ..$(ruf *raft)
  ::
  ++  scry                                              ::  inspect
    |=  [our=ship ron=@tas his=ship syd=disc lot=coin tyl=path]
    ^-  (unit)
    =+  luk=?.(?=(%$ -.lot) ~ ((soft case) p.lot))
    =+  run=((soft care) ron)
    ?~  luk  ~
    ?~  run  ~
    =+  ^=  vyr
      =+  une=(un our now ruf)
      %.  [u.run u.luk tyl]
      =<(aver ?.(=(our his) (do:une his syd) (di:une syd)))
    ?~(vyr ~ u.vyr)
  ::
  ++  stay  `vase`!>(ruf)
  --
